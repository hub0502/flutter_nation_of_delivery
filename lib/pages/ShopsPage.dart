import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var shops = [
      {
        "store_name": "미담 정식도시락 전문점",
        "rating": 4.8,
        "reviews": 18,
        "title_menus": "간장 불고기 정식 도시락, 고추장 불고기",
        "min_price": 16000,
        "drive_tip": [3000]
      },
      {
        "store_name": "교반육회비빔밥&냉면 부암점",
        "rating": 5.0,
        "reviews": 74,
        "title_menus": "간장 불고기 정식 도시락, 고추장 불고기",
        "min_price": 8500,
        "drive_tip": [500, 3400]
      }
    ];

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Text("집밥이 그리워", style: TextStyle(color: Colors.black))],
          ),
          backgroundColor: Colors.black.withOpacity(0),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(icon: Icon(Icons.home_filled), onPressed: () => {}),
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined), onPressed: () => {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset('images/homefood.png', fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  Row(
                    children: [
                      Text('기본순  ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Text('광고'),
                      Icon(
                        Icons.help_outline_sharp,
                        size: 16,
                      )
                    ],
                  ),
                  Column(
                      children: shops
                          .map((e) => Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black))),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/homefood.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${e["store_name"]}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              '${toDouble(e["rating"])}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                                '(${calcul_reviews(e["reviews"])})')
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '최소주문 ${commaFormat(e["min_price"])}원, ${driveTipFormat(e["drive_tip"])}'),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                          .toList()),
                ]),
              )
            ],
          ),
        ));
  }
}

String calcul_reviews(reviews) {
  List reviewsCount = [10, 20, 30, 50, 100, 150, 200, 300, 500, 1000];

  if (reviews <= 10) {
    return reviews.toString();
  }

  for (int i = 0; i < reviewsCount.length; ++i) {
    if (reviews < reviewsCount[i]) {
      return reviewsCount[i - 1].toString() + "+";
    } else if (reviews == reviewsCount) {
      return reviews.toString();
    }
  }
  return '';
}

String toDouble(rating) {
  double a = rating;
  String b = a.toStringAsFixed(1);
  return b;
}

String commaFormat(num) {
  var a = NumberFormat("###,###,###,###").format(num).replaceAll(' ', '');
  return a;
}

String driveTipFormat(drive_tip) {
  if (drive_tip.length == 2) {
    return '배달팁 ${commaFormat(drive_tip[0])}원~${commaFormat(drive_tip[1])}원';
  }

  return '배달팁 ${commaFormat(drive_tip[0])}원';
}
