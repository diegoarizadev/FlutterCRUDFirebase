import 'package:flutter/material.dart';
import 'package:patronbloc/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //Centrar la pagina
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Email : ${bloc.email}'),
          Divider(),
          Text('password : ${bloc.password}')
        ], //Se recupera la información del Stream
      ),
    );
  }
}
