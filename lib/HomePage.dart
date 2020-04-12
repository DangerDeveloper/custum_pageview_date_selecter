
import 'package:custumpageviewdateselecter/data.dart';

import './selectData.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('UI'),
        elevation: 0.0,
        backgroundColor: Colors.grey[600],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 10.0,),
                child: Text('Select Years',style: TextStyle(color: Colors.white,fontSize: 26),),
              ),
            ),
            Container(
              height: height * 0.3,
              width: double.infinity,
              child: SelectData(years),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.2,
              width: double.infinity,
              child: SelectData(country),
            ),
          ],
        ),
      ),
    );
  }
}
