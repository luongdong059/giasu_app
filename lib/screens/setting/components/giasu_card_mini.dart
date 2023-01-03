import 'package:flutter/material.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:giasu_app/models/giasu.dart';

Widget GiaSuCard({required GiaSu giasu, required Function press}) {
  return GestureDetector(
    onTap: () => press(),
    child: Card(
      color: ColorConstants.kTextButtonColor,
      shadowColor: Colors.black,
      child: Column(
        children: [
          Row(children: [
            Container(
              padding: EdgeInsets.only(
                  //top: Dimens.kDefaultPadding,
                  left: Dimens.kDefaultPadding,
                  right: Dimens.kDefaultPadding),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      giasu.url!.length > 0
                          ? giasu.url.toString()
                          : TextString.imageDefaut,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(giasu.hoten.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text(
                    giasu.gioitinh.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstants.kTextColor,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    giasu.nghenghiep.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstants.kTextColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    ),
  );
}
