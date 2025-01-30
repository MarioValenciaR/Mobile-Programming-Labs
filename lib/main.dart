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
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ SpaceBetween en Column
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ✅ 1. Título Principal
              Text(
                "BROWSE CATEGORIES",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              /// ✅ 2. Descripción
              Text(
                "Not sure about exactly which recipe you’re looking for? Do a search, or dive into our most popular categories.",
                textAlign: TextAlign.center,
              ),

              /// ✅ 3. Sección "BY MEAT"
              _buildCategoryTitle("BY MEAT"),
              _buildCategoryRow([
                _buildStackedCircleImage("images/beef.jpg", "BEEF"),
                _buildStackedCircleImage("images/chicken.jpg", "CHICKEN"),
                _buildStackedCircleImage("images/pork.jpg", "PORK"),
                _buildStackedCircleImage("images/seafood.jpg", "SEAFOOD"),
              ]),

              /// ✅ 4. Sección "BY COURSE" (Texto alineado a la izquierda, fuera de la imagen)
              _buildCategoryTitle("BY COURSE"),
              _buildCategoryRow([
                _buildImageWithLeftAlignedLabel("images/main-dishes.jpg", "Main Dishes"),
                _buildImageWithLeftAlignedLabel("images/salad-recipes.jpg", "Salad Recipes"),
                _buildImageWithLeftAlignedLabel("images/side-dishes.jpg", "Side Dishes"),
                _buildImageWithLeftAlignedLabel("images/crockpot.jpg", "Crockpot"),
              ]),

              /// ✅ 5. Sección "BY DESSERT" (Texto centrado debajo de la imagen, fuera de la imagen)
              _buildCategoryTitle("BY DESSERT"),
              _buildCategoryRow([
                _buildImageWithCenteredLabel("images/ice-cream.jpg", "Ice Cream"),
                _buildImageWithCenteredLabel("images/brownies.jpg", "Brownies"),
                _buildImageWithCenteredLabel("images/pies.jpg", "Pies"),
                _buildImageWithCenteredLabel("images/cookies.jpg", "Cookies"),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Función para títulos de cada sección
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

  /// 🔹 Función para construir una fila de categorías
  Widget _buildCategoryRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, // ✅ SpaceAround para espaciado uniforme
      children: children,
    );
  }

  /// 🔹 Función para "BY MEAT" (Texto en el centro de la imagen)
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

  /// 🔹 Función para "BY COURSE" (Texto alineado a la izquierda, fuera de la imagen)
  Widget _buildImageWithLeftAlignedLabel(String imagePath, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // ✅ Texto alineado a la izquierda
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 60,
        ),
        SizedBox(height: 5),
        Container(
          width: 80, // ✅ Mantiene el texto alineado
          child: Text(
            label,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  /// 🔹 Función para "BY DESSERT" (Texto centrado debajo de la imagen, fuera de la imagen)
  Widget _buildImageWithCenteredLabel(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 60,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
