import 'package:flutter/material.dart';
import 'package:library_component/accordion/models/accordion_theme.dart';
import 'package:library_component/accordion/widget/accordion_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfaf3),
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xfffbecd6),
        leading: Icon(Icons.arrow_back_ios,  size: 18, color: Color(0xff895737)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AccordionWidget.simple(
              title: "Genaral Settings", svgPath: 'assets/svg/setting.svg', 
              
              theme: AccordionTheme(
                titleColor: Color(0xff895737),
                enableRipple: false,
                
                textStyle: TextStyle(
                  fontSize: 16,
                )
                
              ),
              context: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start  ,
                  children: [
                    Text("App Language"),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF2EAE0),
                        borderRadius: BorderRadius.circular(8),

                      ),
                           child: DropdownButton<String>(
                        value: selectedLanguage,
                        underline: SizedBox(),
                        isExpanded: true,
                        dropdownColor: Color(0xffF2EAE0),
                        icon: Icon(Icons.keyboard_arrow_right_outlined,),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(12),
                        items: [
                          DropdownMenuItem(value: "English", child: Text("English")),
                          DropdownMenuItem(value: "Hindi", child: Text("Hindi")),
                          DropdownMenuItem(value: "Marathi", child: Text("Marathi")),
                        ], 
                        onChanged: (value) {
                          setState(() {
                             selectedLanguage = value!;
                          });
                        }
                      )
                    ),
                  ]
                ),
              
              ),
              
            ),
            AccordionWidget.simple(
              title: "Font Settings", svgPath: 'assets/svg/fonts.svg',
            ),
          
            AccordionWidget.simple(
              title: "Appearance Settings", svgPath: 'assets/svg/element-1.svg',
            ),
          
          ],
        ),
      )
    );
  }
}