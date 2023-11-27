import 'package:flutter/material.dart';
import 'package:jass/coffee/milkshake.dart';
// import 'coffee_order_page.dart';

class MilkShake extends StatefulWidget {
  const MilkShake({Key? key}) : super(key: key);

  @override
  State<MilkShake> createState() => _MilkShakeState();
}

class _MilkShakeState extends State<MilkShake> {
  // ... (your existing code)
  Coffee coffee = coffees.first;
  Coffee Milk = coffees.first;
  Coffee syrup = coffees.first;
  String totalPrice = "";
  double cupSize = 100.0; // Initial cup size

  void updateCoffee(Coffee coffee) {
    setState(() {
      this.coffee = coffee;
      totalPrice = coffee.getTotalPrice(this.coffee, Milk, syrup);
    });
  }

  void updateMilk(Coffee coffee) {
    setState(() {

      this.Milk = coffee;
      totalPrice = coffee.getTotalPrice(this.coffee, Milk, syrup);
    });
  }

  void updateSyrup(Coffee coffee) {
    setState(() {
      this.syrup = coffee;
      totalPrice = coffee.getTotalPrice(this.coffee, Milk, syrup);
    });
  }

  void updateExtras(int ice) {
    setState(() {
      coffee.ice = ice;
      totalPrice = coffee.getTotalPrice(coffee, Milk, syrup);
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
      totalPrice = coffee.getTotalPrice(coffee, Milk, syrup);
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
// this is the showselected item
  //this
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
              Text('Milk: ${Milk.ice}'),
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
        title: Text('Your MilkShake Cup'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ... (your existing code)
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
                  Icons.link,
                  color: Colors.brown,
                  size: 25.0,
                ),
                const Text(' Milk: ', style: TextStyle(fontSize: 25.0)),
                MyDropdownMenuWidget(updateCar: updateMilk, options: milks),
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
            // Place Order Button with TextField
            // Place Order Button with TextField
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(15.0), // Adjust the border radius as needed
              ),
              child: GestureDetector(
                onTap: () {
                  _showSelectedItems(); // Call the method to show selected items
                  // Display a SnackBar with a warning message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Order Placed!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green, // You can customize the background color
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
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
                        "Place Order",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(width: 10.0),
                      // Add a TextField here if needed
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}