import 'package:book_hut/best-seller/best_seller_page.dart';
import 'package:flutter/material.dart';

class BestSellerTabsWrapper extends StatefulWidget {
  const BestSellerTabsWrapper({Key? key}) : super(key: key);

  @override
  _BestSellerTabsWrapperState createState() => _BestSellerTabsWrapperState();
}

class _BestSellerTabsWrapperState extends State<BestSellerTabsWrapper> {
  List<Tab> tabs = <Tab>[
    Tab(text: 'Non-Fiction'),
    Tab(text: 'Fiction'),
    Tab(text: 'Science'),
    Tab(text: 'Manga'),
    Tab(text: 'Sports'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: tabs,
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            indicatorColor: Theme.of(context).hintColor,
            indicatorWeight: 8.0,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            unselectedLabelColor: Colors.grey[500],
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            labelPadding: EdgeInsets.only(top: 10, right: 5, left: 5),
          ),
        ),
        body: TabBarView(
          children: [
            BestSellerPage(
                apiUrl:
                    "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-nonfiction.json?api-key=9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00"),
            BestSellerPage(
                apiUrl:
                    "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00"),
            BestSellerPage(
                apiUrl:
                    "https://api.nytimes.com/svc/books/v3/lists/current/science.json?api-key=9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00"),
            BestSellerPage(
                apiUrl:
                    "https://api.nytimes.com/svc/books/v3/lists/current/manga.json?api-key=9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00"),
            BestSellerPage(
                apiUrl:
                    "https://api.nytimes.com/svc/books/v3/lists/current/sports.json?api-key=9ZgxX7FNfYj7K3IpQS9EZ6AwzBU1rM00"),
          ],
        ),
      ),
    );
  }
}
