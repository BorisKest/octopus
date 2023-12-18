import 'package:example/src/feature/account/widget/about_app_dialog.dart';
import 'package:example/src/feature/account/widget/profile_screen.dart';
import 'package:example/src/feature/account/widget/settings_dialog.dart';
import 'package:example/src/feature/authentication/widget/signin_screen.dart';
import 'package:example/src/feature/authentication/widget/signup_screen.dart';
import 'package:example/src/feature/gallery/widget/gallery_screen.dart';
import 'package:example/src/feature/home/widget/home_screen.dart';
import 'package:example/src/feature/shop/widget/basket_screen.dart';
import 'package:example/src/feature/shop/widget/catalog_screen.dart';
import 'package:example/src/feature/shop/widget/category_screen.dart';
import 'package:example/src/feature/shop/widget/checkout_screen.dart';
import 'package:example/src/feature/shop/widget/favorites_screen.dart';
import 'package:example/src/feature/shop/widget/product_image_screen.dart';
import 'package:example/src/feature/shop/widget/product_screen.dart';
import 'package:example/src/feature/shop/widget/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';

enum Routes with OctopusRoute {
  signin('signin'),
  signup('signup'),
  home('home'),
  shop('shop'),
  catalog('catalog'),
  category('category'),
  product('product'),
  productImage('product-img-dialog'),
  basket('basket'),
  checkout('checkout'),
  favorites('favorites'),
  gallery('gallery'),
  profile('profile'),
  settingsDialog('settings-dialog'),
  aboutAppDialog('about-app-dialog');

  const Routes(this.name);

  @override
  final String name;

  @override
  Widget builder(BuildContext context, OctopusNode node) => switch (this) {
        Routes.signin => const SignInScreen(),
        Routes.signup => const SignUpScreen(),
        Routes.home => const HomeScreen(),
        Routes.shop => const ShopScreen(),
        Routes.catalog => const CatalogScreen(),
        Routes.category => CategoryScreen(id: node.arguments['id']),
        Routes.product => ProductScreen(id: node.arguments['id']),
        Routes.productImage => ProductImageScreen(
            id: node.arguments['id'],
            idx: node.arguments['idx'],
          ),
        Routes.basket => const BasketScreen(),
        Routes.checkout => const CheckoutScreen(),
        Routes.favorites => const FavoritesScreen(),
        Routes.gallery => const GalleryScreen(),
        Routes.profile => const ProfileScreen(),
        Routes.settingsDialog => const SettingsDialog(),
        Routes.aboutAppDialog => const AboutApplicationDialog(),
      };

  /*
  @override
  Page<Object?> pageBuilder(BuildContext context, OctopusNode node) =>
      node.name.endsWith('-custom')
          ? CustomUserPage()
          : super.pageBuilder(context, node);
  */
}
