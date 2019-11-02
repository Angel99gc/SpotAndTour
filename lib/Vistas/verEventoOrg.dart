import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../firebase.dart';


class verEventoOrg extends StatefulWidget {
  const verEventoOrg({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _verEventoOrg createState() => _verEventoOrg();
}

class _verEventoOrg extends State<verEventoOrg> {
  //Variables
  final format = DateFormat("yyyy-MM-dd HH:mm");

  static String nombre = "";
  static String ubicacion = "";
  static int costo;
  static DateTime fechaInicial;
  static DateTime fechaFinal;
  static String descripcion = "";

  static final formKey = GlobalKey<FormState>();

  /*---------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.only(left: 60), child: Text(widget.title)
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
                Image.asset(
                  'lib/Imagenes/loginImage.png',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Eventos Organizador",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Row(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Fila 1",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Text(
                            "endpoint",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Center(
                            child: Text(
                             "Fila 2",
                             style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Text(
                            "endpoint",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Fila 3",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Text(
                            "endpoint",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: Colors.blue[600],
                    child: Text(
                      "Agregar evento",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        //print(nombre);
                        //print(contra);
                        /*
                        Future<dynamic> registro = await firebase.postRegistro(
                            nombre, correo, tipo, telefono, contra);
                        //                      registro.then((data) async{
                        //                        if(data.LOGIN=="TRUE"){
                        //                          Navigator.pop(context);
                        //                        }
                        //                        else{
                        //                          _usuarioExistente(context);
                        //                          await Future.delayed(Duration(seconds: 2));
                        //                          Navigator.pop(context);
                        //                        }
                        //                      });
                        */
                      } else {
                        print("Formulario Invalido");
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String validarUsuario(String value) {
    if (value.isEmpty) {
      return 'Debe rellenar los espacios solicitados.';
    }
    return null;
  }

  static String validarContra(String value) {
    if (value.isEmpty) {
      return 'Debe rellenar los espacios solicitados.';
    }
    if (value.length < 5) {
      return 'Contraseña debe tener minimo 5 letras.';
    }
    return null;
  }

  _usuarioExistente(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          {
            return AlertDialog(
              title: Text(
                'El usuario ya existe.',
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }
}
