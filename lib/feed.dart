import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/drawer_widget.dart';
import 'package:twitter/pfp.dart';
import 'package:twitter/theme.dart';
import 'providers.dart';
import 'tweet.card.dart';

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
                ListView.separated(
                  itemCount: app.tweets.length,
                  itemBuilder: (context, index) {
                    return TweetCard(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
                ListView.separated(
                  itemCount: app.tweets.length,
                  itemBuilder: (context, index) {
                    return TweetCard(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
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