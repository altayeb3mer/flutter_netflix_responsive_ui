import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/controller/offset_controller.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/models/model_offset.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_header.dart';
import 'package:flutter_netflix_responsive_ui/widgets/content_list.dart';
import 'package:flutter_netflix_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/widgets/previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final offsetProvider = StateNotifierProvider<OffsetController>((ref) {
  return OffsetController();
});

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget{

  HomeScreen({Key key}) : super(key: key);

  ScrollController _scrollController;

  OffsetController _offsetController;

  // double _offset;

  ModelOffset _modelOffset;





  @override
  Widget build(BuildContext context, ScopedReader watch) {


    // _offset =watch(offsetProvider.state).offset;
    _modelOffset =watch(offsetProvider.state);
    _offsetController = watch(offsetProvider);

    _scrollController = ScrollController()..addListener(() {
      _modelOffset = ModelOffset(_scrollController.offset);
      print('###scroll offset###'+_modelOffset.offset.toString());
      _offsetController.updateOffset(_modelOffset);
    });

    return _build(context);

  }


  Widget _build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('cast'),
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.cast,
          color: Colors.white,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffset: _modelOffset.offset,
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
              child: Previews(
                  key: PageStorageKey('Previews'),
                  title: 'Previews',
                  contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('myList'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 70.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('trending'),
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



