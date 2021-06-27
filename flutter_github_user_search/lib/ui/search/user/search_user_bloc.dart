import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/data/exceptions/all_exceptions.dart';
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
      yield* mapSearchInitiated(event);
    } else if (event is FetchNextPage) {
      yield* mapFetchNextPage();
    }
  }

  Stream<SearchUserState> mapSearchInitiated(SearchInitiated event) async* {
    if (event.query.isEmpty) {
      yield SearchUserState.initial();
    } else {
      yield SearchUserState.loading();

      try {
        final searchResult =
            await _githubRepository.searchUsers(query: event.query);
        yield SearchUserState.success(searchResult);
      } on SearchReturnsNullException catch (e) {
        yield SearchUserState.failure(e.message);
      } on NoSuchResultException catch (e) {
        print('error...');
        print(e.message);
        yield SearchUserState.failure(e.message);
      } on GithubErrorException catch (e) {
        yield SearchUserState.failure(e.message);
      } on GithubUnknownErrorException catch (e) {
        yield SearchUserState.failure(e.message);
      } catch (e) {
        yield SearchUserState.failure('Something went wrong');
      }
    }
  }

  Stream<SearchUserState> mapFetchNextPage() async* {
    try {
      final nextPageUsers = await _githubRepository.nextPageUsers();
      yield SearchUserState.success(state.users + nextPageUsers);
    } on SearchUserNotInitException catch (e) {
      yield SearchUserState.failure(e.message);
    } on NoNextPageUsersException catch (_) {
      yield state.rebuild((b) => b..hasReachedEndOfResults = true);
    } on SearchReturnsNullException catch (e) {
      yield SearchUserState.failure(e.message);
    } on NoSuchResultException catch (e) {
      yield SearchUserState.failure(e.message);
    } on GithubErrorException catch (e) {
      yield SearchUserState.failure(e.message);
    } on GithubUnknownErrorException catch (e) {
      yield SearchUserState.failure(e.message);
    } catch (e) {
      yield SearchUserState.failure('Something went wrong');
    }
  }
}
