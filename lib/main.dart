import 'package:flutter/material.dart';
import 'page1.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('logo.png'),

            // Other widgets in your body...

            // Enter Shop Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Page1 when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page1()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Adjust the padding
                textStyle: TextStyle(fontSize: 20), // Adjust the font size
              ),
              child: Text('Enter Shop'),
            ),
            // Other widgets in your body...

          ],
        ),
      ),
    );
  }
}