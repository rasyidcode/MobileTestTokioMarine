import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_args.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_bloc.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_state.dart';
import 'package:flutter_github_user_search/ui/search/user/widgets/centered_text.dart';
import 'package:flutter_github_user_search/ui/search/user/widgets/search_user_bar.dart';
import 'package:kiwi/kiwi.dart';

class SearchUserPage extends StatefulWidget {
  SearchUserPage({Key? key}) : super(key: key);

  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final SearchUserBloc _searchUserBloc =
      KiwiContainer().resolve<SearchUserBloc>();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _searchUserBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _searchUserBloc,
      child: Scaffold(
        appBar: AppBar(
          title: SearchUserBar(),
        ),
        body: BlocBuilder(
          bloc: _searchUserBloc,
          builder: (BuildContext context, SearchUserState state) {
            if (state.isInitial) {
              return CenteredText(
                message: 'Find Github User!',
                icon: Icons.sentiment_satisfied_alt_sharp,
              );
            }

            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.isSuccessful) {
              return _buildResultUsersList(state);
            } else {
              return CenteredText(
                message: state.error,
                icon: Icons.error_outline,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildResultUsersList(SearchUserState state) {
    return NotificationListener(
      onNotification: (ScrollNotification notif) {
        if (notif is ScrollEndNotification &&
            _scrollController.position.extentAfter == 0) {
          _searchUserBloc.fetchNextUsersPage();
        }
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: state.hasReachedEndOfResults
              ? state.users.length
              : state.users.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index >= state.users.length
                ? Center(child: CircularProgressIndicator())
                : _buildUserListItem(
                    state.users[index],
                  );
          },
        ),
      ),
    );
  }

  Widget _buildUserListItem(GithubUser user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/user_detail',
              arguments: UserDetailArgs(
                (b) => b..login = user.login,
              ),
            );
          },
          leading: Hero(
            tag: user.login,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 30.0,
            ),
          ),
          title: Text(
            user.login,
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
