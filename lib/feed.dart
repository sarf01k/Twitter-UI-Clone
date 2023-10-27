import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer_widget.dart';
import 'pfp.dart';
import 'theme.dart';
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
              return [
                SliverAppBar(
                  centerTitle: true,
                  title: Image.asset('assets/images/x_logo.png', color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, height: MediaQuery.of(context).size.height * .04),
                  leading: const ProfilePic(),
                  bottom: TabBar(
                    labelStyle: selectedLabel,
                    unselectedLabelStyle: unselectedLabel,
                    labelColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                    indicatorColor: const Color(0xFF1C9BF0),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    tabs: const [
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
        backgroundColor: const Color(0xFF1C9BF0),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      )
    );
  }
}