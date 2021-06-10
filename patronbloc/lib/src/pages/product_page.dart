import 'package:flutter/material.dart';
import 'package:patronbloc/src/models/product_model.dart';
import 'package:patronbloc/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  //const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  ProductModel product = new ProductModel();
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
            key: formKey,
            child: Column(
              children: [
                _createName(),
                _createPrice(),
                _createAvailable(),
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
      initialValue: product.titulo, //Valor inicial
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre del Producto',
      ),
      onSaved: (value) => product.titulo =
          value!, //Se ejecuta despues de validado el campo y asigna el valor al modelo
      validator: (value) {
        //Se debe retornar un error, en casso de no existir un error se retorna null
        if (value!.length < 3) {
          return 'Ingrese el nombre del producto'; //Este es el error.
        } else {
          return null;
        }
      },
    );
  }

  _createPrice() {
    return TextFormField(
      initialValue: product.valor
          .toString(), //Valor inicial, se muestra el valor que tiene actualmente es el modelo.
      keyboardType: TextInputType.numberWithOptions(
          decimal:
              true), //Tipo de teclado numerico y habilite el decimal o punto en el teclado.
      decoration: InputDecoration(
        labelText: 'Valor',
      ),
      onSaved: (value) => product.valor = value!
          as double, //Se ejecuta despues de validado el campo y asigna el valor al modelo
      validator: (value) {
        //Se debe retornar un error, en casso de no existir un error se retorna null
        if (utils.isNumeric(value!)) {
          return null; // es un mnumero
        } else {
          return 'Sólo, números!';
        }
      },
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
      onPressed: _sudmit,
      icon: Icon(Icons.save),
      label: Text('Guardar'),
    );
  }

  void _sudmit() {
    if (!formKey.currentState!.validate())
      return; //si el formulario no es valido

    formKey.currentState!
        .save(); //instrucciones para ejeucar el OnSave de Widgets, se ejecuta despues de las validaciones.

    //formKey.currentState!.validate(); //Si el formulario es valido retorna un true, de los contrario un false
  }

  _createAvailable() {
    return SwitchListTile(
      value: product.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        product.disponible = value;
      }),
    );
  }
}
