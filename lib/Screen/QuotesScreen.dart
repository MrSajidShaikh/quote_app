import 'dart:math';
import 'package:flutter/material.dart';

import '../utils/QuoteList.dart';
import 'QuoteModel.dart';

QuoteModel? quoteModel;

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  void initState() {
    quoteModel = QuoteModel.toList(quoteList);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              quoteModel!.quoteModelList.length,
                  (index) => Card(
                child: ListTile(
                  title: Text(quoteModel!.quoteModelList[index].quote!),
                  subtitle: Text(quoteModel!.quoteModelList[index].author!),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Random random = Random();
            int x = random.nextInt(quoteModel!.quoteModelList.length);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(quoteModel!.quoteModelList[x].author!),
                content: Text(quoteModel!.quoteModelList[x].quote!),
              ),
            );
          },
          child: Icon(Icons.notification_add_outlined),
        ),
      ),
    );
  }
}
