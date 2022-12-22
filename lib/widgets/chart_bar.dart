import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _label;
  final double _spendingAmount;
  final double _spendingPctOfTotal;

  ChartBar(this._label, this._spendingAmount, this._spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            '\$${_spendingAmount.toString()}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          width: 15,
          height: 75,
          // height: 150,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.grey,
                //   width: 1.0,
                // ),
                color: Colors.grey,
                // borderRadius: BorderRadius.circular(8),
              ),
            ),
            FractionallySizedBox(
              heightFactor: _spendingPctOfTotal,
              child: Container(
                width: 15,
                // height: 70,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  // borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          _label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
