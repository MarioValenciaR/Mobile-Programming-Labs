import 'package:flutter/material.dart';

void main() {
  runApp(RecipeCategoriesApp());
}

class RecipeCategoriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeCategoriesScreen(),
    );
  }
}

class RecipeCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Recipe Categories"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // SpaceBetween in Column
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Main Title
              Text(
                "BROWSE CATEGORIES",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              ///Description text
              Text(
                "Not sure about exactly which recipe you’re looking for? Do a search, or dive into our most popular categories.",
                textAlign: TextAlign.left,
              ),

              ///Section "BY MEAT"
              _buildCategoryTitle("BY MEAT"),
              _buildCategoryRow([
                _buildStackedCircleImage("images/beef.jpg", "BEEF"),
                _buildStackedCircleImage("images/chicken.jpg", "CHICKEN"),
                _buildStackedCircleImage("images/pork.jpg", "PORK"),
                _buildStackedCircleImage("images/seafood.jpg", "SEAFOOD"),
              ]),

              ///Section "BY COURSE"
              _buildCategoryTitle("BY COURSE"),
              _buildCategoryRow([
                _buildStackedCircleImageBottom("images/main-dishes.jpg", "Main Dishes"),
                _buildStackedCircleImageBottom("images/salad-recipes.jpg", "Salad Recipes"),
                _buildStackedCircleImageBottom("images/side-dishes.jpg", "Side Dishes"),
                _buildStackedCircleImageBottom("images/crockpot.jpg", "Crockpot"),
              ]),

              ///Section "BY DESSERT"
              _buildCategoryTitle("BY DESSERT"),
              _buildCategoryRow([
                _buildStackedCircleImageBottom("images/ice-cream.jpg", "Ice Cream"),
                _buildStackedCircleImageBottom("images/brownies.jpg", "Brownies"),
                _buildStackedCircleImageBottom("images/pies.jpg", "Pies"),
                _buildStackedCircleImageBottom("images/cookies.jpg", "Cookies"),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  ///Creation of section titles
  Widget _buildCategoryTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// build of a row of categories
  Widget _buildCategoryRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, // applied SpaceAround for uniform spacing
      children: children,
    );
  }

  ///Function for "BY MEAT"
  Widget _buildStackedCircleImage(String imagePath, String label) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 60,
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(4),
            color: Colors.black.withOpacity(0.2),
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  ///Function for "BY COURSE"
  Widget _buildStackedCircleImageBottom(String imagePath, String label) {
    return Stack(
      alignment: Alignment.bottomCenter, // Align text at the bottom center
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 60,
        ),
        Positioned(
          top: 100,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            color: Colors.black, // Background for better readability
            child: Text(
              label,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
