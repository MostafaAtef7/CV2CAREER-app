import 'package:flutter/material.dart';

class GeneralJobContainer extends StatelessWidget {
  const GeneralJobContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 96,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              )
            ]),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Job Title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Rubik",
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.money,
                  size: 15,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "10,000",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Rubik",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 15,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Remote",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Rubik",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
