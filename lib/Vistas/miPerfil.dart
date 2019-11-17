import 'package:flutter/material.dart';
import '../clases.dart';

class MiPerfil extends StatelessWidget{
  const MiPerfil({Key key, this.user}) : super(key: key);

  final Usuario user;

  //informacion del Dialog de editar
  static String text = "";
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(this.user.NOMBRE);
    print(this.user.USUARIO);
    print(this.user.TELEFONO);
    print(this.user.CORREO);
    print(this.user.CONTRA);


    return Scaffold(
      appBar: AppBar(
        title: Center(
        child:Text('Mi Perfil.'))
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(),
                GestureDetector(onTap: ()=>{},
                  child:Center(child:Text('Nombre Completo:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),),
                Center(child: Text(user.NOMBRE,style: TextStyle(fontSize: 17),),),
                Divider(),
                Center(child:Text('Usuario:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                Center(child: Text(user.USUARIO,style: TextStyle(fontSize: 17),),),
                Divider(),
                Center(child:Text('Correo:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                Center(child: Text(user.CORREO,style: TextStyle(fontSize: 17),),),
                Divider(),
                Center(child:Text('Telefono:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                Center(child: Text(user.TELEFONO,style: TextStyle(fontSize: 17),),),
                Divider(),
                Center(child:Text('Contraseña:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                Center(child: Text(user.CONTRA,style: TextStyle(fontSize: 17),),),
                Divider(),

              ],
            ),)

    );
  }

//  _editDialog(BuildContext context, String text) async {
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Center(child: Text('Motivo de rechazo')),
//            content: Form(
//              key: formKey,
//              child: TextFormField(
//                validator: validateMotivo,
//                controller: _textFieldController,
//                decoration: InputDecoration(
//                    hintText: "Escriba el motivo de su rechazo..."),
//                onSaved: (String value) {
//                  text = value;
//                },
//              ),
//            ),
//            actions: <Widget>[
//              new FlatButton(
//                child: new Text('CONFIRMAR'),
//                onPressed: () async {
//                  if (formKey.currentState.validate()) {
//                    formKey.currentState.save();
//                    dataService.postReservationStatus(
//                        reserva, "Rechazada", motivo);
//
//                    _messageDialog(context, 'Rechazada');
//                    await Future.delayed(Duration(seconds: 2));
//                    Navigator.pop(context);
//                    Navigator.pop(context);
//                    Navigator.of(context).pop();
//                  } else {
//                    print("Formulario Invalido");
//                  }
//                },
//              ),
//              new FlatButton(
//                child: new Text('CANCELAR'),
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//              )
//            ],
//          );
//        });
//  }

}