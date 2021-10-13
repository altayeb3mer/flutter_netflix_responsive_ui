import 'package:flutter_netflix_responsive_ui/models/model_offset.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OffsetController extends StateNotifier<ModelOffset>{
  OffsetController([ModelOffset state]) : super(state ?? _initialValue);

  static const  _initialValue = ModelOffset(0.0);


   void updateOffset (ModelOffset _offset){
     state = _offset;
   }

}