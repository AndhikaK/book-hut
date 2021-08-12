import 'dart:ui';

import 'package:book_hut/model/books.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final Map data;
  const BookDetail({Key? key, required this.data}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    Map data = widget.data;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Book Detail"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data["book_image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 200,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              height: 170,
                              image: NetworkImage(data['book_image']),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(right: 15, top: 15, bottom: 15),
                        width: MediaQuery.of(context).size.width - 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['title'],
                              maxLines: 3,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data['author'],
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data['publisher'],
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
