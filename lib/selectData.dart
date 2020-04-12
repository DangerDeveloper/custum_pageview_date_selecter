import 'package:flutter/material.dart';

class SelectData extends StatefulWidget {
  List<String> list;
  SelectData(this.list);

  @override
  _SelectDataState createState() => _SelectDataState();
}

class _SelectDataState extends State<SelectData> {
  int pageIndex = 0;
  PageController pageController;
  double offSetY;
  double doubleControllerValue = 0.0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: pageIndex,
      viewportFraction: 0.5,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    pageController.addListener(() {
      setState(() {
        doubleControllerValue = pageController.page;
        pageIndex = doubleControllerValue.toInt();
      });
    });
    return Container(
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.list.length,
        controller: pageController,
        itemBuilder: (ctx, index) {
          offSetY = (doubleControllerValue - index).abs() * 30;
          return AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: 1 - (((doubleControllerValue - index).abs() / 1.8)),
            child: Transform.translate(
              offset: Offset(0, offSetY),
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[900],blurRadius: 15.0,spreadRadius: 1.0,offset: Offset(4.0,4.0)),
                      BoxShadow(color: Colors.white,blurRadius: 15.0,spreadRadius: 1.0,offset: Offset(-4.0,-4.0)),
                    ],
                  ),
                  width: (width * 0.45) + (-offSetY),
                  height: (width * 0.2) + (-offSetY),
                  child: Text(
                    widget.list[index].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24 + ((-offSetY)/3),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
