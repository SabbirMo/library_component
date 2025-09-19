import 'package:library_component/setting_property/setting_property.dart';
import 'package:library_component/setting_property/widget/setting_row.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? selectedLanguage = "English";
  bool appearanceSettingsEnabled = false;
  bool showArabic = false;

  // Appearance Settings variables
  bool _tajweedColorEnabled = false;
  bool _keepScreenOnEnabled = false;
  String _selectedTheme = 'System';

  // View Settings variables
  bool _showLineNumbers = false;
  bool _fullScreenMode = false;
  bool _showOtherInfo = false;
  bool _dailyNotification = false;
  TimeOfDay _selectedTime = TimeOfDay(hour: 17, minute: 0); // Default 5:00 PM

  // ড্রপডাউনের জন্য নির্বাচিত মানগুলো সংরক্ষণের জন্য ভেরিয়েবল
  String? _selectedAppLanguage = 'English';
  String? _selectedTranslation = 'Sahi International';
  String? _selectedWordLanguage = 'English';
  String? _selectedAudio = 'Abdul Basit Mujawwad';
  String? _setectedScript = "Uthma";
  String? _setectedArabicFont = "KFGQ Hafs";

  // ফন্ট সাইজের জন্য ভ্যারিয়েবল
  double _arabicFontSize = 18.0;
  double _translationFontSize = 14.0;

  // ড্রপডাউনের আইটেমগুলোর তালিকা
  final List<String> _appLanguages = ['English', 'Bengali', 'Arabic'];
  final List<String> _translations = [
    'Sahi International',
    'Pickthall',
    'Yusuf Ali',
  ];
  final List<String> _wordLanguages = ['English', 'Bengali', 'Urdu'];
  final List<String> _audioReciters = [
    'Abdul Basit Mujawwad',
    'Mishary Rashid Alafasy',
    'Saad Al Ghamdi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfaf3),
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xfffbecd6),
        leading: Icon(Icons.arrow_back_ios, size: 18, color: Color(0xff895737)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AccordionWidget.simple(
              title: "Genaral Settings",
              svgPath: 'assets/svg/setting.svg',
              isSwitch: true,
              theme: AccordionTheme(enableRipple: false),

              context: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SettingDropdown.simple(
                      label: 'App Language',
                      value: _selectedAppLanguage,
                      items: _appLanguages,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedAppLanguage = newValue;
                        });
                      },

                      // কোন theme specify করি নি - default style ব্যবহার হবে
                    ),

                    SettingDropdown.simple(
                      label: 'Translation',
                      value: _selectedTranslation,
                      items: _translations,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedTranslation = newValue;
                        });
                      },
                    ),

                    SettingDropdown.simple(
                      label: 'Word by Word Language',
                      value: _selectedWordLanguage,
                      items: _wordLanguages,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedWordLanguage = newValue;
                        });
                      },
                    ),

                    SettingDropdown.simple(
                      label: 'Default Audio',
                      value: _selectedAudio,
                      items: _audioReciters,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedAudio = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            AccordionWidget.simple(
              title: "Font Settings",
              svgPath: 'assets/svg/fonts.svg',
              theme: AccordionTheme(enableRipple: false),
              context: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Font Preview Container
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xffF2EAE0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Arabic Font Preview - Right side
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'ٱلْحَمْدُلِلَّهِرَبِّٱلْعَٰلَمِينَ',
                              style: TextStyle(
                                fontSize: _arabicFontSize,
                                color: Color(0xff655248),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arabic_Font",
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          // Translation Font Preview - Left side
                          Text(
                            'All praise is for Allah—Lord of all worlds.',
                            style: TextStyle(
                              fontSize: _translationFontSize,
                              color: Color(0xff655248),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SettingDropdown.simple(
                      label: "Script",
                      value: _setectedScript,
                      items: ['Uthma', 'Arabic', 'English'],
                      onChanged: (value) {
                        setState(() {
                          _setectedScript = value;
                        });
                      },
                    ),
                    SettingDropdown.simple(
                      label: "Arabic Font",
                      value: _setectedArabicFont,
                      items: ['KFGQ Hafs', 'Arabic', 'English'],
                      onChanged: (value) {
                        setState(() {
                          _setectedArabicFont = value;
                        });
                      },
                    ),

                    SettingDropdown.slider(
                      label: "Arabic Font Size",
                      value: _arabicFontSize,
                      min: 14.0,
                      max: 50.0,
                      onChanged: (value) {
                        setState(() {
                          _arabicFontSize = value;
                        });
                      },
                      theme: SettingTheme(iconColor: Color(0xff895737)),
                    ),

                    SettingDropdown.slider(
                      label: "Translation Font Size",
                      value: _translationFontSize,
                      min: 10.0,
                      max: 50.0,
                      onChanged: (value) {
                        setState(() {
                          _translationFontSize = value;
                        });
                      },
                      theme: SettingTheme(iconColor: Color(0xff895737)),
                    ),
                  ],
                ),
              ),
            ),

            AccordionWidget.simple(
              title: "Appearance Settings",
              svgPath: 'assets/svg/element-1.svg',
              theme: AccordionTheme(enableRipple: false),
              isSwitch: true,
              switchValue: appearanceSettingsEnabled,
              onSwitchChanged: (value) {
                setState(() {
                  appearanceSettingsEnabled = value;
                });
              },
              context: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Tajweed Color Switch using SettingRow widget
                    SettingRow.switchRow(
                      title: 'Tajweed Color',
                      value: _tajweedColorEnabled,
                      onChanged: (value) {
                        setState(() {
                          _tajweedColorEnabled = value;
                        });
                      },
                      activeColor: Color(0xff895737),
                      inactiveColor: Color(0xffF2EAE0),
                    ),

                    SizedBox(height: 22),

                    // Read Tajweed Rules Section
                    GestureDetector(
                      onTap: () {
                        // Navigate to Tajweed Rules page
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffF2EAE0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Read Tajweed Rules',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff655248),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Color(0xff895737),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 22),

                    // Keep Screen On Switch using SettingRow widget
                    SettingRow.switchRow(
                      title: 'Keep Screen On',
                      value: _keepScreenOnEnabled,
                      onChanged: (value) {
                        setState(() {
                          _keepScreenOnEnabled = value;
                        });
                      },
                      activeColor: Color(0xff895737),
                      inactiveColor: Color(0xffF2EAE0),
                    ),

                    SizedBox(height: 20),

                    // Interface Theme Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Interface Theme',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12),

                        // Theme Selection Boxes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildThemeOption(
                              'System',
                              Icons.settings_system_daydream,
                            ),
                            _buildThemeOption('Light', Icons.light_mode),
                            _buildThemeOption('Dark', Icons.dark_mode),
                            _buildThemeOption('Green', Icons.nature),
                            _buildThemeOption('Tilt', Icons.rotate_right),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            AccordionWidget.simple(
              title: "Word By Word",
              svgPath: 'assets/svg/board.svg',
              isSwitch: false,
              theme: AccordionTheme(enableRipple: false),
              switchValue: appearanceSettingsEnabled,

              onSwitchChanged: (value) {
                setState(() {
                  appearanceSettingsEnabled = value;
                });
              },
            ),
            AccordionWidget.simple(
              title: "View Settings",
              svgPath: 'assets/svg/view.svg',
              isSwitch: true,
              theme: AccordionTheme(enableRipple: false),
              onSwitchChanged: (value) {
                setState(() {
                  appearanceSettingsEnabled = value;
                });
              },
              context: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Example SettingRow.switchRow usage
                    SettingRow.switchRow(
                      title: 'Show Arabic',

                      value: _showLineNumbers,
                      onChanged: (value) {
                        setState(() {
                          _showLineNumbers = value;
                        });
                      },
                      activeColor: Color(0xff895737),
                      inactiveColor: Color(0xffF2EAE0),
                    ),

                    SizedBox(height: 12),

                    SettingRow.switchRow(
                      title: 'Show Translation',
                      value: _fullScreenMode,
                      onChanged: (value) {
                        setState(() {
                          _fullScreenMode = value;
                        });
                      },
                      activeColor: Color(0xff895737),
                      inactiveColor: Color(0xffF2EAE0),
                    ),

                    SizedBox(height: 12),

                    SettingRow.switchRow(
                      title: "Show Other Info",
                      value: _showOtherInfo,
                      activeColor: Color(0xff895737),
                      inactiveColor: Color(0xffF2EAE0),
                      onChanged: (value) {
                        setState(() {
                          _showOtherInfo = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            AccordionWidget.simple(
              title: "Notification Settings",
              svgPath: 'assets/svg/notification.svg',
              theme: AccordionTheme(enableRipple: false),
              context: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SettingRow.switchRow(
                      title: "Daily Notification",
                      value: _dailyNotification,
                      activeColor: Color(0xff895737),
                      inactiveColor: Color(0xffF2EAE0),
                      onChanged: (value) {
                        setState(() {
                          _dailyNotification = value;
                        });
                      },
                    ),
                    SettingRow.customRow(
                      title: "Set Time",
                      customWidget: GestureDetector(
                        onTap: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                            initialEntryMode: TimePickerEntryMode.dial,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Color(0xff895737),
                                    onSurface: Color(0xff655248),
                                  ),
                                  timePickerTheme: TimePickerThemeData(
                                    dialTextStyle: TextStyle(fontSize: 16),
                                    hourMinuteTextStyle: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    MediaQuery(
                                      data: MediaQuery.of(
                                        context,
                                      ).copyWith(alwaysUse24HourFormat: false),
                                      child: child!,
                                    ),
                                    // Hide the keyboard icon with a positioned widget
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                          if (picked != null && picked != _selectedTime) {
                            setState(() {
                              _selectedTime = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffF2EAE0),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xffDBC9BB),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _selectedTime.format(context),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff655248),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff895737),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Theme Selection Widget Builder
  Widget _buildThemeOption(String themeName, IconData icon) {
    bool isSelected = _selectedTheme == themeName;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTheme = themeName;
        });
      },
      child: Column(
        children: [
          Container(
            width: 68,
            height: 95,
            decoration: BoxDecoration(
              color: Color(0xffF2EAE0),
              borderRadius: BorderRadius.circular(12),
              border:
                  isSelected
                      ? Border.all(color: Color(0xff895737), width: 2)
                      : Border.all(color: Color(0xffF2EAE0), width: 1),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isSelected)
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff895737), width: 2),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                if (isSelected)
                  Positioned(
                    right: 15,
                    top: 15,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xff895737),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Text(
            themeName,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff895737),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
