import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../firebase.dart';


class VerEventoOrg extends StatefulWidget {
  const VerEventoOrg({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _VerEventoOrg createState() => _VerEventoOrg();
}

class _VerEventoOrg extends State<VerEventoOrg> {
  //Variables
//  final format = DateFormat("yyyy-MM-dd HH:mm");
//
  static String nombre = "nombre";
  static String ubicacion = "ubicación";
  static int costo = 0;
  static DateTime fechaInicial = DateTime.now();
  static DateTime fechaFinal = DateTime.now();
  static String descripcion = "descripción";

  static final formKey = GlobalKey<FormState>();

  /*---------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Organizador"
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Vista Evento Seleccionado:",
                  style: TextStyle(fontSize: 25),
                ),
                Image.asset(
                  'lib/Imagenes/loginImage.png',
                  width: 200,
                  height: 200,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Nombre del lugar: ",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            nombre,
                            style: TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Ubicación: ",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            ubicacion,
                            style: TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                              child: Text(
                                "Precio: ",
                                style: TextStyle(fontSize: 20),
                              )
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            costo.toString(),
                            style: TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Text(
                                "Fecha de inicio: ",
                                style: TextStyle(fontSize: 20),
                              )
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            fechaInicial.toString(),
                            style: TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Text(
                                "Fecha de conclusión: ",
                                style: TextStyle(fontSize: 20),
                              )
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            fechaFinal.toString(),
                            style: TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: Text(
                                "Descripción: ",
                                style: TextStyle(fontSize: 20),
                              )
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            descripcion,
                            style: TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),

                    ],
                  )
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }

}
