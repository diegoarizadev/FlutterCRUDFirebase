import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.photo_size_select_actual),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                _createName(),
                _createPrice(),
                _createButton(),
              ],
            ),
          ), //Parecido a un formulario HTML pero es un Container
        ),
      ),
    );
  }

  _createName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del Producto',
      ),
    );
  }

  _createPrice() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
          decimal:
              true), //Tipo de teclado numerico y habilite el decimal o punto en el teclado.
      decoration: InputDecoration(
        labelText: 'Valor',
      ),
    );
  }

  _createButton() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {},
      icon: Icon(Icons.save),
      label: Text('Guardar'),
    );
  }
}
