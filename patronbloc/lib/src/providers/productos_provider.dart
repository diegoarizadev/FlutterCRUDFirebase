import 'dart:convert';

import 'package:patronbloc/src/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
//Peticiones Http
  final String _urlFirebase =
      'flutterdev-ba32a-default-rtdb.firebaseio.com'; //Base de datos en FireBase

//Insertar Productos.
  Future<bool> createProduct(ProductModel product) async {
    print('createProduct');
    print(_urlFirebase);
    final _uriS = Uri.https(_urlFirebase, 'productos.json');
    print(_uriS);
    http.Response response = await http.post(_uriS,
        //headers: {"Content-Type": "application/json"},
        body: productModelToJson(product)); //retorna un future

    //

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }
}
