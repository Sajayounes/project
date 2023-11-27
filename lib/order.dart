import 'package:flutter/material.dart';
import 'drinks/hotdrink.dart';
import 'drinks/affogato.dart';
import 'drinks/boba.dart';
import 'drinks/iced-coffee.dart';
import 'drinks/matcha.dart';
import 'drinks/milkshake.dart';

class Order extends StatelessWidget {
  final String buttonText;

  const Order({required this.buttonText});

  Widget buildDrinkContent(BuildContext context) {
    switch (buttonText) {
      case 'hot drink':
        return HotDrink();
      case 'affogato':
        return Affogato();
      case 'iced-coffee':
        return IcedCoffee();
      case 'boba':
        return Boba();
      case 'matcha':
        return Matcha();
      case 'milkshake':
        return MilkShake();
      default:
        return const Text('Unknown drink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(194, 173, 170, 196),
      body: buildDrinkContent(context),
    );
  }
}


