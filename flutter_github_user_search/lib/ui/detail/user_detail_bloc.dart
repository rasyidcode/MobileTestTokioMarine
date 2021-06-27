import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/data/exceptions/all_exceptions.dart';
import 'package:flutter_github_user_search/data/repository/github_repository.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_event.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  GithubRepository _githubRepository;

  UserDetailBloc(this._githubRepository) : super(UserDetailState.initial());

  void onShowUserDetail({required String login}) {
    add(ShowUserDetail((b) => b..login = login));
  }

  @override
  Stream<UserDetailState> mapEventToState(UserDetailEvent event) async* {
    if (event is ShowUserDetail) {
      yield UserDetailState.loading();
      print('loading...');
      try {
        final githubUserDetail =
            await _githubRepository.getUserDetail(login: event.login);
        yield UserDetailState.success(githubUserDetail);
        print('done...');
      } on GithubErrorException catch (e) {
        yield UserDetailState.failure(e.message);
      } on GithubUnknownErrorException catch (e) {
        yield UserDetailState.failure(e.message);
      } on UserDetailReturnsNullException catch (e) {
        yield UserDetailState.failure(e.message);
      }
    }
  }
}
