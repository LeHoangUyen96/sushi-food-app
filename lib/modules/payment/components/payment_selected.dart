import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class PaymentSelection extends StatefulWidget {
  final bool isSelected;
  final String image;
  final String title;
  final String description;
  final Function onTap;

  const PaymentSelection({
    Key key,
    this.isSelected = false,
    this.image,
    this.title,
    this.description,
    this.onTap,
  }) : super(key: key);

  @override
  _PaymentSelectionState createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => widget.onTap(),
            child: Container(
              width: 25,
              height: 25,
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: widget.isSelected
                  ? Image.asset('assets/icons/tick.png')
                  : Container(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(MainConstant.orange),
              ),
            ),
          ),
          Container(width: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  widget.image,
                  height: size.height * 0.05,
                ),
                Container(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.description,
                        style: TextStyle(
                            color: Color(MainConstant.lightBlack),
                            fontSize: 12)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
