import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSelectedItemTheme('Arabic'),
                SizedBox(height: 20,),
                  buildUnSelectedItemTheme('English')
              ],),
            )
    );
  }

  Widget buildSelectedItemTheme(String selectedLanguage){
    return    Row(
      children: [
        Text(selectedLanguage,style: Theme.of(context).textTheme.labelMedium,),
        Spacer(),
        Icon(Icons.check,color:Theme.of(context).primaryColor)
      ],
    );
  }

  Widget buildUnSelectedItemTheme(String unselectedLanguage){
    return                  Row(
        children: [
          Text(unselectedLanguage,style: Theme.of(context).textTheme.headlineMedium,),
          Spacer(),
        //  Icon(Icons.check,color:Theme.of(context).primaryColorLight)
        ]
    );
  }

}

