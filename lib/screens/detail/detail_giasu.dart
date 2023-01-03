import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_app/components/send_teach.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

import 'components/bottom_nav_bar_detai_giasu.dart';
import 'components/detail_body_giasu.dart';

class GiaSuDetail extends StatelessWidget {
  final GiaSu giasu;
  const GiaSuDetail({Key? key, required this.giasu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.infoTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Body(giasu: giasu),
      // bottomNavigationBar: MyBotNavBar(
      //     title: TitleConstants.contentBottom,
      //     titleBtn: ButtonConstants.send,
      //     press: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => SendTeach(gs: giasu)),
      //       );
      //     }),
    );
  }
}
