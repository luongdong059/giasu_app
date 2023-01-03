import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:giasu_app/components/widgets/toast.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/chude.dart';
import 'package:giasu_app/models/giasu.dart';
import 'package:giasu_app/models/hocvien.dart';
import 'package:giasu_app/models/khuvuc.dart';
import 'package:giasu_app/models/lop.dart';
import 'package:giasu_app/screens/detail/components/btn_comment.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'components/combo_box.dart';
import 'components/combo_box_chude.dart';

final keyDrop = new GlobalKey<DropDownKhuVucState>();
final keyDrop1 = new GlobalKey<DropDownChuDeState>();

late TextEditingController tomtatController = new TextEditingController();
late TextEditingController motaController = new TextEditingController();
late TextEditingController phidukienController = new TextEditingController();
late TextEditingController thoiluongController = new TextEditingController();
late TextEditingController sohocvienController = new TextEditingController();
late TextEditingController diachicutheController = new TextEditingController();
String dropdownValuehinhthuc = 'Online';
String sex = "Nam";
var datetime;
String date = "";
KhuVuc kv = new KhuVuc();
ChuDe cd = new ChuDe();

final values = List.filled(7, false);
bool _value = false;
bool _value1 = false;
bool _value2 = false;
late List<KhuVuc> lst = <KhuVuc>[];
late List<ChuDe> lst1 = <ChuDe>[];

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key, required this.check, required this.hv})
      : super(key: key);
  final bool check;
  final HocVien hv;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _lop = Provider.of<LopModel>(context, listen: false);
    _lop.getListKhuVuc();
    _lop.getListChuDe();

    return Container(
      width: size.width,
      height: size.height,
      child: Consumer<LopModel>(
        builder: (_, snapshot, __) {
          if ((snapshot.lstKhuVuc.length <= 0) ||
              (snapshot.lstChuDe.length <= 0))
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          lst = snapshot.lstKhuVuc;
          lst1 = snapshot.lstChuDe;
          return SingleChildScrollView(
            child: Container(
              width: size.width,
              //height: size.height,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimens.kDefaultPadding,
                    ),
                    width: size.width - (Dimens.kDefaultPadding * 2),
                    //height: size.width / 2,
                    decoration: BoxDecoration(
                      color: ColorConstants.kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ],
                    ),

                    //Tom tat yeu cau
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.kDefaultPadding),
                      child: Column(
                        children: [
                          SizedBox(
                            //height: size.width / 3 - 50,
                            child: TextField(
                              onChanged: (value) {},
                              controller: tomtatController,
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              style: TextStyle(
                                  color: ColorConstants.kTextButtonColor),
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.kTextButtonColor,
                                        width: 2.0)),
                                hintText: HintConstants.nameclass,
                                hintStyle: TextStyle(
                                    color: ColorConstants.kTextButtonColor),
                              ),
                              //controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimens.kDefaultPadding,
                    ),
                    width: size.width - (Dimens.kDefaultPadding * 2),
                    //height: size.width / 2,
                    decoration: BoxDecoration(
                      color: ColorConstants.kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.kDefaultPadding),
                      child: Column(
                        children: [
                          SizedBox(
                            //height: size.width / 2,
                            child: TextField(
                              onChanged: (value) {},
                              controller: motaController,
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              style: TextStyle(
                                  color: ColorConstants.kTextButtonColor),
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.kTextButtonColor,
                                        width: 2.0)),
                                hintText: HintConstants.description,
                                hintStyle: TextStyle(
                                    color: ColorConstants.kTextButtonColor),
                              ),
                              //controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimens.kDefaultPadding,
                    ),
                    width: size.width - (Dimens.kDefaultPadding * 2),
                    //height: size.width / 2,
                    decoration: BoxDecoration(
                      color: ColorConstants.kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.kDefaultPadding),
                      child: Column(
                        children: [
                          //Price
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: Dimens.kDefaultPadding),
                            child: SizedBox(
                              //height: size.width / 3 - 50,
                              child: TextField(
                                onChanged: (value) {},
                                controller: phidukienController,
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                style: TextStyle(
                                    color: ColorConstants.kTextButtonColor),
                                keyboardType: TextInputType.number,
                                // inputFormatters: [
                                //   WhitelistingTextInputFormatter.digitsOnly
                                // ],
                                maxLines: 1,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              ColorConstants.kTextButtonColor,
                                          width: 2.0)),
                                  hintText: HintConstants.price,
                                  hintStyle: TextStyle(
                                      color: ColorConstants.kTextButtonColor),
                                ),
                                //controller: TextEditingController(),
                              ),
                            ),
                          ),
                          //Thời lượng
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: Dimens.kDefaultPadding),
                            child: SizedBox(
                              //height: size.width / 3 - 50,
                              child: TextField(
                                onChanged: (value) {},
                                controller: thoiluongController,
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                style: TextStyle(
                                    color: ColorConstants.kTextButtonColor),
                                keyboardType: TextInputType.number,
                                // inputFormatters: [
                                //   WhitelistingTextInputFormatter.digitsOnly
                                // ],
                                maxLines: 1,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              ColorConstants.kTextButtonColor,
                                          width: 2.0)),
                                  hintText: HintConstants.time,
                                  hintStyle: TextStyle(
                                      color: ColorConstants.kTextButtonColor),
                                ),
                                //controller: TextEditingController(),
                              ),
                            ),
                          ),

                          //So luong hoc vien
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: Dimens.kDefaultPadding),
                            child: SizedBox(
                              //height: size.width / 3 - 50,
                              child: TextField(
                                onChanged: (value) {},
                                controller: sohocvienController,
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                style: TextStyle(
                                    color: ColorConstants.kTextButtonColor),
                                keyboardType: TextInputType.number,
                                // inputFormatters: [
                                //   WhitelistingTextInputFormatter.digitsOnly
                                // ],
                                maxLines: 1,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              ColorConstants.kTextButtonColor,
                                          width: 2.0)),
                                  hintText: HintConstants.peoplenumber,
                                  hintStyle: TextStyle(
                                      color: ColorConstants.kTextButtonColor),
                                ),
                                //controller: TextEditingController(),
                              ),
                            ),
                          ),

                          //Address
                          SizedBox(
                            //height: size.width / 3 - 50,
                            child: TextField(
                              onChanged: (value) {},
                              controller: diachicutheController,
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              style: TextStyle(
                                  color: ColorConstants.kTextButtonColor),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines: 2,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.kTextButtonColor,
                                        width: 2.0)),
                                hintText: HintConstants.address,
                                hintStyle: TextStyle(
                                    color: ColorConstants.kTextButtonColor),
                              ),
                              //controller: TextEditingController(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  DropDownHinhThuc(),
                  CheckBoxSex(),
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimens.kDefaultPadding,
                    ),
                    padding: EdgeInsets.only(
                      top: Dimens.kDefaultPadding,
                      bottom: Dimens.kDefaultPadding,
                    ),
                    width: size.width - (Dimens.kDefaultPadding * 2),
                    //height: size.width / 2,
                    decoration: BoxDecoration(
                      color: ColorConstants.kPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.2),
                        )
                      ],
                    ),
                    child: TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2000, 1, 1),
                              maxTime: DateTime(2055, 1, 1),
                              onChanged: (date) {}, onConfirm: (date) {
                            datetime = date;
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.vi);
                        },
                        child: Text(
                          'Chọn thời gian học bắt đầu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  //Combobox
                  Container(
                      margin: EdgeInsets.only(
                        top: Dimens.kDefaultPadding,
                      ),
                      padding: EdgeInsets.only(
                        top: Dimens.kDefaultPadding,
                        bottom: Dimens.kDefaultPadding,
                      ),
                      width: size.width - (Dimens.kDefaultPadding * 2),
                      //height: size.width / 2,
                      decoration: BoxDecoration(
                        color: ColorConstants.kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimens.kDefaultBorderRadiusContainer),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.2),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Chọn buổi có thể học",
                            style: TextStyle(
                                color: ColorConstants.kTextButtonColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          DaySelect(),
                        ],
                      )),

                  DropDownKhuVuc(key: keyDrop, lst: lst),

                  DropDownChuDe(key: keyDrop1, lst: lst1),

                  Container(
                      margin: EdgeInsets.only(
                        top: Dimens.kDefaultPadding / 2,
                        bottom: Dimens.kDefaultPadding,
                      ),
                      child: ButtonComment(size, ButtonConstants.post, context,
                          () {
                        GiaSu gs = new GiaSu();

                        getData(context, gs, hv);
                      }))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DaySelect extends StatefulWidget {
  const DaySelect({Key? key}) : super(key: key);

  @override
  _DaySelectState createState() => _DaySelectState();
}

