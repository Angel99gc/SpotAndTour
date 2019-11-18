import 'package:http/http.dart' as http;
import 'dart:convert';
import 'clases.dart';

class Firebase{
  final String _localhost = "192.168.1.7";

  Future<Usuario> postRegistro(String nombre,String correo,String usuario,String telefono,String contra,String tipo) async {
    var urlP = 'registro';
    var url = Uri.http(this._localhost+':3000', urlP);


    http.Response response = await http.post(url,
        headers: {"Authorization": "Token","Accept": "application/json"},
        body: {"nombre": nombre,"correo":correo,"usuario":usuario,"telefono":telefono,"contraseña":contra,"tipo":tipo,'condicion':'editar'}
        );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> body = jsonDecode(response.body);
    Usuario user = Usuario(body['status']);
    if(body['status']==200){
      user.InfoComplete(body['data']["usuario"],body['data']["nombre"], body['data']["correo"], body['data']["contraseña"], body['data']["tipo"], body['data']["telefono"]);
    }
    else if(body['status']==400){
      user.Message(body['message'] );
    }
    return user;
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

  Future<List<Evento>> getTour() async {
    List<Evento> eventos = [];

    var urlP = 'getTour';
    var url = Uri.http(this._localhost+":3000",urlP);
    print(url);
    http.Response response = await http.post(url,
        headers: {"Autorization": "token","Accept": "application/json"},
        );
    print('Response status: ${response.statusCode}');
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> eventosEnd = body['data'];
    if(body['status'] == 200) {
      for(var data in eventosEnd){
        Evento evento = Evento(body['status']);
        evento.InfoComplete(data['nombre'], int.parse(data['costo']), data['descripcion'], stringToDatetime(data['fechaInicial']), stringToDatetime(data['fechaFinal']), data['organizador'],data['lugar'], data['participantes']);
        eventos.add(evento);
      }
    }
    else{
      Evento evento = Evento(body['status']);
      evento.Message(body["message"]);
      eventos.add(evento);
    }
    print(eventos);
    return eventos;
  }
  Future<List<LineaTour>> myTours(String user, String solicitud) async {
    List<LineaTour> eventos = [];

    var urlP = 'getMyTours';
    var url = Uri.http(this._localhost+":3000",urlP);
    print(url);
    http.Response response = await http.post(url,
      headers: {"Autorization": "token","Accept": "application/json"},
      body: {'usuario':user, 'solicitud':solicitud,}
    );
    print('Response status: ${response.statusCode}');
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> eventosEnd = body['data'];
    if(body['status'] == 200) {
      for(var data in eventosEnd){
        LineaTour evento = LineaTour(data);
        eventos.add(evento);
      }
    }
    else{
      LineaTour evento = LineaTour(body['status']);
      eventos.add(evento);
    }
    print(eventos);
    return eventos;
  }
  Future<Usuario> buyTour(String user) async {

    var urlP = 'buyTour';
    var url = Uri.http(this._localhost+":3000",urlP);
    print(url);
    http.Response response = await http.post(url,
        headers: {"Autorization": "token","Accept": "application/json"},
        body: {'usuario':user,}
    );
    print('Response status: ${response.statusCode}');
    Map<String, dynamic> body = jsonDecode(response.body);
    Usuario usuario = Usuario(body['status']);

    if(body['status'] == 200) {
        usuario.InfoComplete(body['data']["usuario"],body['data']["nombre"], body['data']["correo"], body['data']["contraseña"], body['data']["tipo"], body['data']["telefono"]);
    }
    else{
      usuario.Message(body['message']);
    }

    return usuario;
  }

  DateTime stringToDatetime(String string){
    DateTime date = DateTime.parse(string);
    return date;
  }
}

Firebase firebase = Firebase();