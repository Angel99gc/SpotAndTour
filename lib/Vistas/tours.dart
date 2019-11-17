import 'package:flutter/material.dart';
import '../firebase.dart';
import '../clases.dart';

class Tours extends StatefulWidget {
  const Tours({Key key}) : super(key: key);

  @override
  _Tours createState() => _Tours();
}

class _Tours extends State<Tours> {
  //Variables

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        //future: firebase.getEventos(),
        builder: (BuildContext context, AsyncSnapshot data) {
          switch (data.connectionState) {
            case ConnectionState.done:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        //NAVEGAR AL MODAL CON TODA LA INFORMACION
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 40, bottom: 5),
                            child: Card(
                                child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Evento:')),
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Lugar:')),
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Costo:')),
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Fecha:')),
                                          Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 30,
                                )
                              ],
                            )),
                          ),
                        ),
                      ),
                    );
                  });
          }
          return null; // unreachable
        },
      ),
    );
  }
}

class EventoCard extends StatelessWidget {
   const EventoCard({Key key, this.evento, this.tipo}) : super(key: key);

  final Evento evento;
  final String tipo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: 10, right: 10, top: 40, bottom: 5),
          child: Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Evento:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Lugar:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Costo:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Fecha:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Salon')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
