import 'package:flutter/material.dart';
import 'registro.dart';
import '../firebase.dart';
import 'store.dart';

class InicioSesion extends StatefulWidget {
  const InicioSesion({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InicioSesion createState() => _InicioSesion();
}

class _InicioSesion extends State<InicioSesion> {
  //Variables
  static String usuario = "";
  static String contra = "";

  static final formKey = GlobalKey<FormState>();

  /*---------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        backgroundColor: Colors.grey[500],
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.white,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        children: <Widget>[
//                          Image.asset(
//                            'lib/Imagenes/portada.png',
//                          ),
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
                            validator: validarEspacios,
                            onSaved: (String value) {
                              usuario = value;
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
                                hintText: "Escriba su contraseña."),
                            validator: validarEspacios,
                            onSaved: (String value) {
                              contra = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: Colors.blue[600],
                        child: Text(
                          "Ingresar",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            print(usuario);
                            print(contra);

                            Future<dynamic> inicioSesion = firebase.postLogin(usuario, contra);
                            inicioSesion.then((data) async{
                              print(data);
                              if(data.status==200){
                                Navigator.pushReplacement(
                                    context,MaterialPageRoute(builder: (context) =>Store()) );
                              }
                              else{
                                _datosIncorrectos(context);
                                await Future.delayed(Duration(seconds: 2 ));
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
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.blue[600],
              child: Center(
                child: Text(
                  "Registrarse",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Registro(title: "Registro")));
              },
            ),
          ],
        ),
    );
  }

  static String validarEspacios(String value) {
    if (value.isEmpty) {
      return 'Debe rellenar los espacios solicitados.';
    }
    return null;
  }

  _datosIncorrectos(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          {
            return AlertDialog(
              title: Text(
                'Usuario o Contraseña Incorrectos.',
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
