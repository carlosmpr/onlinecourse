import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlinecourse/constants.dart';
import 'package:onlinecourse/details_screen.dart';
import 'package:onlinecourse/model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Courses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailsScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/menu.svg"),
                CircleAvatar(
                  backgroundColor: Colors.red,
                )
              ],
            ),
            Container(height: 30),
            Text(
              'Hello',
              style: kHeadingextStyle,
            ),
            Text(
              "Find a course you wan to learn",
              style: kSubheadingextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/search.svg"),
                  Container(
                    width: 16,
                  ),
                  Text(
                    "Search for anything",
                    style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: kTitleTextStyle,
                ),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                )
              ],
            ),
            Container(height: 30),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    itemCount: categories.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        height: index.isEven ? 200 : 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(categories[index].image)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[index].name,
                              style: kTitleTextStyle,
                            ),
                            Text(
                              '${categories[index].numOfCourses} Courses',
                              style:
                                  TextStyle(color: kTextColor.withOpacity(.5)),
                            )
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1)))
          ],
        ),
      ),
    );
  }
}
