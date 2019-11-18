import 'package:flutter/material.dart';
import '../firebase.dart';

class Carrito extends StatefulWidget {
  const Carrito({Key key, this.user,}) : super(key: key);
  final String user;
  @override
  _Carrito createState() => _Carrito();
}

class _Carrito extends State<Carrito> {
  //Variables

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: firebase.myTours(widget.user,'apartados'),
        builder: (BuildContext context, AsyncSnapshot data) {
          switch (data.connectionState) {
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (data.hasError) return Text('Error: ${data.error}');
              if (data.data.isEmpty) return Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,children:[Icon(Icons.remove_shopping_cart,size: 100,),Text("Carrito Vacío.")]));
              return ListView.builder(
                  itemCount: data.data.length+1,
                  itemBuilder: (BuildContext context, int index) {
                    print(index);
                    if(index==data.data.length){
                      return RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        color: Colors.blue[600],
                        child: Text(
                          "Comprar Todo.",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        onPressed: () async {
                          await firebase.buyTour(widget.user)
                          .then((usuario){

                            setState(() {
                            });
                          });
                        }
                      );
                    }
                    return linea(evento:data.data[index].NOMBRE);
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