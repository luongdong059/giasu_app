import 'package:flutter/material.dart';

// var check = true;
var color1 = Colors.black;

class IconBtn extends StatefulWidget {
  const IconBtn({Key? key, required this.check}) : super(key: key);
  final bool check;
  @override
  _IconBtnState createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: IconButton(
        icon: Icon(Icons.bookmark),
        tooltip: 'Lưu',
        onPressed: () {
          setState(() {
            if (widget.check) {
              color1 = Colors.blue;
            } else {
              color1 = Colors.black;
            }
          });
        },
        color: color1,
      ),
    );
  }
}
