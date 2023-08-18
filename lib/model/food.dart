

class Food{
  String id,name,image;
  Category category;
  Cusine cusine;
  Chef chef;

  Food({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.cusine,
    required this.chef,
  });
}

class Category{
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });
}


class Cusine{
  String id;
  String name;

  Cusine({
    required this.id,
    required this.name,
  });
}



class Chef{
   String id;
   String name;
   String image;

   Chef({
    required this.id,
    required this.name,
    required this.image,
  });
}






