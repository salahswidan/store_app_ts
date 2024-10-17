// class ProductModel {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String image;
//   final RatingModel rating;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.image,
//     required this.rating
//   });

//   factory ProductModel.fromJson(jsonData) {
//     return ProductModel(
//         id: jsonData['id'],
//         title: jsonData['title'],
//         price: jsonData['price'] ,
//         description: jsonData['description'],
//         image: jsonData['image'],
//         rating: RatingModel.fromJson(jsonData['rating']));
//   }
// }

// class RatingModel {
//   final double rate;
//   final int count;

//   RatingModel({required this.rate, required this.count});

//   factory RatingModel.fromJson(jsonData) {
//     return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
//   }
// }

class ProductModel {
  final int id;
  final String title;
  final double price; // Ensure this is always a double
  final String description;
  final String image;
  final RatingModel rating;
  final String category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,
      required this.category});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      // Handle price being either int or double
      price: (jsonData['price'] is int)
          ? (jsonData['price'] as int).toDouble()
          : jsonData['price'] as double,
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate; // Ensure this is always a double
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      // Handle rate being either int or double
      rate: (jsonData['rate'] is int)
          ? (jsonData['rate'] as int).toDouble()
          : jsonData['rate'] as double,
      count: jsonData['count'],
    );
  }
}
