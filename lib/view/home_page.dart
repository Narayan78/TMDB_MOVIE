import 'package:flutter/material.dart';
import 'package:riverspods/providers/movie_provider.dart';
import 'package:riverspods/view/widgets/tab_bar_widgets.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Watch Now', style: TextStyle(fontSize: 25),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 27,))
                ],
              ),
            ),
          ),
          bottom: TabBar(

             indicatorSize: TabBarIndicatorSize.tab,
            // indicator: BoxDecoration(
            //   color: Colors.red,
            //   borderRadius: BorderRadius.circular(20)
            // ),
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'Top Rated'),
                Tab(text:  'Upcoming',),
              ]
          ),
        ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
              TabBarWidgets(getMovie: moviePopular, pageKey: 'p'),
              TabBarWidgets(getMovie: topRated, pageKey: 't'),
              TabBarWidgets(getMovie: upComing, pageKey: 'u'),
          ]
          )
      ),
    );
  }
}
