import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/screens/detail/components/btn_comment.dart';

class FilterGiasu extends StatelessWidget {
  const FilterGiasu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.filterTitle),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownChuDe(),
            Spacer(),
            ButtonComment(size, ButtonConstants.search, context, () {
              print({
                dropdownValuetinh,
                dropdownValuemon,
                dropdownValuechude,
                dropdownValuegioitinh,
                dropdownValuehinhthuc
              });
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}

String dropdownValuetinh = 'Thái Nguyên';
String dropdownValuemon = 'Toán';
String dropdownValuechude = 'Toán1';
String dropdownValuegioitinh = 'Nam';
String dropdownValuehinhthuc = 'Online';

class DropDownChuDe extends StatefulWidget {
  const DropDownChuDe({Key? key}) : super(key: key);

  @override
  _DropDownChuDeState createState() => _DropDownChuDeState();
}

class _DropDownChuDeState extends State<DropDownChuDe> {
  List<String> tinh = [
    'Thái Nguyên',
    'TP HCM',
    'Gia Lai',
    'Tây Ninh',
    'Lào Cai',
    'Cao Bằng',
  ];

  List<String> mon = [
    'Toán',
    'Lý',
    'Hoá',
    'Sinh',
    'Văn',
    'Sử',
  ];

  List<String> chude = [
    'Toán1',
    'Lý1',
    'Hoá1',
    'Sinh1',
    'Văn1',
    'Sử1',
  ];

  List<String> gioitinh = ['Nam', 'Nữ', 'Khác'];

  List<String> hinhthuc = ['Online', 'Offline', 'Online, Offline'];

  void _selectedTab(String? newValue, int index) {
    switch (index) {
      case 1:
        setState(() {
          dropdownValuetinh = newValue!;
        });
        break;

      case 2:
        setState(() {
          dropdownValuemon = newValue!;
        });
        break;
      case 3:
        setState(() {
          dropdownValuechude = newValue!;
        });
        break;
      case 4:
        setState(() {
          dropdownValuegioitinh = newValue!;
        });
        break;
      case 5:
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
        DropDownCard(dropdownValuetinh, tinh, 1, ButtonConstants.titleTinh),
        DropDownCard(dropdownValuemon, mon, 2, ButtonConstants.titleMon),
        DropDownCard(dropdownValuechude, chude, 3, ButtonConstants.titleChude),
        DropDownCard(
            dropdownValuegioitinh, gioitinh, 4, ButtonConstants.titleGioitinh),
        DropDownCard(
            dropdownValuehinhthuc, hinhthuc, 5, ButtonConstants.titleHinhthuc),
      ],
    );
  }

  Card DropDownCard(String value1, List<String> data, int index, String title) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(Dimens.kDefaultPadding),
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
