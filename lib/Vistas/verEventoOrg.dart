import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../firebase.dart';
import '../clases.dart';

class VerEventoOrg extends StatefulWidget {
  const VerEventoOrg({Key key, this.evento}) : super(key: key);
  final Evento evento;
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
                            widget.evento.NOMBRE,
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
                            widget.evento.LUGAR,
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
                            widget.evento.COSTO.toString(),
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
                            dateToString(widget.evento.FECHAINICIAL),
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
                            dateToString(widget.evento.FECHAFINAL),
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
                            widget.evento.DESCRIPCION,
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
  dateToString(DateTime date){
    String ano = date.toIso8601String().substring(0, 4);
    String mes = date.toIso8601String().substring(5, 7);
    String dia = date.toIso8601String().substring(8, 10);
    String hora = date.toIso8601String().substring(11,13);
    String minutos = date.toIso8601String().substring(14,16);
    int horaInt = int.parse(hora);
    if(horaInt>12){
      horaInt = horaInt -12;
      hora = horaInt.toString();
      return mes+'/'+dia+'/'+ano+'  '+hora+':'+minutos+' p.m.';
    }
    else{
      return mes+'/'+dia+'/'+ano+'  '+hora+':'+minutos+' a.m.';

    }
  }

}
