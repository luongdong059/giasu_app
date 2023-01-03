import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:giasu_app/constants/constants.dart';

Widget Comment(
    {@required name, @required url, @required detail, @required rate}) {
  return Column(
    children: [
      Row(children: [
        Container(
          padding: EdgeInsets.only(
              top: Dimens.kDefaultPadding,
              left: Dimens.kDefaultPadding,
              right: Dimens.kDefaultPadding),
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  url!.length > 0 ? url.toString() : TextString.imageDefaut,
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
              Text(name,
                  style: TextStyle(
                      color: ColorConstants.kTextButtonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Text(
                detail,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorConstants.kTextButtonColor,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ]),
      rate != null
          ? AbsorbPointer(
              absorbing: true,
              child: RatingBar.builder(
                initialRating: double.parse(rate.toString()),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            )
          : Text(""),
    ],
  );
}
