import 'package:cms/themes/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      // body: ListView.separated(
      //   itemCount: 5,
      //   itemBuilder: (context, index) => Container(color: Colors.white, height: 500,),
      //   separatorBuilder: (context, index) => Container(height: 20,),
      // ), keep this just in case
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Stack(
                clipBehavior:
                    Clip.none, // so that the pfp doesn't phase out of the stack
                children: [
                  buildCoverImage(),
                  Positioned(top: 170, left: 50, child: buildProfileImage()),
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
          makeSpacer(context),

          Column(
            spacing: 7,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "Quick functions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              makeNavButton(Icons.meeting_room, "Meeting", context),
              makeNavButton(Icons.task, "Task", context),
              makeNavButton(Icons.pie_chart, "Finance statics", context),
              makeNavButton(Icons.add_to_home_screen_sharp, "Tools", context),
            ],
          ),
          makeSpacer(context),

          Column(
            children: [
              makeTitleText("Interface"),
              Row(
                spacing: 7,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(Icons.sunny, size: 30),
                  ),
                  Text("Theme", style: TextStyle(fontSize: 20)),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: makeThemeButton(), // toggle theme
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          makeSpacer(context),

          Column(
            spacing: 7,
            children: [
              makeTitleText("Settings"),
              makeNavButton(Icons.file_copy_sharp, "About us", context),
              makeNavButton(Icons.help_center, "Help", context),
            ],
          ),
          makeSpacer(context),

          Column(
            children: [
              makeTitleText("Account"),
              ListTile(
                title: Text(
                  "Log out",
                  style: TextStyle(color: Color(0xffFE2B25), fontSize: 30),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop;
                            },
                            child: Text("Log out"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              // Spacer(),
            ],
          ),

          Container(height: 500),

          Align(
            child: Container(
              padding: EdgeInsets.all(7),
              child: Image(
                image: AssetImage("images/gdgbanner.png"),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container makeSpacer(BuildContext context) => Container(
    color: Theme.of(context).colorScheme.surface,
    height: 30,
    margin: EdgeInsets.only(top: 10, bottom: 10),
  );

  Widget makeTitleText(String title) => Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
    child: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );

  Widget makeNavButton(
    IconData iconName,
    String buttonText,
    BuildContext context,
  ) {
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

  Widget buildCoverImage() => Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 110),
      child: Image.asset('images/bg.jpg', fit: BoxFit.cover),
    ),
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

  Widget? makeThemeButton() => IconButton(
    padding: EdgeInsets.only(right: 50),
    iconSize: 30,
    onPressed: () {
      Provider.of<Themeprovider>(context, listen: false).toggleTheme();
    },
    icon: Icon(Icons.sunny_snowing),
  );
}
