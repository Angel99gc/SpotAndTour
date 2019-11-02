import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../firebase.dart';


class crearEvento extends StatefulWidget {
  const crearEvento({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _crearEvento createState() => _crearEvento();
}

class _crearEvento extends State<crearEvento> {
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
            padding: EdgeInsets.only(left: 60), child: Text(widget.title)),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/Imagenes/portada.png',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Nombre del lugar:",
                            hintText: "Escriba el nombre del lugar"),
                        validator: validarUsuario,
                        onSaved: (String value) {
                          nombre = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.alternate_email,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Ubicación:",
                            hintText: "Ingrese la ubicación"),
                        validator: validarUsuario,
                        onSaved: (String value) {
                          ubicacion = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Precio:",
                            hintText: "Ingrese el precio del evento"),
                        validator: validarUsuario,
                        onSaved: (String value) {
                          costo = int.parse(value);
                        },
                      ),
                      DateTimeField(
                        format: format,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Fecha de inicio:",
                            hintText: "Ingrese la fecha de inicio"
                        ),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                        onSaved: (DateTime value) {
                          fechaInicial = value;
                        },
                      ),
                      DateTimeField(
                        format: format,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Fecha de conclusión:",
                            hintText: "Ingrese la fecha de cierre"
                        ),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime:
                              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                        onSaved: (DateTime value) {
                          fechaFinal = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Descripción:",
                            hintText: "Ingrese una descripción"),
                        validator: validarContra,
                        onSaved: (String value) {
                          descripcion = value;
                        },
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
