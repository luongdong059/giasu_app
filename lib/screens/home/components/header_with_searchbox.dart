import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/viewmodels/giasu_model.dart';
import 'package:giasu_app/viewmodels/lop_model.dart';
import 'package:provider/provider.dart';

late TextEditingController myController = new TextEditingController();

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
    required this.check,
  }) : super(key: key);

  final Size size;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      margin: EdgeInsets.only(bottom: Dimens.kDefaultPadding * 0.5),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              right: Dimens.kDefaultPadding,
              left: Dimens.kDefaultPadding,
              bottom: Dimens.kDefaultPadding,
            ),
            height: size.height * 0.17,
            decoration: BoxDecoration(
              color: ColorConstants.kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimens.kDefaultBorderRadiusHeader),
                bottomRight: Radius.circular(Dimens.kDefaultBorderRadiusHeader),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  TitleConstants.titleHeader,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                ClipOval(
                  child: Image.asset(
                    "assets/images/879.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: Dimens.kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: Dimens.kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: ColorConstants.kPrimaryColor.withOpacity(0.23),
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: HintConstants.search,
                        hintStyle: TextStyle(
                            color:
                                ColorConstants.kPrimaryColor.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      check
                          ? search1(context, myController.text.toString())
                          : search(context, myController.text.toString());
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<Null> search(context, String value) async {
  var _lop = Provider.of<LopModel>(context, listen: false);
  _lop.searchLop(value);
  return null;
}

Future<Null> search1(context, String value) async {
  var _giasu = Provider.of<GiaSuModel>(context, listen: false);
  _giasu.searchGiaSu(value);
  return null;
}
