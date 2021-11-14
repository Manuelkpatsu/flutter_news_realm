import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchTextEditingController = TextEditingController();

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            searchForNewsText(),
            Container(
              color: Colors.grey.shade200,
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  searchIcon(),
                  const SizedBox(width: 10),
                  searchTextField(),
                  const SizedBox(width: 5),
                  clearSearchQueryButton(),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchForNewsText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: const Text(
        'Search for news',
        style: TextStyle(fontSize: 22),
      ),
    );
  }

  Widget searchIcon() {
    return const Icon(
      Icons.search,
      size: 25,
      color: Colors.black54,
    );
  }

  Widget searchTextField() {
    return Expanded(
      child: TextFormField(
        controller: searchTextEditingController,
        autofocus: false,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for a news',
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget clearSearchQueryButton() {
    return IconButton(
      icon: const Icon(
        Icons.cancel,
        size: 20,
        color: Colors.black54,
      ),
      onPressed: () {
        if (searchTextEditingController.text.isNotEmpty) {
          searchTextEditingController.clear();
        }
      },
      splashRadius: 20,
    );
  }
}
