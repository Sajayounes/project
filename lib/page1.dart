import 'package:flutter/material.dart';
import 'order.dart';

class Page1 extends StatelessWidget {
  // List of image paths
  final List<String> imagePaths = [
    'hot.png',
    'affogato.png',
    'iced-coffee.png',
    'boba.png',
    'matcha.png',
    'milkshake.png',
  ];
  final List<String> imageName = [
    'hot drink',
    'affogato',
    'iced-coffee',
    'boba',
    'matcha',
    'milkshake',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize your drink'),
      ),
      //     body: GridView.builder(
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         crossAxisSpacing: 8.0,
      //         mainAxisSpacing: 8.0,
      //       ),
      //       itemCount: 6,
      //       itemBuilder: (BuildContext context, int index) {
      //         return buildGridItem(context, index);
      //       },
      //     ),
      //   );
      // }

//   Widget buildGridItem(BuildContext context, int index) {
//     return Card(
//       elevation: 4.0,
//       child: Column(
//         children: [
//           // Image
//           Image.asset(imagePaths[index], width: 200, height: 150, fit: BoxFit.fill),
//           // Button
//           ElevatedButton(
//             onPressed: () {
//               // Navigate to Page2 when the button is pressed
//               Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => Order(buttonText: ' ${imageName[index]}'),
//   ),
// );
//             },
//             child: Text(' ${imageName[index]}'),
//           ),
//         ],
//       ),
//     );
//   }
// }

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Box(
                  imagePath: 'assets/hot.png',
                  text: 'hot drink',
                ),
                Box(
                  text: 'affogato',
                  imagePath: 'assets/affogato.png',
                ),
              ],
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Box(
                  text: 'iced-coffee',
                  imagePath: 'assets/iced-coffee.png',
                ),
                Box(
                  text: 'boba',
                  imagePath: 'assets/boba.png',
                ),
              ],
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Box(
                  text: 'matcha',
                  imagePath: 'assets/matcha.png',
                ),
                Box(
                  text: 'milkshake',
                  imagePath: 'assets/milkshake.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String text;
  final String? imagePath;

  const Box({required this.text, this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      width: screenWidth * 0.4, // Adjust this factor as needed
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to Page2 when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Order(buttonText: text),
                  ),
                );
              },
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}