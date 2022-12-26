import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nation_of_delivery/pages/WidgetPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 나중에 api로 가져올 것들
    var bannerData = [
      {'text': 'go shops', 'link': '/shops'},
      {'text': 'go home', 'link': '/'},
      {'text': 'go widgets', 'link': '/widgets'},
      {'text': 'go shops', 'link': '/shops'},
      {'text': 'go home', 'link': '/'},
      {'text': 'go widgets', 'link': '/widgets'}
    ];

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('주소'),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () => {Navigator.pushNamed(context, '/widgets')}),
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () => {}),
          IconButton(icon: Icon(Icons.person), onPressed: () => {}),
        ],
      ),
      body: Column(children: [
        Container(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextFormField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                hintText: '배고프니까 일단 검색!!',
              )),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: bannerData
                    .map((e) => Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: FilledButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15))),
                          onPressed: () =>
                              {Navigator.pushNamed(context, "${e['link']}")},
                          child: Text(
                            '${e["text"]}',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        )))
                    .toList(),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.red),
            Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.amber)
          ]),
        )
      ]),
    );
  }
}

/*
[1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                            child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        )));
                  },
                );
              }).toList()
*/
/*
bottom: AppBar(
              title: TextFormField(
                  decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            hintText: '배고프니까 일단 검색!!',
          )))
          */