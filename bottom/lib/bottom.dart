import 'package:flutter/material.dart';

class DefaultBottom extends StatelessWidget {
  const DefaultBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(8),
                height: 60,
                width: 317,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffAB00A4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 7,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Generate primum picture'),
                        Text('Free')
                      ],
                    )
                  ],
                ),
              );
  }
}