class _DaySelectState extends State<DaySelect> {
  @override
  Widget build(BuildContext context) {
    return WeekdaySelector(
      onChanged: (int day) {
        setState(() {
          // Use module % 7 as Sunday's index in the array is 0 and
          // DateTime.sunday constant integer value is 7.
          final index = day % 7;
          // We "flip" the value in this example, but you may also
          // perform validation, a DB write, an HTTP call or anything
          // else before you actually flip the value,
          // it's up to your app's needs.
          values[index] = !values[index];
          // print(values);
          // print(index);
        });
      },
      values: values,
    );
  }
}

void getData(context, GiaSu giasus, HocVien hocviens) {
  if (_value && _value1 || _value && _value2 || _value1 && _value2) {
  } else {
    if (tomtatController.text.length > 0 &&
        motaController.text.length > 0 &&
        phidukienController.text.length > 0 &&
        thoiluongController.text.length > 0 &&
        sohocvienController.text.length > 0 &&
        diachicutheController.text.length > 0) {
      if (_value) {
        sex = "Nam";
      }
      if (_value1) {
        sex = "Nữ";
      }
      if (_value2) {
        sex = "Khác";
      }
      date = getDate();
      kv = keyDrop.currentState!.getKhuVuc;
      cd = keyDrop1.currentState!.getChuDe;
      print(
          "${tomtatController.text} / ${motaController.text}/ ${date} / ${phidukienController.text} / ${thoiluongController.text}/ ${dropdownValuehinhthuc} / ${sohocvienController.text} / ${diachicutheController.text} / ${sex} / ${kv.khuvucId} /  ${cd.tenchude} / ${datetime}");

      Lop lop = new Lop();
      lop.tenlop = tomtatController.text;
      lop.hinhthuc = dropdownValuehinhthuc;
      lop.yeucaugioitinh = sex;
      lop.sohocvien = int.parse(sohocvienController.text);
      lop.thoigianhoc = datetime;
      lop.thoiluong = int.parse(thoiluongController.text);
      lop.lichdukien = date;
      lop.diadiem = diachicutheController.text;
      lop.khuvucId = kv.khuvucId;
      lop.chudeId = cd.chudeId;
      lop.hocvienId = hocviens.hocvienId;
      lop.hocphidenghi = int.parse(phidukienController.text);
      lop.noidungyeucau = motaController.text;
      update(context, int.parse(hocviens.hocvienId.toString()), lop);
    } else {
      showToast("Vui lòng nhập đầy đủ thông tin!");
    }
  }
}

