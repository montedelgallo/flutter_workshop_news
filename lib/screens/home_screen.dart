import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _tabController;
  String _title;
  int _index;

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._index = tab;
      this._title = TabItems[tab].title;
    });
  }


  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    _title = TabItems[0].title;
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.black,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
              currentIndex: _index,
              onTap: onTap,
              items: TabItems.map((TabItem item) {
                return BottomNavigationBarItem(
                  title: Text(item.title),
                  icon: Icon(item.icon),
                );
              }).toList()
          )
      ),
      body: PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          Text('uno'),
          Text('due'),
          Text('tre')
        ],
      ),
    );
  }
}


class TabItem {
  final String title;
  final IconData icon;

  const TabItem({ this.title, this.icon });
}

const List<TabItem> TabItems = <TabItem>[
  TabItem(title: 'Business', icon: Icons.monetization_on ),
  TabItem(title: 'Science', icon: Icons.assignment ),
  TabItem(title: 'Technology', icon: Icons.computer ),
];