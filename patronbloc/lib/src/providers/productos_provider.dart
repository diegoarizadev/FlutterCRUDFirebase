import 'dart:convert';

import 'package:patronbloc/src/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
//Peticiones Http
  final String _urlFirebase =
      'flutterdev-ba32a-default-rtdb.firebaseio.com'; //Base de datos en FireBase

//Insertar Productos.
  Future<bool> createProduct(ProductModel product) async {
    final _uriS = Uri.https(_urlFirebase, 'productos.json');

    http.Response response = await http.post(_uriS,
        //headers: {"Content-Type": "application/json"},
        body: productModelToJson(product)); //retorna un future

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final _uriS = Uri.https(_urlFirebase, 'productos.json');

    http.Response response = await http.get(_uriS); //retorna un future

    final Map<String, dynamic> decodedData = json.decode(response.body);
    final List<ProductModel> products = [];

    if (decodedData.isEmpty)
      return []; //Validación de la información de la respuesta.

    print('decodedData      : ${decodedData.length}');

    decodedData.forEach((id, prodd) {
      print('id      : $id');
      print('prodd : $prodd');

      final prodTmp = ProductModel.fromJson(
          prodd); //convierte el json en un objeto de tipo ProductModel

      prodTmp.id = id; //Id que retorna FireBase.

      print('prodTmp : $prodTmp');

      products.add(prodTmp); //Se agrega el producto al List<ProductModel>

      print('products : $products');
      print('products : ${products.length}');
    });

    print('products : $products');

    return products;
  }

  Future<int> deleteProducts(String? idProduct) async {
    //Eliminar Producto.
    final _uriS = Uri.https(_urlFirebase, '/productos/$idProduct.json');
    //print(_uriS);

    http.Response response = await http.delete(_uriS); //retorna un future

    print(json.decode(response.body));

    return 1;
  }

  Future<bool> editProduct(ProductModel product) async {
    final _uriS = Uri.https(_urlFirebase, '/productos/${product.id}.json');

    http.Response response = await http.put(_uriS,
        //headers: {"Content-Type": "application/json"},
        body: productModelToJson(product)); //retorna un future

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }
}
