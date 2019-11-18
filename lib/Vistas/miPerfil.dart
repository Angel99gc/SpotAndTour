import 'package:flutter/material.dart';
import '../clases.dart';
import '../firebase.dart';
class MiPerfil extends StatelessWidget{
  const MiPerfil({Key key, this.user}) : super(key: key);

  final Usuario user;

  //informacion del Dialog de editar
  static String text = "";
  static final formKey = GlobalKey<FormState>();
  static TextEditingController _textFieldController = TextEditingController();

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
                Center(child:Text('Usuario:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                Center(child: Text(user.USUARIO,style: TextStyle(fontSize: 17),),),
                Divider(),
                GestureDetector(
                  onTap:  (){
                    _editDialog(context,'nombre',user.NOMBRE);
                  },
                  child:Row(children: [
                    Expanded(
                  child:Column(children:[
                    Text('Nombre Completo:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Center(child: Text(user.NOMBRE,style: TextStyle(fontSize: 17),),),

                  ],),),
                    Padding(child:Icon(Icons.edit,size: 30,),padding: EdgeInsets.only(right: 5),),
                  ],
                  ),),
                Divider(),
                GestureDetector(
                  onTap:  (){
                    _editDialog(context,'correo',user.CORREO);
                  },
                  child:Row(children: [
                    Expanded(
                      child:Column(children:[
                        Text('Correo:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Center(child: Text(user.CORREO,style: TextStyle(fontSize: 17),),),

                      ],),),
                    Padding(child:Icon(Icons.edit,size: 30,),padding: EdgeInsets.only(right: 5),),
                  ],
                  ),),

                Divider(),
                GestureDetector(
                  onTap:  (){
                    _editDialog(context,'telefono',user.TELEFONO);
                  },
                  child:Row(children: [
                    Expanded(
                      child:Column(children:[
                        Text('Telefono:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Center(child: Text(user.TELEFONO,style: TextStyle(fontSize: 17),),),

                      ],),),
                    Padding(child:Icon(Icons.edit,size: 30,),padding: EdgeInsets.only(right: 5),),
                  ],
                  ),),

                Divider(),
                GestureDetector(
                  onTap:  (){
                    _editDialog(context,'contraseña',user.CONTRA);
                  },
                  child:Row(children: [
                    Expanded(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                        Text('Contraseña:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Center(child: Text(user.CONTRA,style: TextStyle(fontSize: 17),),),

                      ],),),
                    Padding(child:Icon(Icons.edit,size: 30,),padding: EdgeInsets.only(right: 5),),
                  ],
                  ),),

                Divider(),

              ],
            ),)

    );
  }

  _editDialog(BuildContext context, String tipo,String datoActual) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text('Actual ' + tipo + ': ' + datoActual)),
            content: Form(
              key: formKey,
              child: TextFormField(
                validator: validateText,
                controller: _textFieldController,
                decoration: InputDecoration(
                    hintText: "Escriba su "+ (tipo=='contraseña'?"nueva ":"nuevo ") + tipo),
                onSaved: (String value) {
                  text = value;
                },
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('EDITAR'),
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    await firebase.postRegistro((tipo=="nombre"? text:user.NOMBRE), (tipo=='correo'? text:user.CORREO), user.USUARIO, (tipo=='telefono'?text:user.TELEFONO), (tipo=='contraseña'?text:user.CONTRA),user.TIPO)
                    .then((data)async {
                      formKey.currentState.reset();
                      if(data.STATUS==200){
                        _cardMessage(context, 'Información editada', false);
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                            MiPerfil(user: data)));

                      }
                      else{
                        _cardMessage(context, 'Error al editar.', true);
                        Navigator.pop(context);
                      }
                    });
                  } else {
                    print("Formulario Invalido");
                  }
                },
              ),
              new FlatButton(
                child: new Text('CANCELAR'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
  static String validateText(String value) {
    if (value.isEmpty) {
      return "Debe rellenar los espacios solicitados.";
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