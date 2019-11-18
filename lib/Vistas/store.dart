import 'package:flutter/material.dart';
import 'inicioSesion.dart';
import 'miPerfil.dart';
import '../clases.dart';
import 'tours.dart';
import 'carrito.dart';
class Store extends StatelessWidget {


  const Store({Key key, this.isLogged, this.user}) : super(key: key);
  final String title ='Spot&Tour C.R.';

  final bool isLogged;
  final Usuario user;


  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsChoice = <Widget> [
      Tours(user: "", myTours: false,),

    ];
    List<Choice> choices = <Choice>[
      Choice(title: 'Tienda', icon: Icons.store),
    ];
    if(isLogged){
      choices.add(const Choice(title: 'Tour Planificados.', icon: Icons.storage));
      choices.add(const Choice(title: 'Mi Carrito.', icon: Icons.shopping_cart));
      widgetsChoice.add(Tours(user:this.user.USUARIO, myTours: true,));
      widgetsChoice.add(Carrito(user: this.user.USUARIO,));
    }

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
                            MiPerfil(user: this.user)));
              },
            ):null,
            title: Center(child:Text(title),),
            actions: <Widget>[
              IconButton(
                iconSize: 40,
                icon: isLogged ? Icon(Icons.exit_to_app):Icon(Icons.person_add),
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
            children: widgetsChoice
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

