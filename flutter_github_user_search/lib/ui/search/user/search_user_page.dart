import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_bloc.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_state.dart';
import 'package:flutter_github_user_search/ui/search/user/widgets/centered_text.dart';
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
                  message: 'message', icon: Icons.error_outline);
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
                : _buildUserListItem(state.users[index]);
          },
        ),
      ),
    );
  }

  Widget _buildUserListItem(GithubUser user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 30.0,
            ),
            title: Text(
              user.login,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchUserBar extends StatefulWidget {
  SearchUserBar({Key? key}) : super(key: key);

  @override
  _SearchUserBarState createState() => _SearchUserBarState();
}

class _SearchUserBarState extends State<SearchUserBar> {
  final TextEditingController _searchUserController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _searchUserController.selection = TextSelection(
            baseOffset: 0, extentOffset: _searchUserController.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: TextField(
          style: TextStyle(color: Colors.black87),
          controller: _searchUserController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Search Users',
            hintStyle: TextStyle(color: Colors.black87),
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          onSubmitted: (searchQuery) {
            BlocProvider.of<SearchUserBloc>(context)
                .onSearchInitiated(searchQuery);
          },
        ),
      ),
    );
  }
}
