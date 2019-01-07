import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}
// void main() => runApp(MyApp());

//stateful widget requires createState()
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products;

  // pass this method to ProductControl
  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
      print(_products);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.brown,
          brightness: Brightness.dark,
          accentColor: Colors.indigo),
      //scaffold createes the things u want to see on the page
      // home: AuthPage(), or we can use '/' as home
      routes: {
        '/': (BuildContext context) => ProductsPage(_products,_addProduct,_deleteProduct),
        '/admin': (BuildContext context) => ProductsAdminPage(),
      },
      //
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        // '/products/1'
        if (pathElements[0] != '') {
          return null;
        } //check if invalid
        if (pathElements[1] == 'product') {
          //'/product/'
          final int index = int.parse(pathElements[2]);

          MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['imageUrl']),
          );
        }
        return null; //if nothing makes it
      },
    );
  }
}
