import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {


  final String title;
  final String imageUrl;
  ProductPage(this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      //column is as wide as the content
      body: Center(
        child: Column(
          //vertical
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image takes full width
            Image.asset('assets/food.jpg'),
            Container(
                padding: EdgeInsets.all(20.0),
                child: Text('On the Product details page')),
            Container(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('DELETE'),
                  onPressed: () => Navigator.pop(context, true),
                )),
          ],
        ),
      ),
    );
  }
}
