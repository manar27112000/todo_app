import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_theme.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 70,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 16,),
               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Task Title',style: Theme.of(context).textTheme.labelMedium,),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined,size: 16,color: Color(0xFFC8C9CB),),
                        SizedBox(width: 2,),
                        Text('Task Description',style:Theme.of(context).textTheme.labelSmall),
                      ],
                    )
                  ],
                ),
              ),
              Container(
               //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor
              ),
                  child: Icon(Icons.check,size: 30,color: Colors.white ,))

            ],
          ),
        ),
      ),
    );
  }
}
