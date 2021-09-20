import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onTap;

  const VerticalIcon({Key key, this.iconData, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(iconData,color: Colors.white,),
          SizedBox(height: 2.0,),
          Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
