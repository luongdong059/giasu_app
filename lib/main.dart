import 'package:flutter/material.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

import 'components/wellcome.dart';
import 'constants/constants.dart';
import 'viewmodels/giasu_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GiaSuModel>(
          create: (context) => GiaSuModel(),
        ),
        ChangeNotifierProvider<HocVienModel>(
          create: (context) => HocVienModel(),
        ),
        ChangeNotifierProvider<LopModel>(
          create: (context) => LopModel(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,
        theme: ThemeData(
          primaryColor: ColorConstants.kPrimaryColor,
          appBarTheme: AppBarTheme(
            color: ColorConstants.kPrimaryColor,
          ),
        ),
        home: Wellcome());
  }
}
