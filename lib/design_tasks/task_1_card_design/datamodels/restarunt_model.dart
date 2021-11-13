class RestaurantModel {
  final String title, image;
  final double rating;
  //  itemCount;

  RestaurantModel({
    required this.title,
    required this.image,
    required this.rating,
    // required this.itemCount,
  });
}

List<RestaurantModel> restaurantModels = [
  RestaurantModel(
    title: "Burger King",
    image: "assets/images/restaurant-items/burger1.jpg",
    rating: 4.5,
  ),
  RestaurantModel(
    title: "Chillox",
    image: "assets/images/restaurant-items/burger2.jpg",
    rating: 4.8,
  ),
  RestaurantModel(
    title: "Takeout",
    image: "assets/images/restaurant-items/burger3.jpg",
    rating: 4.6,
  ),
  RestaurantModel(
    title: "Madchef",
    image: "assets/images/restaurant-items/burger4.jpg",
    rating: 4.7,
  ),
  RestaurantModel(
    title: "American Burger",
    image: "assets/images/restaurant-items/burger5.jpg",
    rating: 4.2,
  ),
];
