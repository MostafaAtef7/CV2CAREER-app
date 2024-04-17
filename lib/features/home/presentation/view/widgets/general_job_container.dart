import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/classes/jobs_model.dart';

class GeneralJobContainer extends StatelessWidget {
  final JobsModel job;
  const GeneralJobContainer({super.key, required this.job});

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
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              job.jobTitle ?? "N/A",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset("assets/images/icons/dollar.png",
                    color: Colors.yellow, height: 15, width: 15),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    job.salary ?? "N/A",
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Inter",
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 15,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  job.jobType ?? "N/A",
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Inter",
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
