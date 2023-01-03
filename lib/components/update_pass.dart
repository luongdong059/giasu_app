import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:giasu_app/components/login.dart';
import 'package:giasu_app/components/wellcome.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/data/api_services.dart';

import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/screens/controller_screen.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:provider/provider.dart';

final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

String? username, password, email;
late TextEditingController myController = new TextEditingController();
late TextEditingController myController1 = new TextEditingController();
late TextEditingController myController2 = new TextEditingController();

class UpdatePass extends StatelessWidget {
  const UpdatePass({Key? key, required this.check}) : super(key: key);
  final bool check;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(TitleConstants.updatePass),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/back.svg",
              height: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Color(0xFF6B9996),
        body: SingleChildScrollView(
          child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TitleConstants.updateTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Image.asset("assets/images/registed.jpg", width: size.width),
                  Container(
                      width: size.width * 0.8,
                      //margin: EdgeInsets.symmetric(vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: ColorConstants.kTextButtonColor,
                        borderRadius: BorderRadius.circular(
                            Dimens.kDefaultBorderRadiusTextField),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          username = value.toString();
                        },
                        controller: myController,
                        decoration: InputDecoration(
                          hintText: HintConstants.username,
                          icon: Icon(Icons.person,
                              color: ColorConstants.kTextColor),
                          border: InputBorder.none,
                        ),
                      )),
                  SizedBox(height: size.height * 0.02),
                  Container(
                      width: size.width * 0.8,
                      //margin: EdgeInsets.symmetric(vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: ColorConstants.kTextButtonColor,
                        borderRadius: BorderRadius.circular(
                            Dimens.kDefaultBorderRadiusTextField),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          email = value.toString();
                        },
                        controller: myController1,
                        decoration: InputDecoration(
                          hintText: HintConstants.email,
                          icon: Icon(Icons.email,
                              color: ColorConstants.kTextColor),
                          border: InputBorder.none,
                        ),
                      )),
                  Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: ColorConstants.kTextButtonColor,
                      borderRadius: BorderRadius.circular(
                          Dimens.kDefaultBorderRadiusTextField),
                    ),
                    child: PasswordField(
                      fieldKey: _passwordFieldKey,
                      hintText: HintConstants.newpassword,
                      myController: myController2,
                      //helperText: 'No more than 8 characters.',
                      labelText: 'Password *',
                      onFieldSubmitted: (value) {
                        password = value.toString();
                      },
                    ),
                  ),
                  RoudedButton(
                    size: size,
                    color: Colors.brown,
                    textColor: ColorConstants.kTextButtonColor,
                    title: ButtonConstants.updatepass,
                    press: () => {
                      if (myController.text.length > 0 &&
                          myController1.text.length > 0 &&
                          myController2.text.length > 0)
                        {
                          gs.tendangnhap = myController.text,
                          gs.matkhau = myController2.text,
                          gs.email = myController1.text,
                          hv.tendangnhap = myController.text,
                          hv.matkhau = myController2.text,
                          hv.email = myController1.text,
                          update(context, check),
                        }
                      else
                        {
                          showToast("Vui lòng nhập đầy đủ thông tin"),
                        }
                    },
                  ),
                ],
              )),
        ));
  }
}

class SocalIcon extends StatelessWidget {
  const SocalIcon({
    Key? key,
    required this.icon,
    required this.onpress,
  }) : super(key: key);

  final Icon icon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onpress(),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: icon),
        ),
      ],
    );
  }
}

//////Passshow/hide
class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.fieldKey,
    required this.hintText,
    required this.labelText,
    //required this.helperText,
    required this.onFieldSubmitted,
    required this.myController,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final TextEditingController myController;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      controller: widget.myController,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: Icon(Icons.lock, color: ColorConstants.kTextColor),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
              new Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        border: InputBorder.none,
      ),
    );
  }
}

void update(context, bool check) {
  if (check == false) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    _giasu.updatepassGiaSu(gs).then((value) {
      if (value) {
        showToast("Đổi mật khẩu thành công!\n Vui lòng đăng nhập lại");
        // Navigator.pushAndRemoveUntil<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //       builder: (BuildContext context) => const Login()),
        //   ModalRoute.withName('/'),
        // );
      } else {
        showToast("Tài khoản hoặc email không chính xác");
      }
    });
  } else {
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.updatepassHocVien(hv).then((value) {
      if (value) {
        showToast("Đổi mật khẩu thành công!\n Vui lòng đăng nhập lại");
        // Navigator.pushAndRemoveUntil<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //       builder: (BuildContext context) => const Login()),
        //   ModalRoute.withName('/'),
        // );
      } else {
        showToast("Tài khoản hoặc email không chính xác");
      }
    });
  }
}
