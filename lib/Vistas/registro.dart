import 'package:flutter/material.dart';
class Registro extends StatefulWidget {
  const Registro({ Key key, this.title }) : super(key: key);
  final String title;
  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  //Variables
  static String usuario = "";
  static String contra = "";


  static final formKey = GlobalKey<FormState>();

  /*---------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: Padding(
            padding: EdgeInsets.only(left: 60),
            child:Text(widget.title)),),
        backgroundColor: Colors.white,
        body: Form(
                key: formKey,
                child: Column(
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
                                icon: Icon(Icons.account_circle,
                                  color: Colors.blue[600],
                                  size: 30,),
                                labelText: "Usuario:", hintText: "Escriba su nuevo usuario."),
                            validator: validarUsuario,
                            onSaved: (String value) {
                              usuario = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock,
                                  color: Colors.blue[600],
                                  size: 30,
                                ),
                                labelText: "Contraseña:", hintText: "Escriba su nueva contraseña."),
                            validator: validarContra,
                            onSaved: (String value) {
                              contra = value;
                            },
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child:RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                        color: Colors.blue[600],
                        child: Text(
                          "Registrarme",
                          style: TextStyle(color: Colors.white,fontSize: 25),
                        ),
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            print(usuario);
                            print(contra);
                            //                      Future<dynamic> registro = firebase.postRegistro(usuario, contra);
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
                          } else {
                            print("Formulario Invalido");
                          }
                        },
                      ),
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
    if (value.length<5){
      return 'Contraseña debe tener minimo 5 letras.';
    }
    return null;
  }
  _usuarioExistente(BuildContext context)async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          {
            return AlertDialog(
              title: Text('El usuario ya existe.',textAlign: TextAlign.center,),
              content: SingleChildScrollView(
                child: Icon(Icons.clear,color: Colors.red,),
              ),
            );
          }
        });
  }
}