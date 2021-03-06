import 'package:esmserviceweb/bodys/list_photo.dart';
import 'package:esmserviceweb/bodys/take_photo.dart';
import 'package:esmserviceweb/bodys/web_service.dart';
import 'package:esmserviceweb/utility/my_constant.dart';
import 'package:esmserviceweb/utility/my_dialog.dart';
import 'package:esmserviceweb/widgets/show_image.dart';
import 'package:esmserviceweb/widgets/show_menu.dart';
import 'package:esmserviceweb/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String? nameLogin;
  var bodys = <Widget>[
    const WebService(),
    const TakePhoto(),
    const ListPhoto(),
  ];
  int indexBody = 0;

  var titles = <String>[
    'Web Service',
    'Take Photo',
    'List All Photo',
  ];

  @override
  void initState() {
    super.initState();
    findNameLogin();
  }

  Future<void> findNameLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    nameLogin = preferences.getString('data');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ShowText(
          text: titles[indexBody],
          textStyle: MyConstant().h2WhiteStyle(),
        ),
        backgroundColor: MyConstant.primary,
      ),
      drawer: newDrawer(context),
      body: bodys[indexBody],
    );
  }

  Widget newDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const ShowImage(),
            decoration: MyConstant().planBox(),
            accountName: ShowText(
              text: nameLogin ?? '',
              textStyle: MyConstant().h2WhiteStyle(),
            ),
            accountEmail: ShowText(
              text: 'Logined',
              textStyle: MyConstant().h3WhiteStyle(),
            ),
          ),
          ShowMenu(
            iconData: Icons.web,
            title: 'Web Service',
            pressFunc: () {
              Navigator.pop(context);
              setState(() {
                indexBody = 0;
              });
            },
          ),
          Divider(
            color: MyConstant.dark,
          ),
          ShowMenu(
            iconData: Icons.add_a_photo_outlined,
            title: 'Take ??????????????????',
            pressFunc: () {
              Navigator.pop(context);
              setState(() {
                indexBody = 1;
              });
            },
          ),
          Divider(
            color: MyConstant.dark,
          ),
          ShowMenu(
            iconData: Icons.list,
            title: titles[2],
            pressFunc: () {
              Navigator.pop(context);
              setState(() {
                indexBody = 2;
              });
            },
          ),
          Divider(
            color: MyConstant.dark,
          ),
          const Spacer(),
          Divider(
            color: MyConstant.dark,
          ),
          ShowMenu(
            iconData: Icons.exit_to_app,
            title: 'SignOut',
            pressFunc: () {
              Navigator.pop(context);
              MyDialog(context: context).normalDialog(
                title: 'Sign Out ?',
                subTitle: 'Confirm SignOut by tab Confirm',
                label: 'Confirm',
                pressFunc: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.clear().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authen', (route) => false);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
