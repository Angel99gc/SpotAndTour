import 'package:http/http.dart' as http;
import 'dart:convert';
import 'clases.dart';

class Firebase{
  final String _localhost = "192.168.1.7";

  Future<endRegistro> postRegistro(String nombre,String correo,String usuario,String telefono,String contra,String tipo) async {
    var urlP = 'registro';
    var url = Uri.http(this._localhost+':3000', urlP);


    http.Response response = await http.post(url,
        headers: {"Authorization": "Token","Accept": "application/json"},
        body: {"nombre": nombre,"correo":correo,"usuario":usuario,"telefono":telefono,"contraseña":contra,"tipo":tipo}
        );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> body = jsonDecode(response.body);
    endRegistro registroEndpoint= endRegistro(body['status']);
    if(body['status']==200){
      registroEndpoint.InfoComplete();
    }
    else if(body['status']==400){
      registroEndpoint.Message(body['message'] );
    }
    return registroEndpoint;
  }
  Future<Usuario> postLogin(String user,String contra) async {
    var urlP = 'login';
    var url = Uri.http(this._localhost+':3000', urlP);

    print('consulta');
    http.Response response = await http.post(url,
        headers: {"Authorization": "Token","Accept": "application/json"},
        body: {"usuario":user,"contraseña":contra}
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> body = jsonDecode(response.body);

    Usuario usuario = Usuario(body["status"]);

    if(usuario.STATUS == 200) {
      usuario.InfoComplete(body['data']["usuario"],body['data']["nombre"], body['data']["correo"], body['data']["contraseña"], body['data']["tipo"], body['data']["telefono"]);
    }
    else{
      usuario.Message(body["message"]);
    }
    return usuario;
  }

//  Future<List<Evento>> getEventos(user) async {
//    List<Evento> eventos = [];
//
//    var urlP = 'getEventos';
//    var url = Uri.http(this._localhost+":3000",urlP);
//    print(url);
//    http.Response response = await http.get(url,
//        headers: {"Autorization": "token","Accept": "application/json",'user':user},
//        );
//    print('Response status: ${response.statusCode}');
//    Map<String, dynamic> body = jsonDecode(response.body);
//    print(body);
//    List<dynamic> eventosEnd = body['asd'];
//    print(body);
//    if(body['status'] == 200) {
//      for(var eventoEnd in eventosEnd){
//        Evento evento = Evento();
//        eventos.add(evento);
//      }    }
//    else{
//      usuario.Message(body["message"]);
//    }
//    print(eventosEnd);
//
//    return eventos;
//  }
}

Firebase firebase = Firebase();