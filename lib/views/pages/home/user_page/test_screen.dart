import 'package:flutterappclone/database/services/user_service.dart';
import 'package:flutterappclone/views/widgets/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late QuerySnapshot querySnapshot;
  late Map<String, dynamic> data;
  //CollectionReference users = FirebaseFirestore.instance.collection('users');
  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
  //     .collection('users')
  //     .where('uID', isEqualTo: 'WrQpTkUiTeh0YagCoP5BCHJrhf62')
  //     .snapshots();
  late Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    super.initState();
    getUID();
    _tabController = TabController(length: 2, vsync: this);
  }

  getUID() async {
    //_usersStream = await UserService.getUserInfo();
    //await UserService.getUserInfo().then((snapshot) {
    //querySnapshot = snapshot;
    // setState(() {
    //   Map<String, dynamic> data =
    //       querySnapshot.docs.first.data() as Map<String, dynamic>;
    // });
    //});
    //data = querySnapshot.docs.first.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          alignment: Alignment.center,
          fontsize: 20,
          text: '   Profile',
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              UserService.getUserInfo();
            },
            icon: Icon(
              Icons.edit,
              color: Colors.blueAccent,
            ),
          ),
        ],
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://tophinhanh.com/wp-content/uploads/2021/12/hinh-anime-nu-sieu-de-thuong.jpg',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -16,
                    right: -15,
                    child: IconButton(
                      onPressed: () {
                        UserService.getUserInfo();
                      },
                      icon: Icon(
                        Icons.upload_sharp,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomText(
              alignment: Alignment.center,
              fontsize: 20,
              text: 'Cao Mỹ Linh ',
              fontFamily: 'Inter',
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            CustomText(
              alignment: Alignment.center,
              fontsize: 16,
              text: 'linhcm02032000@gmail.com ',
              fontFamily: 'Inter',
              color: Colors.black45,
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                labelColor: Colors.red,
                indicator: MaterialIndicator(
                  height: 3,
                  topLeftRadius: 0,
                  topRightRadius: 0,
                  bottomLeftRadius: 5,
                  bottomRightRadius: 5,
                  horizontalPadding: 16,
                  tabPosition: TabPosition.bottom,
                ),
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.video_collection,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height - 363,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  FutureBuilder(
                    future: UserService.getUserInfo(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 14,
                                    text: 'Full Name ',
                                    fontFamily: 'Poppins',
                                    color: Colors.black26,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 20,
                                    text: snapshot.data.get('fullName') == null
                                        ? ''
                                        : '${snapshot.data.get('fullName')}',
                                    fontFamily: 'Montserrat',
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 14,
                                    text: 'Phone Number ',
                                    fontFamily: 'Poppins',
                                    color: Colors.black26,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 20,
                                    text: snapshot.data.get('phone') == null
                                        ? ''
                                        : '${snapshot.data.get('phone')}',
                                    fontFamily: 'Montserrat',
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 14,
                                    text: 'Age',
                                    fontFamily: 'Poppins',
                                    color: Colors.black26,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 20,
                                    text: '22',
                                    fontFamily: 'Montserrat',
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 14,
                                    text: 'Gender',
                                    fontFamily: 'Poppins',
                                    color: Colors.black26,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 20,
                                    text: 'Nữ',
                                    fontFamily: 'Montserrat',
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 14,
                                    text: 'Email',
                                    fontFamily: 'Poppins',
                                    color: Colors.black26,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    alignment: Alignment.centerLeft,
                                    fontsize: 20,
                                    text: snapshot.data.get('email') == null
                                        ? ''
                                        : '${snapshot.data.get('email')}',
                                    fontFamily: 'Montserrat',
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
