import 'package:flutter/material.dart';
import 'package:reminder/models/common/custom_color.dart';
import 'package:reminder/models/common/custom_color_collection.dart';
import 'package:reminder/models/common/custom_icon.dart';
import 'package:reminder/models/common/custom_icon_collection.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({Key? key}) : super(key: key);

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  CustomColor _selectdColor = CustomColorCollection().colors.first;
  CustomIcon _selectdIcon = CustomIconColection().icons.first;
  TextEditingController _textController = TextEditingController();
  String _listName = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _listName = _textController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New List'),
        actions: [
          TextButton(
              onPressed: _listName.isNotEmpty
                  ? () {
                      if (_textController.text.isNotEmpty) {
                        print('add to database');
                      } else {
                        print('please enter a liste name');
                      }
                    }
                  : null,
              child: Text(
                'Add',
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectdColor.color,
              ),
              child: Icon(_selectdIcon.icon, size: 75),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _textController,
                autofocus: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                        child: Icon(Icons.clear, color: Theme.of(context).accentColor)),
                    onPressed: () {
                      _textController.clear();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customColor in CustomColorCollection().colors)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectdColor = customColor;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: customColor.color,
                        shape: BoxShape.circle,
                        border: _selectdColor.id == customColor.id
                            ? Border.all(color: Colors.grey[600]!, width: 5)
                            : null,
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customIcon in CustomIconColection().icons)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectdIcon = customIcon;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: _selectdIcon.id == customIcon.id
                            ? Border.all(color: Colors.grey[600]!, width: 5)
                            : null,
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                      ),
                      child: Icon(customIcon.icon),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
