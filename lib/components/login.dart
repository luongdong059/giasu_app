import 'package:flutter/material.dart';
import 'package:giasu_app/components/registed.dart';
import 'package:giasu_app/components/update_pass.dart';
import 'package:giasu_app/components/wellcome.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/screens/controller_screen.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:provider/provider.dart';

GiaSu gs = new GiaSu();
HocVien hv = new HocVien();

bool _value = false;
bool _value1 = false;
var check = true;

String username = "", password = "";
late TextEditingController myController = new TextEditingController();
late TextEditingController myController1 = new TextEditingController();

//String? _password;
final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);

    return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body: SingleChildScrollView(
          child: Container(
              width: size.width,
              // height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TitleConstants.loginTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Image.asset("assets/images/student.jpg", width: size.width),
                  //Username
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
                      child: SizedBox(
                        child: TextField(
                          onChanged: (value) {
                            username = value.toString();
                          },
                          controller: myController,
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          decoration: InputDecoration(
                            hintText: HintConstants.username,
                            icon: Icon(Icons.person,
                                color: ColorConstants.kTextColor),
                            border: InputBorder.none,
                          ),
                        ),
                      )),
                  //Password
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
                      myController: myController1,
                      //helperText: 'No more than 8 characters.',
                      labelText: 'Password *',
                      onFieldSubmitted: (value) {
                        password = value.toString();
                      },
                    ),
                  ),
                  CheckBoxLogin(),
                  SizedBox(height: size.height * 0.05),
                  RoudedButton(
                    size: size,
                    color: ColorConstants.kPrimaryColor,
                    textColor: ColorConstants.kTextButtonColor,
                    title: ButtonConstants.login,
                    press: () => {
                      if (_value && _value1 || !_value && !_value1)
                        {
                          showToast("Vui lòng chọn một loại tài khoản"),
                        }
                      else if (_value)
                        {
                          if (myController.text.length > 0 &&
                              myController1.text.length > 0)
                            {
                              gs.tendangnhap = username,
                              gs.matkhau = password,
                              if (gs.tendangnhap != null && gs.matkhau != null)
                                {
                                  login(context, true),
                                }
                            }
                          else
                            {
                              showToast("Vui lòng nhập tài khoản và mật khẩu"),
                            }
                        }
                      else if (_value1)
                        {
                          //hocvien
                          if (myController.text.length > 0 &&
                              myController1.text.length > 0)
                            {
                              hv.tendangnhap = username,
                              hv.matkhau = password,
                              if (hv.tendangnhap != null && hv.matkhau != null)
                                {
                                  login(context, false),
                                }
                            }
                          else
                            {
                              showToast("Vui lòng nhập tài khoản và mật khẩu"),
                            }
                        }
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(TitleConstants.registTitle,
                          style: TextStyle(fontSize: 15)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Registed()),
                            ModalRoute.withName('/'),
                          );
                        },
                        child: Text(TitleConstants.registsTitle,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          if (_value && _value1 || !_value && !_value1)
                            {
                              showToast("Vui lòng chọn một loại tài khoản"),
                            }
                          else
                            {
                              if (_value)
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdatePass(check: false)),
                                  )
                                }
                              else
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdatePass(check: true)),
                                  )
                                }
                            },
                        },
                        child: Text(TitleConstants.updatepassTitle,
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
  //final String helperText;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController myController;

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
      onChanged: widget.onFieldSubmitted,
      controller: widget.myController,
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

void login(context, bool check) {
  if (check) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    _giasu.loginGiaSu(gs).then((value) {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ControllerScreen(check: false)),
        );
      } else {
        showToast("Tài khoản hoặc mật khẩu không chính xác");
      }
    });
  } else {
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.loginHocVien(hv).then((value) {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ControllerScreen(check: true)),
        );
      } else {
        showToast("Tài khoản hoặc mật khẩu không chính xác");
      }
    });
  }
}
