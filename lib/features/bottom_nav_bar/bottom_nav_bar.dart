import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/presentation/pages/home_page.dart';

import '../favorites/presentation/pages/favorites_page.dart';

BottomAppBar bottomNavBar({context, isHomePage}) {
  return BottomAppBar(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: IconButton(
            onPressed:() {
              Navigator.pop(context);
              Navigator.pushNamed(context, HomePage.title);
              },
            icon: Icon(
              Icons.home,
              color: isHomePage ? Colors.purpleAccent : Colors.white,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: 25.0,
          width: 0.5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, FavoritesPage.title,);
              },
              icon: Icon(CupertinoIcons.heart_fill, color: isHomePage ? Colors.white : Colors.purpleAccent,)),
        )
      ],
    ),
  );
}