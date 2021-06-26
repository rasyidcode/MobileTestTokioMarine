import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/data/models/search/github_search_error.dart';
import 'package:flutter_github_user_search/data/repository/github_repository.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_event.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  final GithubRepository _githubRepository;

  SearchUserBloc(this._githubRepository) : super(SearchUserState.initial());

  void onSearchInitiated(String query) {
    add(SearchInitiated((b) => b..query = query));
  }

  void fetchNextUsersPage() {
    add(FetchNextPage());
  }

  @override
  Stream<SearchUserState> mapEventToState(SearchUserEvent event) async* {
    if (event is SearchInitiated) {
      if (event.query.isEmpty) {
        yield SearchUserState.initial();
      } else {
        yield SearchUserState.loading();
        print('loading...');
        try {
          final searchResult =
              await _githubRepository.searchUsers(query: event.query);
          yield SearchUserState.success(searchResult);
          print('success...');
        } on SearchReturnsNullException catch (e) {
          yield SearchUserState.failure(e.message);
          print('error...');
        } on NoSuchResultException catch (e) {
          yield SearchUserState.failure(e.message);
          print('error...');
        } on GithubSearchError catch (e) {
          yield SearchUserState.failure(e.message);
          print('error...');
        }
      }
    } else if (event is FetchNextPage) {
      try {
        final nextPageUsers = await _githubRepository.nextPageUsers();
        yield SearchUserState.success(state.users + nextPageUsers);
      } on SearchUserNotInitException catch (e) {
        yield SearchUserState.failure(e.message);
      } on NoNextPageUsersException catch (e) {
        yield state.rebuild((b) => b..hasReachedEndOfResults = true);
      } on SearchReturnsNullException catch (e) {
        yield SearchUserState.failure(e.message);
      } on NoSuchResultException catch (e) {
        yield SearchUserState.failure(e.message);
      } on GithubSearchError catch (e) {
        yield SearchUserState.failure(e.message);
      }
    }
  }
}
