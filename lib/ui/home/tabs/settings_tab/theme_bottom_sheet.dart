import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSelectedItemTheme('Light'),
                SizedBox(height: 20,),
                  buildUnSelectedItemTheme('Dark')
              ],),
            )
    );
  }

  Widget buildSelectedItemTheme(String selectedTheme){
    return    Row(
      children: [
        Text(selectedTheme,style: Theme.of(context).textTheme.labelMedium,),
        Spacer(),
        Icon(Icons.check,color:Theme.of(context).primaryColor)
      ],
    );
  }

  Widget buildUnSelectedItemTheme(String unselectedTheme){
    return                  Row(
        children: [
          Text(unselectedTheme,style: Theme.of(context).textTheme.headlineMedium,),
          Spacer(),
        //  Icon(Icons.check,color:Theme.of(context).primaryColorLight)
        ]
    );
  }

}

