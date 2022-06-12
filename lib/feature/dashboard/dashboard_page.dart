import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget tabbarBody() {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            top: 8,
          ),
          // reverse: true,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          "pic",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama rumah sakit"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Alamat"),
                        ]),
                    Spacer(),
                    Text(
                      "lihat detail",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
    );
  }
  
  Widget banner(int index){
    return Container(
      // margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.only(
          right: 70, left: 70, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          "Banner ${index+1}",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ],
                title: Text(
                  'Teleheal',
                  style: TextStyle(color: Colors.black),
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.only(
                          right: 60, left: 60, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          "Label",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.only(
                          right: 60, left: 60, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          "Label",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text("Rumah Sakit"),
                      Spacer(),
                      Text("Lihat Semua"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: Column(
                    children: [
                      DefaultTabController(
                        initialIndex: 1,
                        length: 4,
                        child: Column(
                          children: [
                            TabBar(
                                indicator: BoxDecoration(
                                  border: Border.all(),
                                ),
                                unselectedLabelColor: Colors.black54,
                                indicatorColor: Colors.transparent,
                                labelColor: Colors.black,
                                tabs: [
                                  Tab(
                                    text: "SEMUA",
                                  ),
                                  Tab(
                                    text: "BPJS",
                                  ),
                                  Tab(
                                    text: "Partner",
                                  ),
                                  Tab(
                                    text: "Terdekat",
                                  ),
                                ]),
                            Container(
                              //Add this to give height
                              height: 250,
                              // constraints: BoxConstraints.expand(),
                              child: TabBarView(children: [
                                tabbarBody(),
                                tabbarBody(),
                                tabbarBody(),
                                tabbarBody(),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 90,
                  child: ListView.separated(
                      padding: EdgeInsets.only(left: 20),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){
                        return banner(index);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      )
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text("Klinik"),
                      Spacer(),
                      Text("Lihat Semua"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, left: 20, right: 20),
                  child: Column(
                    children: [
                      DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: Column(
                          children: [
                            TabBar(
                                indicator: BoxDecoration(
                                  border: Border.all(),
                                ),
                                unselectedLabelColor: Colors.black54,
                                indicatorColor: Colors.transparent,
                                labelColor: Colors.black,
                                tabs: [
                                  Tab(
                                    text: "SEMUA",
                                  ),
                                  Tab(
                                    text: "BPJS",
                                  ),
                                  Tab(
                                    text: "Partner",
                                  ),
                                ]),
                            Container(
                              //Add this to give height
                              height: 250,
                              // constraints: BoxConstraints.expand(),
                              child: TabBarView(children: [
                                tabbarBody(),
                                tabbarBody(),
                                tabbarBody(),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
