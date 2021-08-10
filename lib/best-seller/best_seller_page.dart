import 'dart:convert';

import 'package:book_hut/best-seller/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BestSellerPage extends StatefulWidget {
  const BestSellerPage({Key? key}) : super(key: key);

  @override
  _BestSellerPageState createState() => _BestSellerPageState();
}

class _BestSellerPageState extends State<BestSellerPage> {
  final String apiUrl =
      "https://api.nytimes.com/svc/books/v3/lists/current/manga.json?api-key=9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00";

  Future<List<dynamic>> fetchData() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['results']['books'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: FutureBuilder<List<dynamic>>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // return Text("this has data");
              return GridView.count(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 15, bottom: 15),
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: 0.6,
                children: List.generate(
                  snapshot.data.length,
                  (index) {
                    return BestSellerItem(
                      data: snapshot.data[index],
                    );
                  },
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff717FC8),
                ),
                backgroundColor: Theme.of(context).accentColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
