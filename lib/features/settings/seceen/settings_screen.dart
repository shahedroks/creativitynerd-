
import 'package:flutter/material.dart';
import 'package:pdf_scanner/core/constants/color_control/all_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_scanner/core/widget/CustomAppbar.dart';
import 'package:pdf_scanner/core/widget/upgrade_plan_card.dart';
import 'package:pdf_scanner/features/navbar/screen/navbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/settingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _syncCloud = true;
  LanguageOption _selectedLanguage =  LanguageOption(
    code: 'en',
    name: 'English',
    nativeName: 'English',
    flagAsset: 'assets/flags/us.png',
  );

  int _currentTab = 3; // Settings tab

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:AllColor.white ,
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Settings',
                style: TextStyle(
                  fontSize:34.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "sf_Pro",
                  color: AllColor.black
                ),
              ),
               SizedBox(height: 20.h),
              /// UPGRADE CARD
              UpgradePlanCard(),
              SizedBox(height: 24.h),

              /// LANGUAGE
               _SectionHeader(title: 'LANGUAGE'),
              Card(
                child: SettingsTile(
                  leading: SvgPicture.asset(
                    'assets/images/language.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                  title: 'Language',
                  subtitle: 'English',
                  onTap: () async {
                    final result = await Navigator.of(context).push<LanguageOption>(
                      MaterialPageRoute(
                        builder: (_) => LanguageSelectionScreen(
                          selected: _selectedLanguage,
                        ),
                      ),
                    );
                    if (result != null) {
                      setState(() => _selectedLanguage = result);
                    }
                  },
                ),
              ),

              SizedBox(height: 10.h ),

              /// THEME
              _SectionHeader(title: 'THEME'),
              Card(
                child: SettingsTile(
                  leading: SvgPicture.asset(
                    'assets/images/appearance.svg',
                    height: 24.h,
                    width: 24.w,
                  ),
                  title: 'Appearance',
                  subtitle: 'Light',
                  onTap: () {},
                ),
              ),

               SizedBox(height: 10.h),

              /// CLOUD
               _SectionHeader(title: 'CLOUD'),
            SettingsSwitchTile(
                leading: SvgPicture.asset(
                  'assets/images/cloud.svg',
                  height: 24.h,
                  width: 24.w,
                ),
                title: 'Sync cloud storage',
                value: _syncCloud,
                onChanged: (v) => setState(() => _syncCloud = v),
              ),


             SizedBox(height: 10.h),

              /// GENERAL
               _SectionHeader(title: 'GENERAL'),

              SettingsTile(
                leading: SvgPicture.asset(
                  'assets/images/share.svg',
                  height: 24.h,
                  width: 24.w,
                ),
                title: 'Share app',
                subtitle: '',
                onTap: () {},
              ),
              SettingsTile(
                leading: SvgPicture.asset(
                  'assets/images/like.svg',
                  height: 24.h,
                  width: 24.w,
                ),
                title: 'Tate us',
                subtitle: '',
                onTap: () {},
              ),
              SettingsTile(
                leading: SvgPicture.asset(
                  'assets/images/privacy.svg',
                  height: 24.h,
                  width: 24.w,
                ),
                title: 'Privacy policy',
                subtitle: '',
                onTap: () {},
              ),
              SettingsTile(
                leading: SvgPicture.asset(
                  'assets/images/terms.svg',
                  height: 24.h,
                  width: 24.w,
                ),
                title: 'Terms of use',
                subtitle: '',
                onTap: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/// language model

class LanguageOption {
  final String code;
  final String name;
  final String nativeName;
  final String flagAsset;

  LanguageOption({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flagAsset,
  });
}

class LanguageSelectionScreen extends StatefulWidget {
  final LanguageOption selected;

  const LanguageSelectionScreen({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  late LanguageOption _current;

  final List<LanguageOption> _languages = [
    LanguageOption(
      code: 'en',
      name: 'English',
      nativeName: 'English',
      flagAsset: 'assets/images/eng.png',
    ),
    LanguageOption(
      code: 'fr',
      name: 'French',
      nativeName: 'français',
      flagAsset: 'assets/images/french.png',
    ),
    LanguageOption(
      code: 'de',
      name: 'Germany',
      nativeName: 'Deutsch',
      flagAsset: 'assets/images/geramany.png',
    ),
    LanguageOption(
      code: 'au',
      name: 'Australian',
      nativeName: 'English',
      flagAsset: 'assets/images/australian.png',
    ),
    LanguageOption(
      code: 'ru',
      name: 'Russian',
      nativeName: 'Русский',
      flagAsset: 'assets/images/russian.png',
    ),
    LanguageOption(
      code: 'ja',
      name: 'Japanese',
      nativeName: '日本語',
      flagAsset: 'assets/images/japan.png',
    ),
    LanguageOption(
      code: 'zh',
      name: 'Mandarin',
      nativeName: '中文',
      flagAsset: 'assets/images/mandarin.png',
    ),
    LanguageOption(
      code: 'it',
      name: 'Italian',
      nativeName: 'Italiano',
      flagAsset: 'assets/images/italian.png',
    ),
    LanguageOption(
      code: 'ar',
      name: 'Arabic',
      nativeName: 'العربية',
      flagAsset: 'assets/images/arabic.png',
    ),
    LanguageOption(
      code: 'ms',
      name: 'Malaysian',
      nativeName: 'Bahasa Melayu',
      flagAsset: 'assets/images/malasian.png',
    ),
    LanguageOption(
      code: 'ur',
      name: 'Urdu',
      nativeName: 'اردو',
      flagAsset: 'assets/images/urdu.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _current = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColor.gery, // overall page background
      appBar: CustomAppBar(
        title: "Choose language",
        actionText: 'Done',
       // onActionTap: () => Navigator.of(context).pop(_current),
        onBack: () => Navigator.of(context).pop(),
        centerTitle: false,
      ),

      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        itemCount: _languages.length,
        separatorBuilder: (_, __) => SizedBox(height: 4.h),
        itemBuilder: (context, index) {
          final lang = _languages[index];
          final selected = lang.code == _current.code;

          return InkWell(
            borderRadius: BorderRadius.circular(12.r),
            onTap: () => setState(() => _current = lang),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color:
                selected ? AllColor.white : AllColor.gery, // row background
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                leading: CircleAvatar(
                  radius: 18.r,
                  // backgroundColor: Colors.transparent,
                  child: Image.asset(
                    lang.flagAsset,
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  lang.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "sf_Pro",
                    fontWeight: FontWeight.w500,
                    color: AllColor.black,
                  ),
                ),
                subtitle: Text(
                  lang.nativeName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "sf_Pro",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
                trailing: selected
                    ? Icon(
                  Icons.check_rounded,
                  color: AllColor.primary,
                  size: 20.sp,
                )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// small helpers

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, top: 8.0),
      child: Text(
        title,
        style:  TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
          color: AllColor.black,
          fontFamily: "sf_Pro",

        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const SettingsTile({
    Key? key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                leading,
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "sf_Pro",
                      color: AllColor.black,
                    ),
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(width: 8.w),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AllColor.black,
                      fontFamily: "sf_Pro",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],

                SizedBox(width: 8.w),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AllColor.black,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),

    );
  }
}
class SettingsSwitchTile extends StatelessWidget {
  final Widget leading;     // <-- FIXED (Widget instead of IconData)
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              leading,                     // <-- SVG / Icon both will work
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "sf_Pro",
                    color: AllColor.black
                  ),
                ),
              ),
              Switch(
                activeColor: AllColor.white,                // circle (thumb) color ON
                activeTrackColor: AllColor.primary,    // track color ON
                //inactiveTrackColor: AllColor.black,
                value: value,
                onChanged: onChanged,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
