import 'package:flutter/material.dart';
import 'package:livraison/src/utils/style/color_resources.dart';
import 'package:livraison/src/view/models/food_category.dart';
import 'package:livraison/src/view/screens/widgets/category_items.dart';

import '../../models/product.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool categoryState = false;
  @override
  final List<FoodCategory> _categoryList = [
    FoodCategory(name: 'Salade', iconData: Icons.local_pizza),
    FoodCategory(name: 'Pizza', iconData: Icons.free_breakfast),
    FoodCategory(name: 'Burger', iconData: Icons.fastfood),
    FoodCategory(name: 'Baba Milk', iconData: Icons.local_drink),
    FoodCategory(name: 'Juice', iconData: Icons.restaurant),
  ];
  final List<Product> _products = [
    Product(
        name: 'Caesar Salad',
        category: 'Salade',
        price: 5.99,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Greek Salad',
        category: 'Salade',
        price: 6.99,
        imageUrl: 'assets/images/food_4.jpeg'),
    Product(
        name: 'Margherita Pizza',
        category: 'Pizza',
        price: 8.99,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Pepperoni Pizza',
        category: 'Pizza',
        price: 9.99,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Cheeseburger',
        category: 'Burger',
        price: 7.99,
        imageUrl: 'assets/images/food_5.jpeg'),
    Product(
        name: 'Veggie Burger',
        category: 'Burger',
        price: 8.49,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Baba Milk Original',
        category: 'Baba Milk',
        price: 4.99,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Strawberry Baba Milk',
        category: 'Baba Milk',
        price: 5.49,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Orange Juice',
        category: 'Juice',
        price: 3.99,
        imageUrl: 'assets/images/food_1.jpg'),
    Product(
        name: 'Apple Juice',
        category: 'Juice',
        price: 3.99,
        imageUrl: 'assets/images/food_4.jpeg'),
  ];

  String _selectedCategory = '';
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final List<Product> filteredProducts = _selectedCategory.isEmpty
        ? []
        : _products
            .where((product) => product.category == _selectedCategory)
            .toList();
    return Column(
      children: [
        SizedBox(
          height: 128,
          width: width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _categoryList.map((category) {
              return CategoryItems(
                category: category,
                onTap: () {
                  setState(() {
                    _selectedCategory = category.name;
                    // categoryState = !categoryState;
                    print('Selected Category: $_selectedCategory');
                  });
                },
              );
            }).toList(),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 20),
            filteredProducts.isNotEmpty
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            MediaQuery.of(context).size.width,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        print(product);
                        return Card(
                          color: ColorResources.WHITE_COLOR,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(product.imageUrl,
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: double.infinity),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(product.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text(
                        'Veuillez sélectionner une catégorie pour voir les produits'),
                  ),
          ],
        ),
      ],
    );
  }
}
