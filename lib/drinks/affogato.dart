import 'package:flutter/material.dart';
import 'package:jass/coffee/affogato.dart';

class Affogato extends StatefulWidget {
  const Affogato({Key? key}) : super(key: key);

  @override
  State<Affogato> createState() => _AffogatoState();
}

class _AffogatoState extends State<Affogato> {
  Coffee coffee = coffees.first;
  Coffee Icecream = coffees.first;
  Coffee syrup = coffees.first;
  String totalPrice = "";
  double cupSize = 100.0; // Initial cup size

  void updateCoffee(Coffee coffee) {
    setState(() {
      this.coffee = coffee;
      totalPrice = coffee.getTotalPrice(this.coffee, Icecream, syrup);
    });
  }

  void updateIcecream(Coffee coffee) {
    setState(() {

      this.Icecream = coffee;
      totalPrice = coffee.getTotalPrice(this.coffee, Icecream, syrup);
    });
  }

  void updateSyrup(Coffee coffee) {
    setState(() {
      this.syrup = coffee;
      totalPrice = coffee.getTotalPrice(this.coffee, Icecream, syrup);
    });
  }

  void updateExtras(int ice) {
    setState(() {
      coffee.ice = ice;
      totalPrice = coffee.getTotalPrice(coffee, Icecream, syrup);
    });
  }

  void updateCupSize(double newSize) {
    setState(() {
      cupSize = newSize;
      if (cupSize <= 75.0) {
        // Small cup (S)
        coffee.price = 1.0; // Adjust the price for a small cup
      } else if (cupSize > 75.0 && cupSize <= 125.0) {
        // Medium cup (M)
        coffee.price = 1.5; // Adjust the price for a medium cup
      } else {
        // Large cup (L)
        coffee.price = 2; // Adjust the price for a large cup
      }
      totalPrice = coffee.getTotalPrice(coffee, Icecream, syrup);
    });
  }

  String getCupSizeLabel() {
    if (cupSize <= 75.0) {
      return 'S';
    } else if (cupSize > 75.0 && cupSize <= 125.0) {
      return 'M';
    } else {
      return 'L';
    }
  }
  void _showSelectedItems() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Selected Items:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text('Coffee: ${coffee.coffeeType}'),
              Text('Icecream: ${Icecream.ice}'),
              Text('Syrup: ${syrup.coffeeType}'),
              Text('Extras: ${coffee.ice} ice'),
              Text('Cup Size: ${getCupSizeLabel()}'),
              SizedBox(height: 20.0),
              Text(
                'Total Price: $totalPrice',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown, // Background color
                ),
                child: Text('OK',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your affogato Cup'),
        backgroundColor: Colors.brown, // Choose a warm color for the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add a coffee image or logo at the top of the page
            Image.asset(
              'assets/wall.png', // Replace with your image asset
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Coffee: ', style: TextStyle(fontSize: 25.0)),
                MyDropdownMenuWidget(updateCar: updateCoffee, options: coffees),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.icecream,
                  color: Colors.brown,
                  size: 25.0,
                ),
                const Text(' Icecream: ', style: TextStyle(fontSize: 25.0)),
                MyDropdownMenuWidget(updateCar: updateIcecream, options: Icecreams),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Syrup: ', style: TextStyle(fontSize: 25.0)),
                MyDropdownMenuWidget(updateCar: updateSyrup, options: syrups),
              ],
            ),
            const SizedBox(height: 10.0),
            IceWidget(updateIce: updateExtras),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pick your Cup Size:',
                  style: TextStyle(fontSize: 18.0),
                ),
                Slider(
                  value: cupSize,
                  min: 50.0,
                  max: 150.0,
                  onChanged: (value) {
                    updateCupSize(value);
                  },
                ),
                Text(
                  getCupSizeLabel(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.coffee,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Total Price: $totalPrice",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Place Order Button with TextField
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.coffee,
                    color: Colors.brown,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "Place Order",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  SizedBox(width: 10.0),
                  // Add a TextField here if needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
