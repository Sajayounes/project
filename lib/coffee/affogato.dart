import 'package:flutter/material.dart';

class Coffee {
  String coffeeType;
  double price;
  int ice = 1; // 1 for with ice, 0 for without ice

  Coffee(this.coffeeType, this.price);

  @override
  String toString() {
    return '$coffeeType';
  }

  String getTotalPrice(Coffee coffee, Coffee Icecream, Coffee syrup) {
    if (ice == 1) {
      return ((coffee.price + Icecream.price + syrup.price) + 0.5).toStringAsFixed(2);
    }
    return (coffee.price + Icecream.price + syrup.price).toStringAsFixed(2);
  }
}

List<Coffee> coffees = [
  Coffee('espresso', 1),
  Coffee('dark', 0.5),
  Coffee('lattee', 1.1),
  Coffee('americano', 1.3),
];

List<Coffee> Icecreams = [
  Coffee('Vanilla', 2),
  Coffee('Chocolate', 1.1),
  Coffee('Caramel', 2.5),
  Coffee('Coffee', 1),
];

List<Coffee> syrups = [
  Coffee('Vanille', 1),
  Coffee('Caramel', 1.3),
  Coffee('Hazelnut', 1.2),
  Coffee('chocolate', 2.1),
];

class MyDropdownMenuWidget extends StatefulWidget {
  MyDropdownMenuWidget({Key? key, required this.updateCar, required this.options});
  final Function(Coffee) updateCar;
  final List<Coffee> options;

  @override
    State<MyDropdownMenuWidget> createState() => _MyDropdownMenuWidgetState();
}

class _MyDropdownMenuWidgetState extends State<MyDropdownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210,
        initialSelection: widget.options[0],
        onSelected: (coffee) {
          setState(() {
            widget.updateCar(coffee as Coffee);
          });
        },
        dropdownMenuEntries: widget.options.map<DropdownMenuEntry<Coffee>>((Coffee coffee) {
          return DropdownMenuEntry(value: coffee, label: coffee.toString());
        }).toList());
  }
}

class IceWidget extends StatefulWidget {
  const IceWidget({Key? key, required this.updateIce});
  final Function(int) updateIce;

  @override
  State<IceWidget> createState() => _IceWidgetState();
}

class _IceWidgetState extends State<IceWidget> {
  int selectedIce = 1; // 1 for with ice, 0 for without ice

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 1,
              groupValue: selectedIce,
              onChanged: (value) {
                setState(() {
                  selectedIce = value as int;
                  widget.updateIce(selectedIce);
                });
              },
            ),
            Text('With Ice', style: TextStyle(fontSize: 18)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: selectedIce,
              onChanged: (value) {
                setState(() {
                  selectedIce = value as int;
                  widget.updateIce(selectedIce);
                });
              },
            ),
            Text('Without Ice', style: TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}