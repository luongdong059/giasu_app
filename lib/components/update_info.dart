import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/components/login.dart';
import 'package:giasu_app/components/wellcome.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/screens/post/components/combo_box.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/hocvien_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

final keyDrop = new GlobalKey<DropDownKhuVucState>();

final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
late TextEditingController usernameController = new TextEditingController();
late TextEditingController passwordController = new TextEditingController();
late TextEditingController emailController = new TextEditingController();
late TextEditingController nameController = new TextEditingController();
late TextEditingController phonenumController = new TextEditingController();
late TextEditingController jobController = new TextEditingController();
late TextEditingController priceController = new TextEditingController();
late TextEditingController timeController = new TextEditingController();
late TextEditingController aboutController = new TextEditingController();

GiaSu gs = new GiaSu();
HocVien hv = new HocVien();

String? username, password, email, gender;
String dropdownValuehinhthuc = 'Online';

bool _value = false;
bool _value1 = false;
bool _value2 = false;

late List<KhuVuc> lst = <KhuVuc>[];

class UpdateInfo extends StatelessWidget {
  const UpdateInfo(
      {Key? key,
      required this.check,
      required this.giasus,
      required this.hocviens})
      : super(key: key);
  final bool check;
  final GiaSu giasus;
  final HocVien hocviens;
  @override
  Widget build(BuildContext context) {
    var _lop = Provider.of<LopModel>(context, listen: false);
    _lop.getListKhuVuc();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(TitleConstants.updateInfo),
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
          child: check
              ? Container(
                  width: size.width,
                  //height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Image.asset("assets/images/registed.jpg",
                          width: size.width),
                      SizedBox(height: size.height * 0.05),
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
                          child: TextField(
                            onChanged: (value) {
                              username = value.toString();
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: HintConstants.username,
                              icon: Icon(Icons.person,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Email
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
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: HintConstants.email,
                              icon: Icon(Icons.email,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                              errorText: emailController.text.isValidEmail()
                                  ? null
                                  : "Email không hợp lệ",
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Password
                      Container(
                        width: size.width * 0.8,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorConstants.kTextButtonColor,
                          borderRadius: BorderRadius.circular(
                              Dimens.kDefaultBorderRadiusTextField),
                        ),
                        child: PasswordField(
                          fieldKey: _passwordFieldKey,
                          hintText: HintConstants.password,
                          myController: passwordController,
                          //helperText: 'No more than 8 characters.',
                          labelText: 'Password *',
                          onFieldSubmitted: (value) {
                            password = value.toString();
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      //Name
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
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: HintConstants.name,
                              icon: Icon(Icons.people,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Phonenumber
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
                            controller: phonenumController,
                            // inputFormatters: [
                            //   WhitelistingTextInputFormatter.digitsOnly
                            // ],
                            maxLines: 1,
                            maxLength: 10,
                            decoration: InputDecoration(
                              hintText: HintConstants.phoneNumber,
                              icon: Icon(Icons.phone_android,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Job
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
                            controller: jobController,
                            decoration: InputDecoration(
                              hintText: HintConstants.addres,
                              icon: Icon(Icons.map_outlined,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      CheckBoxLogin(),
                      SizedBox(height: size.height * 0.02),
                      RoudedButton(
                        size: size,
                        color: Colors.red,
                        textColor: ColorConstants.kTextButtonColor,
                        title: ButtonConstants.update,
                        press: () => {
                          getData(context, check, giasus, hocviens),
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                    ],
                  ))
              : Container(
                  width: size.width,
                  //height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Image.asset("assets/images/registed.jpg",
                          width: size.width),
                      SizedBox(height: size.height * 0.05),
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
                          child: TextField(
                            onChanged: (value) {
                              username = value.toString();
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: HintConstants.username,
                              icon: Icon(Icons.person,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Email
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
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: HintConstants.email,
                              icon: Icon(Icons.email,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                              errorText: emailController.text.isValidEmail()
                                  ? null
                                  : "Email không hợp lệ",
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Password
                      Container(
                        width: size.width * 0.8,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorConstants.kTextButtonColor,
                          borderRadius: BorderRadius.circular(
                              Dimens.kDefaultBorderRadiusTextField),
                        ),
                        child: PasswordField(
                          fieldKey: _passwordFieldKey,
                          hintText: HintConstants.password,
                          myController: passwordController,
                          //helperText: 'No more than 8 characters.',
                          labelText: 'Password *',
                          onFieldSubmitted: (value) {
                            password = value.toString();
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      //Name
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
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: HintConstants.name,
                              icon: Icon(Icons.people,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Phonenumber
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
                            controller: phonenumController,
                            // inputFormatters: [
                            //   WhitelistingTextInputFormatter.digitsOnly
                            // ],
                            maxLines: 1,
                            maxLength: 10,
                            decoration: InputDecoration(
                              hintText: HintConstants.phoneNumber,
                              icon: Icon(Icons.phone_android,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Job
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
                            controller: jobController,
                            decoration: InputDecoration(
                              hintText: HintConstants.job,
                              icon: Icon(Icons.work,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Price
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
                            controller: priceController,
                            // inputFormatters: [
                            //   WhitelistingTextInputFormatter.digitsOnly
                            // ],
                            maxLines: 1,
                            maxLength: 10,
                            decoration: InputDecoration(
                              hintText: HintConstants.priceStudent,
                              icon: Icon(Icons.price_change,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //Time
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
                            controller: timeController,
                            decoration: InputDecoration(
                              hintText: HintConstants.timeTeach,
                              icon: Icon(Icons.timelapse,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      //About
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
                            controller: aboutController,
                            onTap: () {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            style: TextStyle(color: ColorConstants.kTextColor),
                            keyboardType: TextInputType.multiline,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: HintConstants.reviewInfo,
                              icon: Icon(Icons.info_outline,
                                  color: ColorConstants.kTextColor),
                              border: InputBorder.none,
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      DropDownChuDe(),
                      Consumer<LopModel>(builder: (_, snapshot, __) {
                        lst = snapshot.lstKhuVuc;
                        return DropDownKhuVuc(key: keyDrop, lst: lst);
                      }),
                      SizedBox(height: size.height * 0.02),
                      CheckBoxLogin(),
                      SizedBox(height: size.height * 0.02),
                      RoudedButton(
                        size: size,
                        color: Colors.red,
                        textColor: ColorConstants.kTextButtonColor,
                        title: ButtonConstants.update,
                        press: () => {
                          getData(context, check, giasus, hocviens),
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                    ],
                  )),
        ));
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
            Check(_value, 1, "Nam"),
            Check(_value1, 2, "Nữ"),
            Check(_value2, 3, "Khác"),
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
      case 3:
        setState(() {
          _value2 = data;
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
      onFieldSubmitted: widget.onFieldSubmitted,
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

class DropDownChuDe extends StatefulWidget {
  const DropDownChuDe({Key? key}) : super(key: key);

  @override
  _DropDownChuDeState createState() => _DropDownChuDeState();
}

class _DropDownChuDeState extends State<DropDownChuDe> {
  List<String> hinhthuc = ['Online', 'Offline', 'Online, Offline'];

  void _selectedTab(String? newValue, int index) {
    switch (index) {
      case 1:
        setState(() {
          dropdownValuehinhthuc = newValue!;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropDownCard(
            dropdownValuehinhthuc, hinhthuc, 1, ButtonConstants.titleHinhthuc),
      ],
    );
  }

  Card DropDownCard(String value1, List<String> data, int index, String title) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(
          left: Dimens.kDefaultPadding, right: Dimens.kDefaultPadding),
      color: ColorConstants.kPrimaryColor,
      child: ListTile(
        title: Text(title,
            style: TextStyle(color: ColorConstants.kTextButtonColor)),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        trailing: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: ColorConstants.kPrimaryColor,
            isExpanded: false,
            value: value1,
            items: data.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: 150, //expand here
                  child: new Text(
                    value,
                    textAlign: TextAlign.end,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              _selectedTab(newValue, index);
            },
            style: TextStyle(
                color: ColorConstants.kTextButtonColor,
                decorationColor: ColorConstants.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

void getData(context, bool check, GiaSu giasus, HocVien hocviens) {
  if (check == false) {
    if (_value && _value1 || _value && _value2 || _value1 && _value2) {
    } else {
      if (usernameController.text.length > 0 &&
          passwordController.text.length > 0 &&
          emailController.text.length > 0 &&
          nameController.text.length > 0 &&
          phonenumController.text.length > 0 &&
          jobController.text.length > 0 &&
          priceController.text.length > 0 &&
          timeController.text.length > 0 &&
          aboutController.text.length > 0) {
        if (_value) {
          gender = "Nam";
        }
        if (_value1) {
          gender = "Nữ";
        }
        if (_value2) {
          gender = "Khác";
        }
        KhuVuc kv = new KhuVuc();
        kv = keyDrop.currentState!.getKhuVuc;
        GiaSu giasu = new GiaSu();
        giasu.giasuId = giasus.giasuId;
        giasu.tendangnhap = usernameController.text;
        giasu.matkhau = passwordController.text;
        giasu.email = emailController.text;
        giasu.hoten = nameController.text;
        giasu.sdt = phonenumController.text;
        giasu.nghenghiep = jobController.text;
        giasu.hocphi = int.parse(priceController.text);
        giasu.thoigianday = timeController.text;
        giasu.gioithieubanthan = aboutController.text;
        giasu.gioitinh = gender;
        giasu.hinhthucday = dropdownValuehinhthuc;
        giasu.khuvucId = kv.khuvucId;
        update(context, check, giasu, hv);
      } else {
        showToast("Vui lòng nhập đầy đủ thông tin!");
      }
    }
  } else {
    if (_value && _value1 || _value && _value2 || _value1 && _value2) {
      showToast("Vui lòng chọn 1 giới tính!");
    } else {
      if (usernameController.text.length > 0 &&
          passwordController.text.length > 0 &&
          emailController.text.length > 0 &&
          nameController.text.length > 0 &&
          phonenumController.text.length > 0 &&
          jobController.text.length > 0) {
        if (_value) {
          gender = "Nam";
        }
        if (_value1) {
          gender = "Nữ";
        }
        if (_value2) {
          gender = "Khác";
        }
        HocVien hocvien = new HocVien();
        hocvien.hocvienId = hocviens.hocvienId;
        hocvien.tendangnhap = usernameController.text;
        hocvien.matkhau = passwordController.text;
        hocvien.email = emailController.text;
        hocvien.hoten = nameController.text;
        hocvien.sdt = phonenumController.text;
        hocvien.diachi = jobController.text;
        hocvien.gioitinh = gender;

        update(context, check, gs, hocvien);
      } else {
        showToast("Vui lòng nhập đầy đủ thông tin!");
      }
    }
  }
}

void update(context, bool check, GiaSu giasu, HocVien hocvien) {
  if (check == false) {
    var _giasu = Provider.of<GiaSuModel>(context, listen: false);
    _giasu.updateTKGiaSu(giasu).then((value) {
      if (value) {
        showToast("Cập nhật thông tin thành công!\n Vui lòng đăng nhập lại");
        // Navigator.pushAndRemoveUntil<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //       builder: (BuildContext context) => const Login()),
        //   ModalRoute.withName('/'),
        // );
      } else {
        showToast("Tài khoản hoặc mật khẩu không chính xác");
      }
    });
  } else {
    var _hocvien = Provider.of<HocVienModel>(context, listen: false);
    _hocvien.updateTKHocVien(hocvien).then((value) {
      if (value) {
        showToast("Cập nhật thông tin thành công!\n Vui lòng đăng nhập lại");
        // Navigator.pushAndRemoveUntil<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //       builder: (BuildContext context) => const Login()),
        //   ModalRoute.withName('/'),
        // );
      } else {
        showToast("Tài khoản hoặc mật khẩu không chính xác");
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
