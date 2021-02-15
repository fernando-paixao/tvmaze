import 'package:flutter/material.dart';
import 'package:jobsityChallenge/models/show.dart';

class Schedule extends StatelessWidget {
  final Show show;

  Schedule(this.show);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      //constraints: BoxConstraints(maxWidth: size.width * 3 / 4),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timer),
              Text(" " + show.scheduleTime),
            ],
          ),
          //Text("Days: "),
          Text(show.scheduleDays.join(", "))
        ],
      ),
    );
  }
}
