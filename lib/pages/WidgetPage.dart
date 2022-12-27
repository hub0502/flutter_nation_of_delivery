import 'package:flutter/material.dart';

class Widgets extends StatelessWidget {
  const Widgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tabController;
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                '서비스 전체보기',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              backgroundColor: Colors.black.withOpacity(0),
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 300,
                    child: TabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            '배달',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '포장',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        )
                      ],
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      controller: _tabController,
                    )),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Row(children: [
                          Icon(Icons.abc),
                          Icon(Icons.abc),
                          Icon(Icons.abc)
                        ]),
                        Row(children: [
                          Icon(Icons.abc),
                          Icon(Icons.abc),
                          Icon(Icons.abc)
                        ]),
                        Row(children: [
                          Icon(Icons.abc),
                          Icon(Icons.abc),
                          Icon(Icons.abc)
                        ]),
                      ],
                    ),
                    Container(
                      child: Text('asd'),
                    )
                  ],
                ))
              ],
            )));
  }
}
