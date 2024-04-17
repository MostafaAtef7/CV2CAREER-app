import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/features/job_description/presentation/view/widgets/text_component.dart';
import 'package:readmore/readmore.dart';

class HrJobDescriptionContainer extends StatefulWidget {
  final String skills;
  final String description;
  final String requirement;
  const HrJobDescriptionContainer(
      {super.key,
      required this.skills,
      required this.description,
      required this.requirement});

  @override
  State<HrJobDescriptionContainer> createState() =>
      _JobDescriptionContainerState();
}

class _JobDescriptionContainerState extends State<HrJobDescriptionContainer> {
  int currentIndex = 0;
  List<String> options = [
    "Show All",
    "Description",
    "Requirement",
    "Skils",
  ];

  // List<String> data = [
  //   "Jamaykaa.com is a B2B2C E-commerce marketplace that connects social sellers (affiliate marketing) to suppliers and we provide end-to-end logistics and fulfillment.Our mission is to provide social sellers, who aspire to grow their online business, with a one-stop platform that covers all their logistics needs - We provide products, shipping, and warehousing",
  //   "At least 2 years of experience in adding products The ability to follow up on inventory and coordinate with merchants",
  //   "Required"
  // ];

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      widget.description ?? "N/A",
      widget.requirement ?? "N/A",
      widget.skills ?? "N/A"
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextComponent(txt: "Job Description", fontW: FontWeight.w900),
          const SizedBox(height: 15),
          SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: currentIndex == index
                                ? selectedColor
                                : unSelectedColor,
                          )),
                      onPressed: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Text(options[index],
                          style: TextStyle(
                              color: currentIndex == index
                                  ? selectedColor
                                  : unSelectedColor,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: currentIndex == 0 ? data.length : 1,
                itemBuilder: (context, index) {
                  //currentindex : 0     1    2      3
                  //              All    D   Re    Reqired

                  // list data [
                  // "des",  0
                  // "req",  1
                  //  "Reqired"  2
                  // ]
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                          txt: currentIndex == 0
                              ? options[index + 1]
                              : options[currentIndex],
                          fontW: FontWeight.w800),
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: ReadMoreText(
                          currentIndex == 0
                              ? data[index]
                              : data[currentIndex - 1],
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: 'Read More',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          lessStyle: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
