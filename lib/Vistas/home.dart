import 'package:flutter/material.dart';
import 'inicioSesion.dart';
import 'store.dart';
class Home extends StatefulWidget {
  const Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  //Variables
  TabController _tabController;
  int _indexRoute = 0;

  static List<Widget> _widgetRoutes = [
    Center(child: Text("HOLA")),
    Center(child: Text("HOLA2")),
    Center(child: Text("HOLA3")),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _widgetRoutes.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: 40,
            icon: const Icon(Icons.exit_to_app,textDirection: TextDirection.rtl,),
            tooltip: 'Cerrar Sesión',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Store()));
            },
          ) ,
          title: Text(widget.title),

        ),
        body: TabBarView(controller: _tabController, children: _widgetRoutes),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexRoute,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: new Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), title: new Text(''))
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ));
  }



  void _incrementTab(index) {
    setState(() {
      _indexRoute = index;
    });
    _tabController.animateTo(_indexRoute);
  }
}
