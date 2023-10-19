import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:idcamp_project/item_detail.dart';
import 'package:idcamp_project/model/item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(
          name: "Garam",
          price: 5000.0,
          stock: 50,
          imgUrl: 'salt.jpg',
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          rating: 4.0),
      Item(
          name: "Gula",
          price: 15000.0,
          stock: 60,
          imgUrl: 'sugar.jpg',
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          rating: 4.5),
      Item(
          name: "Beras",
          price: 10000.0,
          stock: 40,
          imgUrl: 'beras.jpg',
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          rating: 4.7),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView.count(
            crossAxisCount: 2,
            children: items
                .map(
                  (item) => ItemGridBox(item: item),
                )
                .toList()),
      ),
    );
  }
}

class ItemGridBox extends StatelessWidget {
  final Item item;
  const ItemGridBox({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetail(item: item),
              ),
            );
          },
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Image.asset('images/${item.imgUrl}'),
                Column(
                  children: [
                    Text(item.name),
                    RatingBarIndicator(
                      rating: item.rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}