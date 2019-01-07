import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  //constructor to get products from main,
  //syntatic sugar to take product parameter and assign to this.product
  Products(this.products, {this.deleteProduct}) {
    print('[Products Wigets] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    print('[Products Wigets] _buildProductItem()');
    return Card(
      //Image box
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          Text(products[index]['title']),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              child: Text('Details'),
              //move to another page
              onPressed: () => Navigator.pushNamed<bool>(
                          context, '/product/' + index.toString())
                      .then((bool value) {
                    //the future here returns a bool value from the pop button
                    print(value);
                    if (value) {
                      deleteProduct(index);
                    }
                  }),
            )
          ])
        ],
      ),
    );
  }

  Widget _buildProductList() {
    print('[Products Wigets] buildProductList()');
    Widget productCards;

    //if no products
    if (products.length > 0) {
      //ListView.builder() optmize and build only whats on screen
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Center(child: Text('No products found'));
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Wigets] build()');
    return _buildProductList();
  }
}
