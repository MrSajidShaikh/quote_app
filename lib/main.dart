import 'package:flutter/material.dart';
import 'package:quote_app/Screen/ToggleList.dart';
import 'Screen/QuotesScreen.dart';

void main()
{
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToggleView(),
    );
  }
}