import 'package:flutter/material.dart';

class SearchBarView extends StatefulWidget {
  const SearchBarView({Key? key}) : super(key: key);

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1)),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_outlined,
                    color: Theme.of(context).primaryColor),
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Search Your Notes",
                    hintStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5),
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
