


import '../../model/food.dart';

abstract class HomeState{}


class HomeLoading extends HomeState{}

class HomeInitialState extends HomeState{
  final List<Food> foods;

  HomeInitialState({required this.foods});
}


class HomeSearchState extends HomeState{
  final List<Food> foods;

  HomeSearchState({required this.foods});
}

class HomeFilterState extends HomeState{
  final List<Food> foods;

  HomeFilterState({required this.foods});
}





