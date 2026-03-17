mixin ValidationMixin{

  bool isValidTitle(String title){
    return title.trim().isNotEmpty && title.length >= 3;
  }

  bool isValidPrice(int price){
    return price > 0;
  }


  bool isValidDescription(String description){
    return description.trim().length >= 5;
  }

}