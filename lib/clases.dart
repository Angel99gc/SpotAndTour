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
class endRegistro{
  int STATUS;
  String MESSAGE;
  endRegistro(this.STATUS);
  InfoComplete(){
    print('InfoComplete');
  }
  Message(String message){
    this.MESSAGE=message;
  }
}
class Evento{
  int STATUS;
  String MESSAGE;

  String NOMBRE;
  int COSTO;
  String DESCRIPCION;
  String FECHAINICIAL;
  String FECHAFINAL;
  String NOM_ORGANIZADOR;
  String LUGAR;
  List<Usuario> PARTICIPANTES;

  Evento(this.STATUS);
  InfoComplete(String nombre,int costo, String descripcion, String fechainicial, String fechafinal,String lugar, List<Usuario> participantes){
    this.NOMBRE = nombre;
    this.COSTO = costo;
    this.DESCRIPCION = descripcion;
    this.FECHAINICIAL = fechainicial;
    this.FECHAFINAL = fechafinal;
    this.NOM_ORGANIZADOR = fechafinal;
    this.LUGAR = lugar;
    this.PARTICIPANTES = participantes;


  }
  Message(String message){
    this.MESSAGE = message;
  }
}