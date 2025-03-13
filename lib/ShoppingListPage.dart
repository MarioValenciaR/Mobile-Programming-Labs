import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final List<Map<String, String>> _shoppingList = [];

  // ✅ Function to add an item to the list
  void _addItem() {
    String item = _itemController.text.trim();
    String quantity = _quantityController.text.trim();

    if (item.isNotEmpty && quantity.isNotEmpty) {
      setState(() {
        _shoppingList.add({"item": item, "quantity": quantity});
        _itemController.clear(); // Clear text fields after adding
        _quantityController.clear();
      });
    }
  }

  // ✅ Function to remove an item from the list
  void _removeItem(int index) {
    setState(() {
      _shoppingList.removeAt(index);
    });
  }

  // Function to show a confirmation dialog before deleting an item
  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove Item?"),
          content: const Text("Are you sure you want to remove this item from the list?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without removing
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                _removeItem(index); // Remove item if "Yes" is selected
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  // Function to generate the ListView
  Widget _buildListView() {
    if (_shoppingList.isEmpty) {
      return const Center(child: Text("There are no items in the list"));
    }

    return ListView.builder(
      itemCount: _shoppingList.length,
      itemBuilder: (context, index) {
        final item = _shoppingList[index]["item"];
        final quantity = _shoppingList[index]["quantity"];

        return ListTile(
          title: Text("${index + 1}: $item"),
          subtitle: Text("Quantity: $quantity"),
          onLongPress: () => _showDeleteDialog(index), // Show AlertDialog on long-press
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo Home Page"),
        backgroundColor: Colors.purple.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text fields to enter item and quantity
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: "Type the item here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: "Type the quantity here",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                // "Add" Button
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Display list of items
            Expanded(child: _buildListView()),
          ],
        ),
      ),
    );
  }
}
