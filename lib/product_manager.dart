import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

/*class Foo extends StatefulWidget  :
     requires a create state()
  class FooState extends State<Foo>:
    build()
*/
class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;
  //positional constructor
  ProductManager({this.startingProduct}) {
    print('[ProductsManager Wigets] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductsManager Wigets] CreateState()');

    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  //add a proprty that can be modified by the state
  List<Map<String, String>> _products = [];

/*initState() allows you in initialize the first state,
weiget allows you to access base class fields.
*/
  @override
  void initState() {
    print('[ProductsManager State] initState()');

    //we check if the previous state has starting product,
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductsManager Wigets] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  // pass this method to ProductControl
  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
      print(_products);
    });
  }

  void _deleteProduct(int index ){
      setState(() {
              _products.removeAt(index);
            });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        //Expanded takes the remanining space.
        Expanded(child: Products(_products, deleteProduct : _deleteProduct))
      ],
    );
  }
}
