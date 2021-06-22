import 'package:aduaba_app/screens/discover_tab.dart';
import 'package:aduaba_app/screens/home_tab.dart';
import 'package:aduaba_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentTab = 0;

  String _appBarTitle = "Aduaba Fresh";
  Widget _widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: _widget ??
          HomeTab(openDraw: () {
            _scaffoldKey.currentState.openDrawer();
          }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF3A953C),
        currentIndex: _currentTab,
        onTap: (int val) {
          setState(() {
            _currentTab = val;
            print(val);
            if (val == 2) {
              _scaffoldKey.currentState.openDrawer();
            } else if (val == 1) {
              _widget = DiscoverTab(openDraw: () {
                _scaffoldKey.currentState.openDrawer();
              });
            } else {
              _widget = HomeTab(openDraw: () {
                _scaffoldKey.currentState.openDrawer();
              });
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: "",
          ),
        ],
      ),
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