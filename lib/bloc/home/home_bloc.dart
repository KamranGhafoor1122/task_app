



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/bloc/home/home_events.dart';
import 'package:task_app/bloc/home/home_states.dart';

import '../../model/food.dart';
import '../../services/home_service.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{

  final HomeService homeService;
  HomeBloc({required this.homeService}) : super(HomeLoading()){
    on<HomeEvent>((event, emit) async {
       if(event is HomeInitialEvent){
         emit(HomeLoading());
         await Future.delayed(Duration(seconds: 2),(){});
         emit(HomeInitialState(foods: homeService.foods));
       }
       else if(event is HomeSearchEvent){
         List<Food> homeFoods = homeService.foods;
         List<Food> filteredList = [];

         if(event.query.isEmpty){
           filteredList = homeFoods;
         }
         else{
          filteredList = homeFoods.where((element) => element.name.toLowerCase().contains(event.query.toLowerCase())).toList();
         }
         emit(HomeSearchState(foods: filteredList));
       }

       else if(event is HomeFilterEvent){
         emit(HomeLoading());
         await Future.delayed(Duration(seconds: 2),(){});
         List<Food> homeFoods = homeService.foods;
         List<Food> filteredList = [];

         if(event.cusine == null && event.category == null){
           filteredList=homeFoods;
         }
         else{
           if(event.category != null && event.cusine != null){
             filteredList = homeFoods.where((element) => element.category.id == event.category!.id || element.cusine.id == event.cusine!.id).toList();

           }
            else{
               if(event.category != null){
                 filteredList = homeFoods.where((element) => element.category.id == event.category!.id).toList();
               }
               else if(event.cusine != null){
                 filteredList = homeFoods.where((element) => element.cusine.id == event.cusine!.id).toList();
               }
           }
           }

         emit(HomeFilterState(foods: filteredList));
       }

    });
  }
  
  
  
  
  
}
