import 'package:esmserviceweb/utility/my_constant.dart';
import 'package:esmserviceweb/utility/my_dialog.dart';
import 'package:esmserviceweb/widgets/show_button.dart';
import 'package:esmserviceweb/widgets/show_form.dart';
import 'package:esmserviceweb/widgets/show_image.dart';
import 'package:esmserviceweb/widgets/show_text.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
          child: Container(
            decoration: MyConstant().gradienRadienBox(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLogo(boxConstraints),
                  newTitle(boxConstraints),
                  formUser(boxConstraints),
                  formPassword(boxConstraints),
                  buttonLogin(boxConstraints)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  SizedBox buttonLogin(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * MyConstant.factorSize,
      child: ShowButton(
        label: 'Login',
        pressFunc: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            //Have Space
            MyDialog(context: context).normalDialog(
                title: 'Have Space ?', subTitle: 'Please Fill Every Blank.');
          } else {
            //No Space
          }
        },
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      width: boxConstraints.maxWidth * MyConstant.factorSize,
      child: ShowForm(
          redEyeFunc: () {
            setState(() {
              redEye = !redEye;
            });
          },
          obscure: redEye,
          hint: 'Password :',
          iconData: Icons.lock_outline,
          changeFunc: (String string) {
            password = string.trim();
          }),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * MyConstant.factorSize,
      child: ShowForm(
        hint: 'User :',
        iconData: Icons.perm_identity,
        changeFunc: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  Widget newTitle(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * MyConstant.factorSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShowText(
            text: 'Login : ',
            textStyle: MyConstant().h1Style(),
          ),
        ],
      ),
    );
  }

  Widget newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * MyConstant.factorSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            width: boxConstraints.maxWidth * 0.4,
            child: const ShowImage(),
          ),
        ],
      ),
    );
  }
}
