import 'package:flutter/material.dart';
import 'package:pirate_hunt/models/Product.dart';
import 'package:pirate_hunt/screens/cart/cart_screen.dart';
import 'package:pirate_hunt/screens/details/details_screen.dart';
import 'package:pirate_hunt/screens/home/components/new_arrival_products2.dart';
import 'package:pirate_hunt/screens/home/components/product_card.dart';
import 'package:pirate_hunt/screens/myproducts/my_products.dart';
import 'package:pirate_hunt/screens/orders/orders_screen.dart';
import 'package:pirate_hunt/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

// import '/screens/cart/cart_screen.dart';
import '/constants.dart';
import '/providers/cart.dart';
import 'components/categories.dart';
import 'components/new_arrival_products.dart';
// import 'components/search_form.dart';
import 'components/section_title.dart';

class SecondHomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const SecondHomeScreen({Key? key}) : super(key: key);

  @override
  State<SecondHomeScreen> createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTap(int page) {
    pageController.jumpToPage(page);
  }

  void pageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        elevation: 0,
        title: const Text(
          "Bazaar",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const ProfileScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: pageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
                const Text(
                  "best Products for you",
                  style: TextStyle(fontSize: 18),
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: defaultPadding),
                //   child: SearchForm(),
                // ),
                SectionTitle(title: 'Categories', pressSeeAll: () {}),
                const Categories(),
                const NewArrivalProducts(),
                const NewArrivalProducts2(),
                // const Card(
                //   elevation: 0,
                //   child: Text('Big Offers Incoming'),
                // ),
              ],
            ),
          ),
          // const Center(
          //   child: Text('Your Products'),
          // ),

          const OrdersScreen(),

          const MyProductScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? Colors.white : Colors.white54,
            ),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.shopping_bag_outlined,
          //     color: _page == 1 ? Colors.white : Colors.white54,
          //   ),
          //   label: 'Products',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              color: _page == 1 ? Colors.white : Colors.white54,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inventory_2_sharp,
              color: _page == 2 ? Colors.white : Colors.white54,
            ),
            label: 'Products',
          ),
        ],
        onTap: navigationTap,
      ),
    );
  }
}
