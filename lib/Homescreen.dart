import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 230, 231),

      // body: ListView.separated(
      //   itemCount: 5,
      //   itemBuilder: (context, index) => Container(color: Colors.white, height: 500,),
      //   separatorBuilder: (context, index) => Container(height: 20,),
      // ), keep this just in case
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 252, 252, 252),
                height: 470,
                margin: EdgeInsets.only(bottom: 20),
              ),
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip
                        .none, // so that the pfp doesn't phase out of the stack
                    children: [
                      buildCoverImage(),
                      Positioned(
                        top: 170,
                        left: 50,
                        child: buildProfileImage(),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: createUsername(),
                  ),
                  // Container(
                  //   height: 250,
                  //   width: double.infinity,
                  //   margin: EdgeInsets.only(bottom: 50),
                  //   child: Image.asset('images/bg.jpg', fit: BoxFit.cover),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 170, right: 70, left: 20),
                  //   child: buildProfileImage(),
                  // ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 252, 252, 252),
                height: 300,
                margin: EdgeInsets.only(bottom: 20),
              ),
              Column(
                spacing: 7,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      "Quick functions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  makeNavButton(
                    Icons.meeting_room,
                    "Meeting",
                    context,
                  ),
                  makeNavButton(Icons.task, "Task", context),
                  makeNavButton(
                    Icons.pie_chart,
                    "Finance statics",
                    context,
                  ),
                  makeNavButton(
                    Icons.add_to_home_screen_sharp,
                    "Tools",
                    context,
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: Color.fromARGB(255, 252, 252, 252),
            height: 400,
            margin: EdgeInsets.only(bottom: 20),
          ),
          Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 252, 252, 252),
                height: 200,
                margin: EdgeInsets.only(bottom: 20),
              ),
              Column(
                spacing: 7,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  makeNavButton(Icons.file_copy_sharp, "About us", context),
                  makeNavButton(Icons.help_center, "Help", context)
                ],
              ),
            ],
          ),

          
          Container(
            color: Color.fromARGB(255, 252, 252, 252),
            height: 5000,
            margin: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }

  Widget makeNavButton(IconData iconName, String buttonText, BuildContext context) {
    return ListTile(
      leading: Icon(iconName, size: 30),
      title: Text(buttonText, style: TextStyle(fontSize: 25)),
      trailing: Icon(Icons.arrow_forward_ios, size: 30),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Another page"),
              content: SizedBox(
                height: 500,
                width: 200,
                child: Text("Move to another page"),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildProfileImage() => Stack(
    alignment: Alignment.center,
    children: [
      CircleAvatar(
        radius: 85,
        backgroundColor: const Color.fromARGB(255, 205, 205, 205),
      ),
      CircleAvatar(
        radius: 75,
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage("images/bg.jpg"),
      ),
    ],
  );

  Widget buildCoverImage() => Container(
    height: 250,
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 110),
    child: Image.asset('images/bg.jpg', fit: BoxFit.cover),
  );

  Widget createUsername() => Row(
    spacing: 10,
    textBaseline: TextBaseline.alphabetic,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    children: [
      Text(
        "Username",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
      Text("#Username", style: TextStyle(fontSize: 20)),
    ],
  );
}
