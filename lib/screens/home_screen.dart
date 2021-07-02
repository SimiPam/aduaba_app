import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/discover_tab.dart';
import 'package:aduaba_app/screens/home_tab.dart';
import 'package:aduaba_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  int _currentTab = 0;

  String _appBarTitle = "Aduaba Fresh";
  Widget _widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerWidget(
          openDraw: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: _widget ??
          HomeTab(openDraw: () {
            _scaffoldKey.currentState.openDrawer();
          }),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Row subTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF3C673D),
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Text(
              "View all  ",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF999999),
                fontWeight: FontWeight.w400,
              ),
            ),
            Image.asset("assets/arrow.png")
          ],
        ),
      ],
    );
  }

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      onChanged: (value) {
        filterSearchResults(value);
      },
      controller: editingController,
      style: TextStyle(
        color: Color(0xFFF7F7F7),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search Product',
        hintStyle: TextStyle(
            color: Color(0xFFBABABA),
            fontWeight: FontWeight.w400,
            fontSize: 15),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Color(0xFFBABABA),
        ),
        filled: true,
        fillColor: Color(0xFFF7F7F7),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFF7F7F7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFF7F7F7)),
        ),
      ),
    );
  }
}
