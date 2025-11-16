
import 'package:flutter/material.dart';
import 'package:pdf_scanner/core/constants/color_control/all_color.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _syncCloud = true;
  LanguageOption _selectedLanguage = const LanguageOption(
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
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
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
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A6CFF), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding:  EdgeInsets.all(10.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AllColor.gery,
                      ),
                      child: SvgPicture.asset('assets/images/injoy.svg', width: 60.sp, height: 60.sp, )
                    ),
                     SizedBox(width: 12.w),
                     Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upgrade Plan Now!',
                            style: TextStyle(
                              color: AllColor.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "sf_Pro"
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Enjoy all the benefits and explore more possibilities',
                            style: TextStyle(
                              color:AllColor.white,
                              fontSize: 10.sp,
                              fontFamily: "sf_Pro",
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(height: 24.h),

              /// LANGUAGE
               _SectionHeader(title: 'LANGUAGE'),
              _SettingsTile(
                leadingIcon: Icons.language,
                title: 'Language',
                subtitle: _selectedLanguage.name,
                onTap: () async {
                  final result = await Navigator.of(context).push<
                      LanguageOption>(
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

               SizedBox(height: 12.sp),

              /// THEME
               _SectionHeader(title: 'THEME'),
               _SettingsTile(
                leadingIcon: Icons.brightness_6_outlined,
                title: 'Appearance',
                subtitle: 'Light',
              ),

              const SizedBox(height: 12),

              /// CLOUD
              const _SectionHeader(title: 'CLOUD'),
              _SettingsSwitchTile(
                leadingIcon: Icons.cloud_sync_outlined,
                title: 'Sync cloud storage',
                value: _syncCloud,
                onChanged: (v) => setState(() => _syncCloud = v),
              ),

              const SizedBox(height: 12),

              /// GENERAL
              const _SectionHeader(title: 'GENERAL'),
              const _SettingsTile(
                leadingIcon: Icons.ios_share_outlined,
                title: 'Share app',
              ),
              const Divider(height: 1),
              const _SettingsTile(
                leadingIcon: Icons.star_border_rounded,
                title: 'Rate us',
              ),
              const Divider(height: 1),
              const _SettingsTile(
                leadingIcon: Icons.privacy_tip_outlined,
                title: 'Privacy policy',
              ),
              const Divider(height: 1),
              const _SettingsTile(
                leadingIcon: Icons.description_outlined,
                title: 'Terms of use',
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
  final String flagAsset; // put local asset path here

  const LanguageOption({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flagAsset,
  });
}

/// CHOOSE LANGUAGE SCREEN
class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key, required this.selected})
      : super(key: key);

  final LanguageOption selected;

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  late LanguageOption _current;

  final List<LanguageOption> _languages = const [
    LanguageOption(
      code: 'en',
      name: 'English',
      nativeName: 'English',
      flagAsset: 'assets/flags/us.png',
    ),
    LanguageOption(
      code: 'fr',
      name: 'French',
      nativeName: 'français',
      flagAsset: 'assets/flags/fr.png',
    ),
    LanguageOption(
      code: 'de',
      name: 'Germany',
      nativeName: 'Deutsch',
      flagAsset: 'assets/flags/de.png',
    ),
    LanguageOption(
      code: 'au',
      name: 'Australian',
      nativeName: 'English',
      flagAsset: 'assets/flags/au.png',
    ),
    LanguageOption(
      code: 'ru',
      name: 'Russian',
      nativeName: 'Русский',
      flagAsset: 'assets/flags/ru.png',
    ),
    LanguageOption(
      code: 'ja',
      name: 'Japanese',
      nativeName: '日本語',
      flagAsset: 'assets/flags/jp.png',
    ),
    LanguageOption(
      code: 'zh',
      name: 'Mandarin',
      nativeName: '中文',
      flagAsset: 'assets/flags/cn.png',
    ),
    LanguageOption(
      code: 'it',
      name: 'Italian',
      nativeName: 'Italiano',
      flagAsset: 'assets/flags/it.png',
    ),
    LanguageOption(
      code: 'ar',
      name: 'Arabic',
      nativeName: 'العربية',
      flagAsset: 'assets/flags/sa.png',
    ),
    LanguageOption(
      code: 'ms',
      name: 'Malaysian',
      nativeName: 'Bahasa Melayu',
      flagAsset: 'assets/flags/my.png',
    ),
    LanguageOption(
      code: 'ur',
      name: 'Urdu',
      nativeName: 'اردو',
      flagAsset: 'assets/flags/pk.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _current = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF3F5FB);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new_rounded, color: AllColor.black,size: 20.sp,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text(
          'Choose language',
          style: TextStyle(

              fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(_current),
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: _languages.length,
        separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, index) {
          final lang = _languages[index];
          final selected = lang.code == _current.code;

          return ListTile(
            onTap: () => setState(() => _current = lang),
            leading: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(lang.flagAsset),
            ),
            title: Text(
              lang.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              lang.nativeName,
              style: const TextStyle(fontSize: 13),
            ),
            trailing: selected
                ? const Icon(
              Icons.check,
              color: Color(0xFF4A6CFF),
            )
                : null,
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

class _SettingsTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.leadingIcon,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(leadingIcon, size: 22.sp),
                 SizedBox(width: 14.w),
                Expanded(
                  child:
                      Text(
                        title,
                        style:  TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "sf_Pro",
                          color: AllColor.black

                        ),
                      ),
                ),
                        SizedBox(width: 20.w,),
                        Text(
                          subtitle!,
                          style:  TextStyle(
                            fontSize: 14.sp,
                            color:AllColor.black,
                            fontFamily: "sf_Pro",
                            fontWeight: FontWeight.w400
                          ),
                        ),
                 Icon(Icons.chevron_right_rounded, color: AllColor.black, size: 20.sp),
              ],

            )), ),

      ),
    );
  }
}

class _SettingsSwitchTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsSwitchTile({
    required this.leadingIcon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.r, vertical: 14.r),
        child: Row(
          children: [
            Icon(leadingIcon, size: 22.sp),
             SizedBox(width: 14.sp),
            Expanded(
              child: Text(
                title,
                style:  TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF4A6CFF) : const Color(0xFF9CA3AF);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
