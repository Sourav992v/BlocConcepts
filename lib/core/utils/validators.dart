class Validators{
  static String? title(String value){
    if(value.isEmpty) return "Title is required";
    return null;
  }

  static String? price(int value){
    if(value < 0) return "Invalid price";
    return null;
  }
}