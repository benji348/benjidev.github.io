import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void customDialog(text1, text2, text3, icon, send) {
  const String myemail = 'benjaminampouala@gmail.com';
  TextEditingController controllerHirer = TextEditingController();
  TextEditingController controllerMessage = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RxBool isMessageEmpty = true.obs;

  RxBool isSubjectEmtpy = true.obs;

  bool ckeckMessage() {
    controllerMessage.addListener(() {
      if (controllerMessage.text.trim().isEmpty ||
          controllerHirer.text.trim().isEmpty) {
        isMessageEmpty.value = true;
      } else {
        final isValid = _formKey.currentState!.validate();
        if (isValid) {
          _formKey.currentState!.save();
          isMessageEmpty.value = false;
        }
      }
    });
    return isMessageEmpty.value;
  }

  bool checkSubject() {
    controllerHirer.addListener(() {
      if (controllerHirer.text.trim().isEmpty ||
          controllerMessage.text.trim().isEmpty) {
        isSubjectEmtpy.value = true;
      } else {
        final isValid = _formKey.currentState!.validate();
        if (isValid) {
          _formKey.currentState!.save();
          isSubjectEmtpy.value = false;
        }
      }
    });
    return isSubjectEmtpy.value;
  }

  Get.defaultDialog(
    title: '',
    content: Column(mainAxisSize: MainAxisSize.min, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: Colors.blue,
          )
        ],
      ),
      Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 3) {
                    return 'The name is too short less than three(3) characters';
                  }
                },
                controller: controllerHirer,
                decoration: InputDecoration(
                  label: Text(text2),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 10) {
                    return 'The message should contain at list ten(10) characters';
                  }
                },
                controller: controllerMessage,
                minLines: 1,
                decoration: InputDecoration(
                  label: Text(text3),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 40)),
                    onPressed: ckeckMessage() || checkSubject()
                        ? null
                        : () async {
                            String url =
                                ('mailto:$myemail?subject=${Uri.encodeFull(controllerHirer.text)}&body=${Uri.encodeFull(controllerMessage.text)}');
                            if (_formKey.currentState!.validate()) {
                              if (await canLaunch(url)) {
                                launch(url);
                                controllerHirer.clear();
                                controllerMessage.clear();
                                Get.back();
                              }
                            }
                          },
                    child: Text(send)),
              )
            ],
          )),
    ]),
  );
}
