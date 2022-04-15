import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminder/models/category/category_collection.dart';
import 'package:reminder/screens/home/widgets/footer.dart';
import 'package:reminder/screens/home/widgets/list_view_items.dart';

import 'widgets/grid_view_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollection categoryCollection = CategoryCollection();
  String layoutType = 'grid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  if (layoutType == 'grid') {
                    setState(() {
                      layoutType = 'list';
                    });
                  } else {
                    setState(() {
                      layoutType = 'grid';
                    });
                  }
                },
                child: Text(
                  layoutType == 'grid' ? 'Edit' : 'Done',
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: GridViewItems(categories: categoryCollection.selectedCategories),
                  secondChild: ListViewItems(categoryCollection: categoryCollection),
                  crossFadeState: layoutType == 'grid' ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                ),
              ),
              Footer()
            ],
          ),
        ));
  }
}
/*child: layoutType == 'grid'
? GridViewItems(categories: categoryCollection.selectedCategories)
: ListViewItems(categoryCollection: categoryCollection),*/
