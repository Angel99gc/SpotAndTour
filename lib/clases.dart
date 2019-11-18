class Usuario{
  int STATUS;
  String USUARIO;
  String NOMBRE;
  String CORREO;
  String CONTRA;
  String TIPO;
  String TELEFONO;
  String MESSAGE;
  Usuario(this.STATUS);
  InfoComplete(String usuario,String nombre,String correo, String contra, String tipo, String telefono){
    this.USUARIO = usuario;
    this.NOMBRE = nombre;
    this.CORREO = correo;
    this.CONTRA = contra;
    this.TIPO = tipo;
    this.TELEFONO = telefono;
  }
  Message(String message){
    this.MESSAGE = message;
  }
}

class Evento{
  int STATUS;
  String MESSAGE;

  String NOMBRE;
  int COSTO;
  String DESCRIPCION;
  DateTime FECHAINICIAL;
  DateTime FECHAFINAL;
  String NOM_ORGANIZADOR;
  String LUGAR;
  List<String> PARTICIPANTES;

  Evento(this.STATUS);
  InfoComplete(String nombre,int costo, String descripcion, DateTime fechainicial, DateTime fechafinal,String organizador,String lugar, List<String> participantes){
    this.NOMBRE = nombre;
    this.COSTO = costo;
    this.DESCRIPCION = descripcion;
    this.FECHAINICIAL = fechainicial;
    this.FECHAFINAL = fechafinal;
    this.NOM_ORGANIZADOR = organizador;
    this.LUGAR = lugar;
    this.PARTICIPANTES = participantes;
  }
  Message(String message){
    this.MESSAGE = message;
  }
}