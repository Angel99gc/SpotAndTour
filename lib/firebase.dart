import 'package:http/http.dart' as http;
import 'dart:convert';
import 'clases.dart';

class Firebase{
  final String _localhost = "172.24.81.2";

  Future<endRegistro> postRegistro(String nombre,String correo,String tipo,String telefono,String contra) async {
    var urlP = 'registro';
    var url = Uri.http(this._localhost+':3000', urlP);


    http.Response response = await http.post(url,
        headers: {"Authorization": "Token","Accept": "application/json"},
        body: {"nombre": nombre,"correo":correo,"tipo":tipo,"telefono":telefono,"contraseña":contra}
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
  Future<dynamic> postLogin(String correo,String contra) async {
    var urlP = 'login';
    var url = Uri.http(this._localhost+':3000', urlP);


    http.Response response = await http.post(url,
        headers: {"Authorization": "Token","Accept": "application/json"},
        body: {"correo":correo,"contraseña":contra}
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> body = jsonDecode(response.body);

    Usuario usuario = Usuario(body["status"]);

    if(usuario.STATUS == 200) {
      usuario.InfoComplete(body["nombre"], body["correo"], body["contra"], body["tipo"], body["telefono"]);
    }
    else{
      usuario.Message(body["message"]);
    }
    return body;
  }
}

Firebase firebase = Firebase();