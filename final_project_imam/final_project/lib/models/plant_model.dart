class Plant {
  late String name;
  late double price;
  late String image;
  late String type;
  late String description;
  late double rating;
  Plant(this.type, this.rating, this.description, this.image, this.name,
      this.price);

  Plant.fromJson(Map json) {
    name = json['name'];
    price = json['price'];
    image = json['image_url'];
    type = json['type'];
    description = json['description'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'image_url': image,
        'type': type,
        'description': description,
        'rating': rating,
      };
}


//  {
//     "name": "Peperomia Obtusfolia",
//     "price": 19.99,
//     "image_url":
//         "https://peppyflora.com/wp-content/uploads/2020/12/Peperomia-Obtusifolia-Baby-Rubberplant-3x4-Product-Peppyflora-01-b-Moz.jpg",
//     "type": "Indoor Plant",
//     "description":
//         "Peperomia Obtusfolia, also known as Baby Rubber Plant, is a compact succulent with glossy green leaves. It is perfect for small spaces and requires minimal maintenance.",
//     "rating": 4.0,
//   },