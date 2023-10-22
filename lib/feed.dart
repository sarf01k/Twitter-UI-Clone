import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/drawer_widget.dart';
import 'package:twitter/pfp.dart';
import 'package:twitter/theme.dart';
import 'model/user.dart';
import 'providers.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});
  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return Scaffold(
      drawer: const SafeArea(
        child: DrawerWidget(),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  // floating: true,
                  // pinned: true,
                  centerTitle: true,
                  title: Image.asset('assets/images/x_logo.png', color: Theme.of(context) == darkMode ? Colors.white : Colors.black, height: MediaQuery.of(context).size.height * .04),
                  leading: const ProfilePic(),
                  bottom: const TabBar(
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(text: 'For You'),
                      Tab(text: 'Following')
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: app.tweets.length,
                  itemBuilder: (context, index){
                  return Container(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(app.tweets[index].avatar),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      app.tweets[index].displayName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '@' + app.tweets[index].username + ' · ' + app.tweets[0].timeAgo,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      CupertinoIcons.down_arrow,
                                      size: 14.0,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Text(app.tweets[index].text, overflow: TextOverflow.clip),
                              Container(
                                margin: const EdgeInsets.only(top: 10.0, right: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.comment_outlined,
                                          size: 16.0,
                                          color: Colors.black45,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(6.0),
                                          child: Text(
                                            app.tweets[index].comments,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.recycling_outlined,
                                          size: 16.0,
                                          color: Colors.black45,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(6.0),
                                          child: Text(
                                            app.tweets[index].retweets,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite_outline,
                                          size: 16.0,
                                          color: Colors.black45,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(6.0),
                                          child: Text(
                                            app.tweets[index].likes,
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.share,
                                          size: 16.0,
                                          color: Colors.black45,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );}
                ),
                ListView( // Replace with a scrollable widget (e.g., ListView)
                  children: List.generate(
                    30, // Adjust the number of items as needed
                    (index) => ListTile(title: Text('Item $index')),
                  ),
                )
              ],
            ),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.add),
        onPressed: () {},
      )
    );
  }
}