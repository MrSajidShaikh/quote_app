import 'package:flutter/material.dart';
import '../Screen/QuotesScreen.dart';

class ToggleView extends StatefulWidget {
  const ToggleView({super.key});

  @override
  State<ToggleView> createState() => _ToggleViewState();
}

class _ToggleViewState extends State<ToggleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.grid_view_outlined),
          )
        ],
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 12/16,
        ),
        children: List.generate(
          quoteModel!.quoteModelList.length,
              (index) => Card(
            // color: Colors.primaries[Random().nextInt((Colors.primaries.length))],
            child: ListTile(
              title: Text(quoteModel!.quoteModelList[index].quote!),
              subtitle: Text(quoteModel!.quoteModelList[index].author!),
            ),
          ),
        ),
      ),
    );
  }
}