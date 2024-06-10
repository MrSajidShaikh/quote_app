import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/QuoteList.dart';
import 'QuoteModel.dart';

QuoteModel? quoteModel;

class ToggleView extends StatefulWidget {
  const ToggleView({super.key});

  @override
  State<ToggleView> createState() => _ToggleViewState();
}

class _ToggleViewState extends State<ToggleView> {
  @override
  void initState() {
    quoteModel = QuoteModel.toList(quoteList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black12,
          leading: const Icon(Icons.menu,color: Colors.white,),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    if(grid){
                      grid = false;
                    }
                    else{
                      grid = true;
                    }
                  });
                },
                child: Icon(grid?Icons.view_list:Icons.grid_view_outlined,color: Colors.white,)),
          ],
          title: const Text(
            'Toggle',
            style: TextStyle(color: Colors.white,fontSize: 30),
          ),
        ),
        body: grid?gridView():listView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Random random = Random();
            int x = random.nextInt(quoteModel!.quoteModelList.length);
            setState(() {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor:
                  Colors.accents[Random().nextInt((Colors.accents.length))],
                  title: Text(quoteModel!.quoteModelList[x].quote!),
                  content: Text(quoteModel!.quoteModelList[x].author!),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'))
                  ],
                ),
              );
            });
          },
          child: const Icon(Icons.notification_add_outlined),
        ),
      ),
    );
  }

  GridView gridView() {
    return GridView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          // color: Colors.primaries[Random().nextInt((Colors.primaries.length))],
          child: ListTile(
            title: Text(quoteModel!.quoteModelList[index].quote!),
            subtitle: Text(quoteModel!.quoteModelList[index].author!),
          ),
        );
      }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 12/16),
    );
  }

  ListView listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),

          child: ListTile(
            title: Text(quoteModel!.quoteModelList[index].quote!),
            subtitle: Text(quoteModel!.quoteModelList[index].author!),
          ),
        );
      },
    );
  }
}