String getDate() {
  print(kv.tenkhuvuc);
  var date = "";
  for (var i = 0; i <= values.length - 1; i++) {
    if (values[i] == true && i == 0) {
      date += "Chủ Nhật; ";
    } else if (values[i] == true && i == 1) {
      date += "Thứ Hai; ";
    } else if (values[i] == true && i == 2) {
      date += "Thứ Ba; ";
    } else if (values[i] == true && i == 3) {
      date += "Thứ Tư; ";
    } else if (values[i] == true && i == 4) {
      date += "Thứ Năm; ";
    } else if (values[i] == true && i == 5) {
      date += "Thứ Sáu; ";
    } else if (values[i] == true && i == 6) {
      date += "Thứ Bảy; ";
    }
  }
  return date;
}

class CheckBoxSex extends StatefulWidget {
  const CheckBoxSex({Key? key}) : super(key: key);

  @override
  _CheckBoxSexState createState() => _CheckBoxSexState();
}

class _CheckBoxSexState extends State<CheckBoxSex> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width - (Dimens.kDefaultPadding * 2),
        margin: EdgeInsets.only(top: Dimens.kDefaultPadding),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ColorConstants.kPrimaryColor,
          borderRadius:
              BorderRadius.circular(Dimens.kDefaultBorderRadiusContainer),
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
          checkColor: Colors.black,
          activeColor: Colors.white,
        ),
        Text(text, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

String getSex() {
  var sex = "";
  if (_value) {
    sex += "Nam; ";
  }
  if (_value1) {
    sex += "Nữ; ";
  }
  if (_value2) {
    sex += "Khác; ";
  }
  return sex;
}

class DropDownHinhThuc extends StatefulWidget {
  const DropDownHinhThuc({Key? key}) : super(key: key);

  @override
  _DropDownHinhThucState createState() => _DropDownHinhThucState();
}

class _DropDownHinhThucState extends State<DropDownHinhThuc> {
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

Future<void> update(context, int idhv, Lop lop) async {
  var _lop = Provider.of<LopModel>(context, listen: false);
  await _lop.getLength(idhv.toString(), "0").then(
    (value) {
      if (value >= 5) {
        showToast(
            "Không thành công! \n Tài khoản hiện tai đã có ($value) lớp \n Đã quá số lượng quy đinh!");
      } else {
        _lop.requestAddLop(idhv, lop).then(
          (value) {
            if (value) {
              showToast("Đăng bài thành công \n Chờ hệ thống xét duyệt");
            } else {
              showToast("Đăng bài không thành công");
            }
          },
        );
      }
    },
  );
}
