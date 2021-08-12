import 'dart:convert';

import 'package:book_hut/best-seller/best_seller_item.dart';
import 'package:book_hut/best-seller/best_seller_not_found.dart';
import 'package:book_hut/model/books.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BestSellerPage extends StatefulWidget {
  final String apiUrl;
  const BestSellerPage({Key? key, required this.apiUrl}) : super(key: key);

  @override
  _BestSellerPageState createState() => _BestSellerPageState();
}

class _BestSellerPageState extends State<BestSellerPage>
    with AutomaticKeepAliveClientMixin {
  late Future<Books> futureBooks;

  // final String apiUrl = apiUrl;

  Future<Books> fetchData() async {
    var result = await http.get(Uri.parse(widget.apiUrl));
    if (result.statusCode == 200) {
      return Books.formJson(json.decode(result.body)['results']['books']);
    } else {
      return Books.formJson([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: RefreshIndicator(
          onRefresh: getData,
          child: FutureBuilder<Books>(
            future: futureBooks,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.book.length == 0) {
                  return BestSellerNotFound();
                }
                return GridView.count(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 0.6,
                  children: List.generate(
                    snapshot.data.book.length,
                    (index) {
                      return BestSellerItem(
                        data: snapshot.data.book[index],
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
      ),
    );
  }

  Future<void> getData() async {
    setState(() {
      fetchData();
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    futureBooks = fetchData().whenComplete(() {
      setState(() {});
    });
  }
}
