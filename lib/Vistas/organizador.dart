import 'package:flutter/material.dart';
import 'inicioSesion.dart';
import 'store.dart';
import 'crearEvento.dart';
import 'verEventoOrg.dart';

class Organizador extends StatelessWidget {
  final String title ='Organizador';

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Organizador"
            ),
          ),
          leading:  IconButton(
            iconSize: 40,
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Cerrar Sesión',
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Store(user: null,isLogged: false,)));
            },
          ) ,
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
  const Choice(title: 'Tours Activos', icon: Icons.storage),
  const Choice(title: 'Tours', icon: Icons.build),
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
            RaisedButton(
              padding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Colors.blue[600],
              child: Text(
                "Registro de eventos",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CrearEvento(title: "")
                  )
                );
              },
            ),
            RaisedButton(
              padding:
              EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Colors.blue[600],
              child: Text(
                "Ver evento",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerEventoOrg(title: "")
                    )
                );
              },
            ),
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

