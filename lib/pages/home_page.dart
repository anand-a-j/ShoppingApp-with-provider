import 'package:flutter/material.dart';
import 'package:shopping_app_using_provider/pages/cart_page.dart';
import 'package:shopping_app_using_provider/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currectPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currectPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
         iconSize: 30,
         selectedFontSize: 0,
         unselectedFontSize: 0,
          currentIndex: currectPage,
          onTap: (value) {
            setState(() {
              currectPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined), label: ''),
          ]),
    );
  }
}
