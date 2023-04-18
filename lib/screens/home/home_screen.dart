import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pirate_hunt/screens/login_screen.dart';
import 'package:provider/provider.dart';

// import '/screens/cart/cart_screen.dart';
import '/constants.dart';
import '/providers/cart.dart';
import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';
import 'components/search_form.dart';
import '/screens/cart/components/badge.dart';
import 'components/section_title.dart';

class SecondHomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const SecondHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            logout(context);
          },
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Rajendra Nagar, Delhi",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        // actions: [
        //   Badge(child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart, color: Colors.grey,)), value: data.itemCount.toString(), color: primaryColor),
        // ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "best Products for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            SectionTitle(title: 'Categories', pressSeeAll: () {}),
            const Categories(),
            const NewArrivalProducts(),
            const PopularProducts(),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    // await FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const LoginScreen(),
      ),
    );
  }
}
