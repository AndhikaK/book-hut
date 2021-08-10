import 'package:book_hut/best-seller/best_seller_page.dart';
import 'package:book_hut/theme/config.dart';
import 'package:book_hut/theme/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MySecondApp());
}

// nyt books api : 9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00
// books list : hardcover-fiction, hardcover-nonfiction,science,sports, travel,manga

class MySecondApp extends StatefulWidget {
  const MySecondApp({Key? key}) : super(key: key);

  @override
  _MySecondAppState createState() => _MySecondAppState();
}

class _MySecondAppState extends State<MySecondApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      //2
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knight and Day',
      home: MyHomePage(
        title: "Whatever",
      ),
      theme: CustomTheme.lightTheme, //3
      darkTheme: CustomTheme.darkTheme, //4
      themeMode: currentTheme.currentTheme, //5
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BestSellerPage(),
    );
  }
}
