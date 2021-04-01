import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlinecourse/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F4E),
          image: DecorationImage(
              image: AssetImage("assets/images/ux_big.png"),
              alignment: Alignment.topRight),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/arrow-left.svg"),
                      SvgPicture.asset("assets/icons/more-vertical.svg")
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    height: 16,
                  ),
                  Text(
                    "Design Thinking",
                    style: kHeadingextStyle,
                  ),
                  Container(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/person.svg"),
                      Container(
                        width: 5,
                      ),
                      Text("18k"),
                      Container(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/star.svg"),
                      Container(
                        width: 5,
                      ),
                      Text("4.8")
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "\$50",
                        style: kHeadingextStyle.copyWith(fontSize: 32)),
                    TextSpan(
                      text: "\$70",
                      style: TextStyle(
                          color: kTextColor.withOpacity(.5),
                          decoration: TextDecoration.lineThrough),
                    ),
                  ]))
                ],
              ),
            ),
            Container(
              height: 60,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Course Content",
                      style: kHeadingextStyle,
                    ),
                    Container(height: 30),
                    CourseContent(
                      number: "01",
                      duration: 5.35,
                      title: "Welcome to the Course",
                      isDone: true,
                    ),
                    CourseContent(
                      number: "02",
                      duration: 7.35,
                      title: "Goin on Vacations",
                      isDone: true,
                    ),
                    CourseContent(
                      number: "03",
                      duration: 8.35,
                      title: "Hire a designer",
                      isDone: false,
                    ),
                    CourseContent(
                      number: "04",
                      duration: 12.35,
                      title: "End of  the Course",
                      isDone: false,
                    ),
                  ],
                ),
              ),
            )),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 50,
                            color: kTextColor.withOpacity(0.1))
                      ]),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(14),
                        height: 56,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFEDEE),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child:
                            SvgPicture.asset('assets/icons/shopping-bag.svg'),
                      ),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red),
                        child: Text(
                          "Buy Now",
                          style: kSubtitleTextSyule.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;

  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number,
          style: kHeadingextStyle.copyWith(color: kTextColor.withOpacity(.15)),
        ),
        Container(
          width: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                      color: kTextColor.withOpacity(.5), fontSize: 18)),
              TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                      fontWeight: FontWeight.w600, height: 1.5)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGreenColor.withOpacity(isDone ? 1 : .5),
          ),
          child: Icon(Icons.play_arrow, color: Colors.white),
        )
      ],
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
