


import '../model/food.dart';

class HomeService{
  List<Food> foods = [
    Food(id: "1", name: "Homemade beef burger", image: "assets/images/foods/food-1.png", category: Category(id: "1", name: "Breakfast"), cusine: Cusine(id: "1", name: "English"), chef: Chef(id: "1", name: "Json fuller", image: "assets/images/chefs/chef-1.png")),
    Food(id: "2", name: "Salad", image: "assets/images/foods/food-2.png", category: Category(id: "1", name: "Breakfast"), cusine: Cusine(id: "2", name: "Italian"), chef: Chef(id: "2", name: "Alice Fala", image: "assets/images/chefs/chef-2.jpg")),
    Food(id: "3", name: "Desi spicy biryani", image: "assets/images/foods/food-3.png", category: Category(id: "2", name: "Lunch"), cusine: Cusine(id: "3", name: "French"), chef: Chef(id: "3", name: "Natalia Luca", image: "assets/images/chefs/chef-3.png")),
    Food(id: "4", name: "Vegetables desi salad", image: "assets/images/foods/food-4.png", category: Category(id: "3", name: "Dinner"), cusine: Cusine(id: "4", name: "Turkesh"), chef: Chef(id: "4", name: "Navabi Bilqis", image: "assets/images/chefs/chef-4.jpg")),
    Food(id: "5", name: "Chocolate Cake", image: "assets/images/foods/food-5.png", category:Category(id: "3", name: "Dinner"), cusine: Cusine(id: "5", name: "Pakistani"), chef: Chef(id: "5", name: "Ellis Perry", image: "assets/images/chefs/chef-5.png")),
  ];


  List<Category> categoriesList = [
    Category(id: "1", name: "Breakfast"),
    Category(id: "2", name: "Lunch"),
    Category(id: "3", name: "Dinner")
  ];
  List<Cusine> cusineList = [
    Cusine(id: "1", name: "English"),
    Cusine(id: "2", name: "Italian"),
    Cusine(id: "3", name: "French"),
    Cusine(id: "4", name: "Turkesh"),
    Cusine(id: "5", name: "Pakistani"),
  ];

}