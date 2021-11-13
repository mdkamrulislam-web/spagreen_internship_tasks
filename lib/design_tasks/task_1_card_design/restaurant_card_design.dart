import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/design_tasks/task_1_card_design/datamodels/restarunt_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurantModel;
  static const String id = "restaurant_card";
  const RestaurantCard({
    Key? key,
    required this.size,
    required this.restaurantModel,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            height: size.height / 2.5,
            width: size.height / 3.75,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(restaurantModel.image),
                  ),
                ),
                Container(
                  height: size.height / 2.5,
                  width: size.height / 3.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white.withOpacity(.3),
                            ),
                            height: size.height / 20,
                            width: size.height / 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  restaurantModel.rating.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: size.width / 70,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Color(0xffe3c579),
                                ),
                                const Text(
                                  "(50+)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: size.width / 24,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              color: const Color(0xfffe7156),
                              size: size.width / 20,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            height: size.height / 30,
                            width: size.height / 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(.4),
                            ),
                            child: const Center(
                              child: Text(
                                "AMERICAN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 50,
                          ),
                          Container(
                            height: size.height / 30,
                            width: size.height / 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(.4),
                            ),
                            child: const Center(
                              child: Text(
                                "FAST FOOD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 80,
                      ),
                      Text(
                        restaurantModel.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize:
                              Theme.of(context).textTheme.headline5!.fontSize,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 80,
                      ),
                      Text(
                        "Friends were here",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize:
                              Theme.of(context).textTheme.caption!.fontSize,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 80,
                      ),
                      Row(children: [
                        friendsImage(size.height),
                        friendsImage(size.height),
                        friendsImage(size.height),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

friendsImage(h) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
      child: Image.asset(
        "assets/images/friend.png",
        scale: h / 35,
      ),
      height: h / 25,
      width: h / 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xfff7c748),
      ),
    ),
  );
}
