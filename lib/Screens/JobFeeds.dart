import 'package:flutter/material.dart';
import 'package:invest/modals/constrains.dart';
class JobFeeds extends StatefulWidget {
  @override
  _JobFeedsState createState() => _JobFeedsState();
}
Constrains constrain = Constrains();
class _JobFeedsState extends State<JobFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Job Feeds",style: constrain.cardTitle,),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Search e.g",style: TextStyle(color: Colors.grey),),
                  ),
                  Icon(Icons.search,size: 40),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          posts("images/electrition.jpg", "Union Electrition", "An electrician is a tradesman specializing in electrical wiring of buildings, transmission lines, stationary machines, and related equipment."),
          posts("images/Carpenter.jpg", "Carpenter", "We provide carpenter services for households and offices, to help you customize or repair furniture, doors, windows, broken door knobs, hinges, handles etc."),
          posts("images/engineer.jpg", "Civil Engineer", "Civil engineering is a professional engineering discipline that deals with the design, construction,"),
          posts("images/handyman.jpg", "Handyman", "We provide Electricians, Plumbers, HVAC Technicians, Painters, Cleaners, Janitors, Carpenters and other Handymen at your doorstep in Islamabad, Pakistan.")
        ],
      ),
    );
  }
}
Widget posts(String image, String title, String subTitle){
  return Card(
    elevation: 5.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: constrain.cardTitle,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subTitle,style: constrain.cardSubTitle,),
        ),
      ],
    ),
  );
}