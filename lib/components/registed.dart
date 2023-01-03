import 'package:flutter/material.dart';
import 'package:giasu_app/components/login.dart';
import 'package:giasu_app/components/wellcome.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:provider/provider.dart';

final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
GiaSu gs = new GiaSu();
HocVien hv = new HocVien();

late TextEditingController myController = new TextEditingController();
late TextEditingController myController1 = new TextEditingController();
late TextEditingController myController2 = new TextEditingController();

String? username, password, email;

bool _value = false;
bool _value1 = false;

class Registed extends StatelessWidget {
  const Registed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFF6B9996),
        body: SingleChildScrollView(
          child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TitleConstants.registedTitle,
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
                          errorText: myController1.text.isValidEmail()
                              ? null
                              : "Email không hợp lệ",
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
                      hintText: HintConstants.password,
                      myController: myController2,
                      //helperText: 'No more than 8 characters.',
                      labelText: 'Password *',
                      onFieldSubmitted: (value) {
                        password = value.toString();
                      },
                    ),
                  ),
                  CheckBoxLogin(),
                  SizedBox(height: size.height * 0.02),
                  RoudedButton(
                    size: size,
                    color: Colors.red,
                    textColor: ColorConstants.kTextButtonColor,
                    title: ButtonConstants.registed,
                    press: () => {
                      if (_value && _value1 || !_value && !_value1)
                        {
                          showToast("Vui lòng chọn một loại tài khoản"),
                        }
                      else if (_value)
                        {
                          if (myController.text.length > 0 &&
                              myController1.text.length > 0 &&
                              myController2.text.length > 0)
                            {
                              gs.tendangnhap = myController.text,
                              gs.matkhau = myController2.text,
                              gs.email = myController1.text,
                              registed(context, true),
                            }
                          else
                            {
                              showToast("Vui lòng nhập đầy đủ thông tin"),
                            }
                        }
                      else if (_value1)
                        {
                          //hocvien

                          if (myController.text.length > 0 &&
                              myController1.text.length > 0 &&
                              myController2.text.length > 0)
                            {
                              hv.tendangnhap = myController.text,
                              hv.matkhau = myController2.text,
                              hv.email = myController1.text,
                              registed(context, false),
                            }
                          else
                            {
                              showToast("Vui lòng nhập đầy đủ thông tin"),
                            }
                        }
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(TitleConstants.loginsTitle,
                          style: TextStyle(fontSize: 15)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Login()),
                            ModalRoute.withName('/'),
                          );
                        },
                        child: Text(TitleConstants.loginstTitle,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
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

//Checklogin
class CheckBoxLogin extends StatefulWidget {
  const CheckBoxLogin({Key? key}) : super(key: key);

  @override
  _CheckBoxLoginState createState() => _CheckBoxLoginState();
}

class _CheckBoxLoginState extends State<CheckBoxLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.8,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Check(_value, 1, "Gia sư"),
            Check(_value1, 2, "Học viên"),
          ],
        ));
  }

  void _checklogin(var data, int index) {
    switch (index) {
      case 1:
        setState(() {
          _value = data;
        });
        break;
      case 2:
        setState(() {
          _value1 = data;
        });
        break;
    }
  }

  Row Check(bool data, int index, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: data,
          onChanged: (value) {
            _checklogin(value, index);
          },
          activeColor: Colors.green,
        ),
        Text(text),
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
  //final String helperText;
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
        hintText: HintConstants.password,
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

void registed(context, bool check) {
  if (check) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    _giasu.registedGiaSu(gs).then((value) {
      if (value) {
        showToast("Đăng kí thành công");
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const Login()),
          ModalRoute.withName('/'),
        );
      } else {
        showToast("Tài khoản hoặc email đã tồn tại");
      }
    });
  } else {
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.registedHocVien(hv).then((value) {
      if (value) {
        showToast("Đăng kí thành công");
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const Login()),
          ModalRoute.withName('/'),
        );
      } else {
        showToast("Tài khoản hoặc email đã tồn tại");
      }
    });
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
