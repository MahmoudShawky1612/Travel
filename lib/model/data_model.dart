class DataModel{
  late String name;
  late String img;
  late String price;
  late String people;
  late String stars;
  late String description;
  late String location;

  DataModel({required this.name
    ,required this.price,
    required this.img,
    required this.description,
    required this.location,
    required this.people,
    required this.stars});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'] as String,
      price: json['price'].toString(), // Convert integer to string
      img: json['img'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      people: json['people'].toString(), // Convert integer to string
      stars: json['stars'].toString(), // Convert integer to string
    );
  }

}








