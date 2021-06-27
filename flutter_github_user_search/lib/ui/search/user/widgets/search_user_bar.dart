import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_bloc.dart';

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
