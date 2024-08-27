import 'package:flutter/material.dart';

class fruits extends StatelessWidget {
  const fruits({
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
              Image.asset("assets/images/fruits.png", width: 100),
              Container(
              ),
            ],
          ),
          const Column(
            children: [
              Text('Organic Bananas'),
              Text('12kg, Price'),
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
              Text('\$3,99'),
            ]
          )
        ],
      ),
    );
  }
}