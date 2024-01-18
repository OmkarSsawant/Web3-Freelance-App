import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String text;
  Widget? child;
   EmptyList({super.key, required this.text,this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(child==null)
            Image.asset("assets/images/empty_list.png",width: 200,),
          if(child!=null) child!,
          const SizedBox(height: 20,),
          Text(text)
        ],
      ),
    );
  }
}
