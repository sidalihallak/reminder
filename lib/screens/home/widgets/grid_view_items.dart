import 'package:flutter/material.dart';
import 'package:reminder/models/category.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          children: categories.map((category) => Container(
            decoration: BoxDecoration(
                color: Color(0xFF1A191D),
                borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    category.icon,
                    Text("0", style: Theme.of(context).textTheme.headline6)
                  ]),
                  Text(category.name, style: Theme.of(context).textTheme.headline5,),
                ],
              ),
            ),
          )).toList()
      ),
    );
  }
}