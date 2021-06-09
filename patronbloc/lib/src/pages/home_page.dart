import 'package:flutter/material.dart';
//import 'package:patronbloc/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bloc = ProviderInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(),
      floatingActionButton: _createButton(context),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'product'),
      child: Icon(Icons.add),
      backgroundColor: Colors.purple,
    );
  }
}
