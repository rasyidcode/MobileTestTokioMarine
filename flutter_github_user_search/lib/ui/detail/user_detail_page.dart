import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_bloc.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_state.dart';
import 'package:flutter_github_user_search/ui/search/user/widgets/centered_text.dart';
import 'package:kiwi/kiwi.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailPage extends StatefulWidget {
  final String login;
  const UserDetailPage({required this.login, Key? key}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final _userDetailBloc = KiwiContainer().resolve<UserDetailBloc>();

  @override
  void initState() {
    super.initState();
    _userDetailBloc.onShowUserDetail(login: widget.login);
  }

  @override
  void dispose() {
    super.dispose();
    _userDetailBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _userDetailBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Detail'),
          centerTitle: true,
        ),
        body: BlocBuilder(
          bloc: _userDetailBloc,
          builder: (BuildContext context, UserDetailState state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.isSuccessful) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Hero(
                                tag: state.userDetail != null
                                    ? state.userDetail!.login
                                    : '',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90.0),
                                  child: Image.network(
                                    state.userDetail!.avatarUrl,
                                    width: 180.0,
                                    height: 180.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      state.userDetail!.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      state.userDetail!.login,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      state.userDetail!.bio,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 14.0,
                                          ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'followers',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                state.userDetail!.followersCount
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                    ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'following',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                state.userDetail!.followingCount
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                    ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'repo',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                state.userDetail!.repoCount
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                    ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    Row(
                                      children: [
                                        Icon(Icons.map),
                                        SizedBox(width: 8.0),
                                        Text(
                                          state.userDetail!.location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w100,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.0),
                                    Row(
                                      children: [
                                        Icon(Icons.location_city),
                                        SizedBox(width: 8.0),
                                        Text(
                                          state.userDetail!.company ?? '-',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w100,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    MaterialButton(
                                      color: Colors.blue,
                                      child: Text('Visit User Profile'),
                                      onPressed: () async {
                                        final userProfileUrl =
                                            state.userDetail!.profileUrl;
                                        if (await canLaunch(userProfileUrl)) {
                                          launch(userProfileUrl);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
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
}
