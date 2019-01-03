import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{

  final Function addProduct;
  ProductControl(this.addProduct){
    print('[ProductsControl Widget] Constructor');
  }

  @override
    Widget build(BuildContext context) {

    print('[ProductsControl Widget] Build()');
    return RaisedButton(
      color: Theme.of(context).primaryColor,
        onPressed: () {
          //add a map
          addProduct({'title': 'choclate','imageUrl': 'assets/food.jpg'});
        },
        child: Text('Add Product'),
      );
    }
}