import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/defaultbutton.dart';
import 'package:gp_app/features/description/presentation/view/widgets/text.dart';
import 'package:readmore/readmore.dart';

class descrption_view_body extends StatefulWidget {
  const descrption_view_body({super.key});

  @override
  State<descrption_view_body> createState() => _descriptionState();
}

class _descriptionState extends State<descrption_view_body> {
  List<String> options = [
    "Show All",
    "Description",
    "Requirement",
    "Reqired",
  ];

  List<String> data = [
    "Jamaykaa.com is a B2B2C E-commerce marketplace that connects social sellers (affiliate marketing) to suppliers and we provide end-to-end logistics and fulfillment.Our mission is to provide social sellers, who aspire to grow their online business, with a one-stop platform that covers all their logistics needs - We provide products, shipping, and warehousing",
    "At least 2 years of experience in adding products The ability to follow up on inventory and coordinate with merchants",
    "Required"
  ];

  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    stops: [0.0, 0.9],
                  ),
                ),
                child: Text(""),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, right: 25, left: 25),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 0.9,
                          blurRadius: 4)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(txt: "Name Job", fontW: FontWeight.w600),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        text(txt: "Location", fontW: FontWeight.w300),
                        SizedBox(
                          child: Text(
                            " - ",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        text(txt: "Type", fontW: FontWeight.w300),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        text(txt: "Deadline", fontW: FontWeight.w300),
                        SizedBox(
                          child: Text(
                            " - ",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        text(txt: "Salary", fontW: FontWeight.w300),
                      ],
                    ),
                    defaultbutton(
                      text: "Apply Fot This Job",
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(txt: "Job Description", fontW: FontWeight.w900),
                SizedBox(height: 15),
                SizedBox(
                  height: 25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: CurrentIndex == index
                                      ? Color(0XFFF76C07)
                                      : Color(0XFF797674),
                                )),
                            onPressed: () {
                              setState(() {
                                CurrentIndex = index;
                              });
                            },
                            child: Text(options[index],
                                style: TextStyle(
                                    color: CurrentIndex == index
                                        ? Color(0XFFF76C07)
                                        : Color(0XFF797674),
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: CurrentIndex == 0 ? data.length : 1,
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
                              text(
                                  txt: CurrentIndex == 0
                                      ? options[index + 1]
                                      : options[CurrentIndex],
                                  fontW: FontWeight.w800),
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 5),
                                child: ReadMoreText(
                                  CurrentIndex == 0
                                      ? data[index]
                                      : data[CurrentIndex - 1],
                                  trimLines: 2,
                                  colorClickableText: Colors.pink,
                                  trimCollapsedText: 'Read More',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(
                                      color: Color(0XFF3FC3AE),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  lessStyle: TextStyle(
                                      color: Color(0XFF3FC3AE),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
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
