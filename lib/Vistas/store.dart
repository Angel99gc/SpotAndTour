import 'package:flutter/material.dart';
import 'inicioSesion.dart';
import 'home.dart';

class Store extends StatelessWidget {
  final String title ='Spot&Tour C.R.';
  bool isLogged = true;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            leading:  isLogged ? IconButton(
              iconSize: 40,
              icon: const Icon(Icons.person),
              tooltip: 'Ver Perfil.',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Home(title: title)));
              },
            ):null,
            title: Center(child:Text(title),),
            actions: <Widget>[
              IconButton(
                iconSize: 40,
                icon: isLogged ? Icon(Icons.account_box):Icon(Icons.exit_to_app),
                tooltip: isLogged ? 'Iniciar Sesión':'Cerrar Sesión' ,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              InicioSesion(title: title)));
                },
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Tour Planificados.', icon: Icons.storage),
  const Choice(title: 'Tienda', icon: Icons.store),
  const Choice(title: 'Mi carrito', icon: Icons.shopping_cart),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

