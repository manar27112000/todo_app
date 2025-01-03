import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/tabs/settings_tab/theme_bottom_sheet.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme',style: Theme.of(context).textTheme.labelMedium,),
          InkWell(
            onTap: (){showThemeBottomSheet();},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(
                      color: Theme.of(context).primaryColor,width: 2
                  )),
              child: Text('Light',style: Theme.of(context).textTheme.labelSmall,),),
          ),
          SizedBox(height: 10,),
          Text('Language',style: Theme.of(context).textTheme.labelMedium,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(
                      color: Theme.of(context).primaryColor,width: 2
                  )),
              child: Text('Arabic',style: Theme.of(context).textTheme.labelSmall,),),
          ),
          SizedBox(height: 10,),

        ],),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>ThemeBottomSheet());
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>LanguageBottomSheet());
  }
}
