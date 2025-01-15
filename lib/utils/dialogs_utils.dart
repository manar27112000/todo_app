import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils{
  static void showLoadigDialog(BuildContext context,String mesaage){
   showDialog(context: context, builder: (context){
     return AlertDialog(
       content: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(mesaage),
           SizedBox(width: 8,),
           CircularProgressIndicator()
         ],
       ),
     );
   });
}

  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessageDialog(BuildContext context,{String? message,
    String?posActionTitle ,String?negActionTitle,
    VoidCallback? posAction,VoidCallback ?negAction}){
     List<Widget>? actions=[];
     if(posActionTitle!=null){
       actions.add(TextButton(onPressed: (){
         Navigator.pop(context);

         posAction?.call();
       }, child: Text(posActionTitle)));
     }
     if(negActionTitle!=null){
       actions.add(TextButton(onPressed: (){
         Navigator.pop(context);
         negAction?.call();
       }, child: Text(negActionTitle)));
     }
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Row(children: [
          Expanded(child: Text(message??'',maxLines:3 ,overflow: TextOverflow.clip,)),

        ],),
        actions: actions,

      );
    });
  }
}