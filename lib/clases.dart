class Usuario{
  String STATUS;
  String NOMBRE;
  String CORREO;
  String CONTRA;
  String TIPO;
  String TELEFONO;
  String MESSAGE;
  Usuario(this.STATUS);
  InfoComplete(String nombre,String correo, String contra, String tipo, String telefono){
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