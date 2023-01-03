import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/data/api_services.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/screens/post/post_screen.dart';
import 'package:giasu_app/screens/post/review_screen.dart';
import 'package:giasu_app/screens/search/search_screen.dart';
import 'package:giasu_app/screens/setting/setting_screen.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

class ControllerScreen extends StatefulWidget {
  final bool check;
  const ControllerScreen({Key? key, required this.check}) : super(key: key);

  @override
  _ControllerScreenState createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  int _selectedIndex = 0;
  static GiaSu giasu = new GiaSu();
  static HocVien hocvien = new HocVien();

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(check: true),
    SearchScreen(check: true),
    new PostScreen(check: true, hv: hocvien),
    new SettingScreen(gs: giasu, hv: hocvien, checks: true),
  ];

  static List<Widget> _widgetTitle = <Widget>[
    Text(TitleConstants.newfeedTitle,
        style: TextStyle(fontSize: 23, color: Colors.white)),
    Text(TitleConstants.searchTitle,
        style: TextStyle(fontSize: 23, color: Colors.white)),
    Text(TitleConstants.postTitle,
        style: TextStyle(fontSize: 23, color: Colors.white)),
    Text(TitleConstants.userTitle,
        style: TextStyle(fontSize: 23, color: Colors.white)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _checkaccount(bool check) {
    setState(() {
      try {
        var _giasu = Provider.of<GiaSuModel>(context, listen: false);
        var _hocvien = Provider.of<HocVienModel>(context, listen: false);
        if (check) {
          _widgetOptions = <Widget>[
            HomeScreen(check: check),
            SearchScreen(check: check),
            PostScreen(check: check, hv: _hocvien.hocVien),
            SettingScreen(
                gs: _giasu.giaSu, hv: _hocvien.hocVien, checks: check),
          ];
          _widgetTitle = <Widget>[
            Text(TitleConstants.newfeedTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
            Text(TitleConstants.searchTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
            Text(TitleConstants.postTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
            Text(TitleConstants.userTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
          ];
        } else {
          _widgetOptions = <Widget>[
            HomeScreen(check: check),
            SearchScreen(check: check),
            Review(giasu: _giasu.giaSu),
            SettingScreen(
                gs: _giasu.giaSu, hv: _hocvien.hocVien, checks: check),
          ];

          _widgetTitle = <Widget>[
            Text(TitleConstants.newfeedTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
            Text(TitleConstants.searchTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
            Text(TitleConstants.reviewTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
            Text(TitleConstants.userTitle,
                style: TextStyle(fontSize: 23, color: Colors.white)),
          ];
        }
      } catch (err) {
        print(err);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkaccount(widget.check);

    return Scaffold(
      appBar: buildAppBar(_widgetTitle.elementAt(_selectedIndex)),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: widget.check ? bottomNavBar() : bottomNavBar1()),
    );
  }

  AppBar buildAppBar(Widget text) {
    return AppBar(
      // leading: IconButton(
      //   icon: SvgPicture.asset(
      //     "assets/icons/back.svg",
      //     height: 20,
      //   ),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      elevation: 1,
      title: text,
      centerTitle: true,
      backgroundColor: ColorConstants.kPrimaryColor,
      //Turn off leading default
      automaticallyImplyLeading: false,
    );
  }

  ClipRRect getBtnNavBar() {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: bottomNavBar());
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: ColorConstants.kBackgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: LabelConstants.newfeedLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: LabelConstants.searchLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_add_rounded),
          label: LabelConstants.postLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: LabelConstants.userLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.limeAccent,
      onTap: _onItemTapped,
    );
  }

  BottomNavigationBar bottomNavBar1() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: LabelConstants.newfeedLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: LabelConstants.searchLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          label: LabelConstants.reviewLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: LabelConstants.userLable,
          backgroundColor: ColorConstants.kPrimaryColor,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.limeAccent,
      onTap: _onItemTapped,
    );
  }
}
