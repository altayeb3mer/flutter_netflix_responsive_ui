import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_header.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_list.dart';
import 'package:flutter_netflix_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/widgets/previews.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('cast'),
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.cast,color: Colors.white,),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(title: 'Previews', contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 70.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
