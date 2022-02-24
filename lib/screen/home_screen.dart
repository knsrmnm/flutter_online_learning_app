import 'package:flutter/material.dart';
import 'package:flutter_online_learning_app/screen/components/bar_chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

/// Home screen.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/man.png", width: 35.0),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Aaron Jones", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0)),
                            Text("Data Scientist", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.0, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.notifications_active_outlined),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your Course", style: TextStyle(fontWeight: FontWeight.w700)),
                    Text("See all", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent)),
                  ],
                ),
                const SizedBox(height: 20.0),
                _makeYourCourses(size.width - 40.0),
                const SizedBox(height: 30.0),
                Text("Statistics", style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 20.0),
                BarChartSample3(),
                const SizedBox(height: 30.0),
                Text("For You", style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 20.0),
                _makeForYouCard("Machine Learning", "ibm.png", size.width),
                const SizedBox(height: 10.0),
                _makeForYouCard("Deep Learning", "google.png", size.width),
                const SizedBox(height: 10.0),
                _makeForYouCard("Applied Data Science", "microsoft.png", size.width),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        margin: EdgeInsets.all(20.0),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.design_services),
            title: Text("Courses"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

/// Make your courses widget.
Widget _makeYourCourses(double width) {
  double cardWidth = (width/2) - 5.0;
  return Column(
    children: [
      Row(
        children: [
          _makeCourseCard("Data Science with Python", Colors.teal.withOpacity(0.5), cardWidth, 0.7),
          const SizedBox(width: 10.0),
          _makeCourseCard("Brain Science", Colors.red.withOpacity(0.5), cardWidth, 0.4),
        ],
      ),
    ],
  );
}

/// Make course card widget.
Widget _makeCourseCard(String title, Color color, double width, double progress) {
  return Container(
    width: width,
    height: 170.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17.0)),
                const SizedBox(height: 5.0),
                Text("9 hours progress", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.0)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 8.0,
                  animation: true,
                  percent: progress,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.white,
                  backgroundColor: Colors.black45,
                ),
                const SizedBox(width: 5.0),
                Text((progress*100).toString()+"%", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white))
              ],
            ),
          ),
        ],
      )
    ),
  );
}

/// Make for you card widget.
Widget _makeForYouCard(String title, String image, double width) {
  return Container(
    height: 75.0,
    width: width,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.grey[800])),
              const SizedBox(height: 5.0),
              Text("20k+ subscribers.", style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, color: Colors.grey[600])),
            ],
          ),
          Image.asset("assets/images/"+image, width: 30.0),
        ],
      ),
    ),
  );
}
