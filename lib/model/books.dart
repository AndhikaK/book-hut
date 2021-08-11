class Books {
  final List book;

  Books({required this.book});

  factory Books.formJson(List<dynamic> json) {
    return Books(book: json);
  }
}
