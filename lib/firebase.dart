import 'package:http/http.dart' as http;
import 'dart:convert';

class Firebase{
  final String _localhost = "ip";

  Future<dynamic> postRegistro(String nombre,String correo,String tipo,String telefono,String contra) async {
    var urlP = 'postRegistro';
    var url = Uri.http(this._localhost+':3000', urlP);


    http.Response response = await http.post(url,
        headers: {"Authorization": "Token","Accept": "application/json"},
        body: {"nombre": nombre,"correo":correo,"tipo":tipo,"telefono":telefono,"contraseña":contra}
        );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String,dynamic>  responseData = body['response'];
    return response;
  }
}

Firebase firebase = Firebase();