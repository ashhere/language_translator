import 'dart:io';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorApp extends StatefulWidget {
  const TranslatorApp({super.key});

  @override
  State<TranslatorApp> createState() => _TranslatorAppState();
}

class _TranslatorAppState extends State<TranslatorApp> {
  List<String> languages = [
    'English',
    'Nepali',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    '日本語 / Japanese',
    'Italian'
  ];
  List<String> languagescode = [
    'en',
    'ne',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it'
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'ja';
  String data = 'こんにちは';
  String selectedvalue = 'English';
  String selectedvalue2 = '日本語 / Japanese';
  TextEditingController controller =
      TextEditingController(text: 'How are you?');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   translate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff133356),
        title: Padding(
          padding: const EdgeInsets.only(left: 0, top: 05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 51,
                height: 51,
                child: Image.asset('assets/img/language.png'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff163a63),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('From'),
                const SizedBox(
                  width: 100,
                ),
                DropdownButton(
                  value: selectedvalue,
                  focusColor: Colors.transparent,
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: () {
                        if (lang == languages[0]) {
                          from = languagescode[0];
                        } else if (lang == languages[1]) {
                          from = languagescode[1];
                        } else if (lang == languages[2]) {
                          from = languagescode[2];
                        } else if (lang == languages[3]) {
                          from = languagescode[3];
                        } else if (lang == languages[4]) {
                          from = languagescode[4];
                        } else if (lang == languages[5]) {
                          from = languagescode[5];
                        } else if (lang == languages[6]) {
                          from = languagescode[6];
                        } else if (lang == languages[7]) {
                          from = languagescode[7];
                        } else if (lang == languages[8]) {
                          from = languagescode[8];
                        }
                        setState(() {
                          // print(lang);
                          // print(from);
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedvalue = value!;
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xff058686),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Form(
              key: formkey,
              child: TextFormField(
                controller: controller,
                maxLines: null,
                minLines: null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    errorStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
           const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('To'),
                const SizedBox(
                  width: 100,
                ),
                DropdownButton(
                  value: selectedvalue2,
                  focusColor: Colors.transparent,
                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: () {
                        if (lang == languages[0]) {
                          to = languagescode[0];
                        } else if (lang == languages[1]) {
                          to = languagescode[1];
                        } else if (lang == languages[2]) {
                          to = languagescode[2];
                        } else if (lang == languages[3]) {
                          to = languagescode[3];
                        } else if (lang == languages[4]) {
                          to = languagescode[4];
                        } else if (lang == languages[5]) {
                          to = languagescode[5];
                        } else if (lang == languages[6]) {
                          to = languagescode[6];
                        } else if (lang == languages[7]) {
                          to = languagescode[7];
                        } else if (lang == languages[8]) {
                          to = languagescode[8];
                        }
                        setState(() {
                          print(lang);
                          print(from);
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedvalue2 = value!;
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xff3a82d2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Center(
              child: SelectableText(
                data,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: translate,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.indigo.shade900),
                  fixedSize: const MaterialStatePropertyAll(Size(278, 45))),
              child:
                  // isloading
                  //     ? const SizedBox.square(
                  //         dimension: 20,
                  //         child: CircularProgressIndicator(
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     :
                  Row(
                children: [
                  const Text(
                    'Click to Translate',
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 193, 193),
                        fontSize: 22),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/img/translator.gif"))
                ],
              )),
          const SizedBox(
            height: 30,
          )
        ],
      )),
    );
  }
}
