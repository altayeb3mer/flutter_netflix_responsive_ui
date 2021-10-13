import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
            mobile: _CustomAppBarMobile(), desktop: _CustomAppBarDesktop()));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: 'TV Shows', function: () => print('TV Sows')),
                _AppBarButton(title: 'Movies', function: () => print('Movies')),
                _AppBarButton(
                    title: 'My List', function: () => print('My List')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Home', function: () => print('Home')),
                _AppBarButton(
                    title: 'TV Shows', function: () => print('TV Sows')),
                _AppBarButton(title: 'Movies', function: () => print('Movies')),
                _AppBarButton(title: 'Latest', function: () => print('Latest')),
                _AppBarButton(
                    title: 'My List', function: () => print('My List')),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => print('Search'),
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 28.0,
                ),
                _AppBarButton(
                    title: 'KIDS', function: () => print('KIDS')),
                _AppBarButton(title: 'DVD', function: () => print('DVD')),
                IconButton(
                  onPressed: () => print('Gift'),
                  icon: Icon(Icons.card_giftcard),
                  color: Colors.white,
                  iconSize: 28.0,
                ),
                IconButton(
                  onPressed: () => print('Notifications'),
                  icon: Icon(Icons.notifications),
                  color: Colors.white,
                  iconSize: 28.0,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function function;

  const _AppBarButton({Key key, @required this.title, @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: function,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
