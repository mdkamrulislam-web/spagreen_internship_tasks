import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/design_tasks/task_1_card_design/restaurant_card_design.dart';

class CardsList extends StatefulWidget {
  const CardsList({Key? key}) : super(key: key);
  static const String id = "cards_list_screen";
  @override
  _CardsListState createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cards List",
                  style: Theme.of(context).textTheme.headline2!,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RestaurantCard.id);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Restaurant App Card",
                      style: TextStyle(fontSize: 20),
                    ),
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
