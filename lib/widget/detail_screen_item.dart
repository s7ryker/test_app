import 'package:flutter/material.dart';

class DetailScreenItem extends StatelessWidget {
  final String title;
  final String value;

  DetailScreenItem({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Text(
            title + '  :',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(value)
        ],
      ),
    );
  }
}
