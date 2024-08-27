import 'package:flutter/material.dart';

class eggs extends StatelessWidget {
  const eggs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.2),
        top: BorderSide(width: 0.2))),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset("assets/images/eggs.png", width: 100),
              Container(
              ),
            ],
          ),
          const Column(
            children: [
              Text('Eggs Chicken Red'),
              Text('4pcs, Price'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Icon(Icons.remove),
              Text("1"),
              Icon(Icons.add_box_rounded, color: Colors.green,),
                ]
              )
            ]
          ),
          const Column(
            children: [
              Icon(Icons.close),
              Text('\$1,99'),
            ]
          )
        ],
      ),
    );
  }
}