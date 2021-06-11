import 'package:flutter/material.dart';
import 'package:patronbloc/src/models/product_model.dart';
import 'package:patronbloc/src/providers/productos_provider.dart';
//import 'package:patronbloc/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);
  final productoProvider = new ProductsProvider();
  @override
  Widget build(BuildContext context) {
    //final bloc = ProviderInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _createListProduct(),
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

  _createListProduct() {
    return FutureBuilder(
      future: productoProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          //Se valida si hay información

          final products = snapshot.data;

          return ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context, i) => _createItemProduct(
                products[i], context), //Se envia una instancia de ProductModel
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createItemProduct(ProductModel product, BuildContext context) {
    return ListTile(
      title: Text('${product.titulo} - ${product.valor}'),
      subtitle: Text(product.id.toString()),
      onTap: () => Navigator.pushNamed(context, 'product'),
    );
  }
}
