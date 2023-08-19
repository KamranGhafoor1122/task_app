


import 'package:task_app/model/food.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class HomeSearchEvent extends HomeEvent{
  String query;

  HomeSearchEvent(this.query);
}

class HomeFilterEvent extends HomeEvent{
   Category? category;
   Cusine? cusine;
  HomeFilterEvent({this.category, this.cusine});
}

