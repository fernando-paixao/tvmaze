import 'package:flutter/material.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';

import '../styles.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> mainScreens;

  HomeScreen(this.mainScreens);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _body;
  int _selectedIndex;

  _onItemTapped(int tappedIndex) {
    setState(() {
      _selectedIndex = tappedIndex;
      _body = widget.mainScreens[_selectedIndex];
    });
  }

  @override
  void initState() {
    _onItemTapped(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Styles.PADDING_SIZE),
        child: Scaffold(
          appBar: AppBar(
            actions: [],
            title: Text(AppConstants.APP_TITLE),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Shows',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'People',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
          body: _body,
        ));
  }
}
