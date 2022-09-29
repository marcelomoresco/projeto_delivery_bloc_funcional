import 'package:flutter/material.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/delivery_time/delivery_time.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/filter/filter_page.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/restaurant_details.dart/restaurant_details_page.dart';
import '../../views/basket/basket_page.dart';
import '../../views/checkout/checkout_page.dart';
import '../../views/cupom/cupom_page.dart';
import '../../views/home/home_page.dart';
import '../../views/location/location_page.dart';
import '../../views/restaurant_list/restaurant_list_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case LocationPage.routeName:
        return LocationPage.route();
      case BasketPage.routeName:
        return BasketPage.route();
      case CheckoutPage.routeName:
        return CheckoutPage.route();
      case CupomPage.routeName:
        return CupomPage.route();
      case DeliveryTimePage.routeName:
        return DeliveryTimePage.route();
      case FilterPage.routeName:
        return FilterPage.route();
      case RestaurantDetailsPage.routeName:
        return RestaurantDetailsPage.route();
      case RestaurantListPage.routeName:
        return RestaurantListPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
