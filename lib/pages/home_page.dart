// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:payment_ui/components/color.dart';
import 'package:payment_ui/widgets/large_button.dart';
import 'package:payment_ui/widgets/small_buttons.dart';
import 'package:payment_ui/widgets/text_size.dart';
import 'package:get/get.dart';
import 'package:payment_ui/pages/payment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(children: [
        _mainBackground(),
        _curveImageContainer(),
        _buttonContainer(),
        _textContainer(),
      ]),
    );
  }

  _mainBackground() {
    return Positioned(
        bottom: 10,
        left: 0,
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assests/images/background.png"))),
        ));
  }

  _curveImageContainer() {
    return Positioned(
        right: -2,
        bottom: 10,
        left: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assests/images/curve.png"))),
        ));
  }

  _buttonContainer() {
    return Positioned(
        bottom: 15,
        right: 58,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child: Stack(children: [
                      Positioned(
                          bottom: 0,
                          child: Container(
                            color: Colors.white.withOpacity(0.7),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 300,
                          )),
                      Positioned(
                          right: 58,
                          child: Container(
                            padding: EdgeInsets.only(top: 5, bottom: 25),
                            width: 60,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColor.mainColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallButton(
                                  icon: Icons.cancel,
                                  iconColor: AppColor.mainColor,
                                  textColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SmallButton(
                                  icon: Icons.add,
                                  iconColor: AppColor.mainColor,
                                  textColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  text: "Add Bill",
                                ),
                                SmallButton(
                                  icon: Icons.history,
                                  iconColor: AppColor.mainColor,
                                  textColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  text: "History",
                                )
                              ],
                            ),
                          ))
                    ]),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assests/images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 1),
                      color: Color(0xFF11324d).withOpacity(0.2))
                ]),
          ),
        ));
  }

  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, index) {
              var column = Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 3, color: Colors.red),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assests/images/brand1.png"))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KenGen Power",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ID:7497934",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.idColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedText(
                      text: "Auto pay on 24th May 22", color: Colors.green),
                  SizedBox(
                    height: 5,
                  )
                ],
              );
              return Container(
                margin: EdgeInsets.only(top: 15, right: 20),
                height: 130,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x1E000000),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10)
                    ]),
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      column,
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.idColor),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                "\$1247.00",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black87),
                              ),
                              Text(
                                "Due in 3 days",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  _payButton() {
    return Positioned(
        bottom: 30,
        child: LargeButton(
          text: "Pay all bills",
          textColor: Colors.white,
          onTap: () {
            {
              Get.to(() => PaymentPage());
            }
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: [
        Positioned(
            left: 40,
            top: 80,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Positioned(
            left: 0,
            top: 100,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.1)),
            )),
      ],
    );
  }
}
