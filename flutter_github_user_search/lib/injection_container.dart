import 'package:flutter_github_user_search/data/network/github_data_source.dart';
import 'package:flutter_github_user_search/data/repository/github_repository.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_bloc.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:http/http.dart' as http;

void initKiwi() {
  KiwiContainer()
    ..registerInstance(http.Client())
    ..registerFactory((container) => GithubDataSource(container.resolve()))
    ..registerFactory((container) => GithubRepository(container.resolve()))
    ..registerFactory((container) => SearchUserBloc(container.resolve()))
    ..registerFactory((container) => UserDetailBloc(container.resolve()));
}
