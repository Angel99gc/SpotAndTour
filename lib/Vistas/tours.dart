import 'package:flutter/material.dart';
import '../firebase.dart';
import '../clases.dart';
import 'verEventoOrg.dart';

class Tours extends StatefulWidget {
  const Tours({Key key, this.user, this.myTours}) : super(key: key);
  final String user;
  final bool myTours;
  @override
  _Tours createState() => _Tours();
}

class _Tours extends State<Tours> {
  //Variables

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: widget.myTours ? firebase.myTours(widget.user,'comprados'):firebase.getTour(),
        builder: (BuildContext context, AsyncSnapshot data) {
          switch (data.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (data.hasError) return Text('Error: ${data.error}');
              if (data.data.isEmpty) return Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,children:[Icon(Icons.description,size: 100,),Text("No hay eventos")]));
              return ListView.builder(
                  itemCount: data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VerEventoOrg(evento:data.data[index])));
                      },
                      child: widget.myTours ? linea(evento: data.data[index].NOMBRE,):EventoCard(evento:data.data[index], tipo:'store')
                    );
                  });
          }
          return null; // unreachable
        },
      ),
    );
  }
}
class linea extends StatelessWidget {
  const linea({Key key, this.evento}) : super(key: key);

  final String evento;

  @override
  Widget build(BuildContext context) {
    return ListTile(leading:Text(evento),trailing: Text('1'),);
  }
}
class EventoCard extends StatelessWidget {
   const EventoCard({Key key, this.evento, this.tipo}) : super(key: key);

  final Evento evento;
  final String tipo;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin:
      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: 10, right: 10, top: 40, bottom: 5),
          child: Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Evento:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text(this.evento.NOMBRE)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Lugar:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text(this.evento.LUGAR)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Costo:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text(this.evento.COSTO.toString())),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text('Fecha:')),
                            Padding(padding: EdgeInsets.only(left: 3,top: 3),child:Text(dateToString(this.evento.FECHAINICIAL))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                  )
                ],
              )),
        ),
      ),
    );
  }
  dateToString(DateTime date){
    String ano = date.toIso8601String().substring(0, 4);
    String mes = date.toIso8601String().substring(5, 7);
    String dia = date.toIso8601String().substring(8, 10);
    String hora = date.toIso8601String().substring(11,13);
    String minutos = date.toIso8601String().substring(14,16);
    int horaInt = int.parse(hora);
    if(horaInt>12){
      horaInt = horaInt -12;
      hora = horaInt.toString();
      return mes+'/'+dia+'/'+ano+'  '+hora+':'+minutos+' p.m.';
    }
    else{
      return mes+'/'+dia+'/'+ano+'  '+hora+':'+minutos+' a.m.';

    }
  }
}
