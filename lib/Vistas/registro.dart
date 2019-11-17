import 'package:flutter/material.dart';
import '../firebase.dart';
import '../clases.dart';

class Registro extends StatefulWidget {
  const Registro({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  //Variables

  static String nombre = "";
  static String correo = "";
  static String telefono = "";
  static String usuario = "";
  static String contra = "";
  static String confirmContra = "";

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

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.group_add,
                        color: Colors.blue[600],
                        size: 180,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Usuario:",
                            hintText: "Escriba su usuario."),
                        validator: validarUsuario,
                        onSaved: (String value) {
                          usuario = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Nombre Completo:",
                            hintText: "Escriba su nombre completo."),
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
                            labelText: "Correo:",
                            hintText: "Escriba su correo electrónico."),
                        validator: validarUsuario,
                        onSaved: (String value) {
                          correo = value;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Teléfono:",
                            hintText: "Escriba su número telefónico."),
                        validator: validarUsuario,
                        onSaved: (String value) {
                          telefono = value;
                        },
                      ),

                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Contraseña:",
                            hintText: "Escriba su nueva contraseña."),
                        validator: validarContra,
                        onSaved: (String value) {
                          contra = value;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blue[600],
                              size: 30,
                            ),
                            labelText: "Confirma tu contraseña:",
                            hintText: "Repite tu contraseña."),
                        validator: verificarContra,
                        onSaved: (String value) {
                          confirmContra = value;
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
                      "Registrarme",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () async {
                      formKey.currentState.save();
                      if (formKey.currentState.validate()) {
                        Future<endRegistro> registro = firebase.postRegistro(
                            nombre, correo, usuario, telefono, contra,"Cliente");
                        registro.then((data) async{
                          print(data.STATUS);
                          if(data.STATUS==200){
                            _cardMessage(context, 'Usuario Registrado',false);
                            await Future.delayed(Duration(seconds: 2));
                            Navigator.pop(context);
                            Navigator.pop(context);
 
                          }
                          else if(data.STATUS==400){
                            _cardMessage(context,data.MESSAGE, true);
                            await Future.delayed(Duration(seconds: 2));
                            Navigator.pop(context);
                          }
                        });
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
  static String verificarContra(String value) {
    if (value.isEmpty) {
      return 'Debe rellenar los espacios solicitados.';
    }
    if (value.length < 5) {
      return 'Contraseña debe tener minimo 5 letras.';
    }
    print(contra+'-'+confirmContra);
    if(contra!=confirmContra){
      return 'Confirmacion de contraseña erronea.';
    }
    return null;
  }
  _cardMessage(BuildContext context,String message,bool X) async {
    Icon icono;
    if(X){
      icono = Icon(
        Icons.clear,
        color: Colors.red,
      );
    }
    else{
      icono = Icon(
        Icons.check,
        color: Colors.green,
      );
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          {
            return AlertDialog(
              title: Text(
                message,
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: icono
              ),
            );
          }
        });
  }
}
