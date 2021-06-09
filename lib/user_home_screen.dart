import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros/strings.dart';
import 'package:xcelpros/widgets.dart';

import 'constants.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

enum states { Home, Room }

class _UserHomeScreenState extends State<UserHomeScreen> {
  states currentState = states.Home;

  double _value = 100;

  MaterialColor selectedColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: background,
      child: Stack(
        children: [
          AnimatedContainer(
            height: currentState == states.Home
                ? MediaQuery.of(context).size.height / 2
                : MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: currentState == states.Home ? kPrimary : Colors.indigo,
              image: DecorationImage(
                  image: AssetImage("assets/images/Group 63.png"),
                  alignment: Alignment.topCenter),
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                height: currentState == states.Home
                    ? MediaQuery.of(context).size.height / 5
                    : MediaQuery.of(context).size.height / 3,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: currentState == states.Home
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  controlPanel,
                                  style: headingBold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/images/user.png",
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                                icon: Image.asset(
                                                    "assets/images/Icon ionic-md-arrow-round-back.png"),
                                                onPressed: () {
                                                  setState(() {
                                                    currentState = states.Home;
                                                  });
                                                }),
                                            Text("Bed", style: headingBold,),
                                          ],
                                        ),
                                        Text("Room", style: headingBold,),
                                        Text("4 Lights", style: defaultOrange,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Icon(
                                      Icons.lightbulb,
                                      size: 100,
                                      color: selectedColor.withAlpha(_value.toInt()+155),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: [
                                  LightsCard(
                                    img: "surface2.png",
                                    title: mainLight,
                                  ),
                                  LightsCard(
                                    color: Colors.deepPurple,
                                    img: "furniture-and-household.png",
                                    title: deskLight,
                                  ),
                                  LightsCard(
                                    img: "surface2.png",
                                    title: bedLight,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              AnimatedContainer(
                height: currentState == states.Home
                    ? MediaQuery.of(context).size.height * 3.561 / 5
                    : MediaQuery.of(context).size.height * 1.7365 / 3,
                width: MediaQuery.of(context).size.width,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: currentState == states.Home?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 30),
                        child: Text(
                          allRooms,
                          style: defaultBlack,
                        ),
                      ),
                      GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          RoomsCard(
                            onTap: openRoom,
                            title: bedRoom,
                            no: "4",
                            img: "bed.png",
                          ),
                          RoomsCard(
                            onTap: openRoom,
                            title: livingRoom,
                            no: "2",
                            img: "room.png",
                          ),
                          RoomsCard(
                            onTap: openRoom,
                            title: kitchen,
                            no: "5",
                            img: "kitchen.png",
                          ),
                          RoomsCard(
                            onTap: openRoom,
                            title: bathroom,
                            no: "1",
                            img: "bathtube.png",
                          ),
                          RoomsCard(
                            onTap: openRoom,
                            title: outdoor,
                            no: "5",
                            img: "house.png",
                          ),
                          RoomsCard(
                            onTap: openRoom,
                            title: balcony,
                            no: "2",
                            img: "balcony.png",
                          ),
                        ],
                      ),
                    ],
                  ):Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:30.0, top: 30),
                        child: Text(intensity, style: defaultBlack,),
                      ),
                      Row(
                        children: [
                          Expanded(flex:1,child: Image.asset("assets/images/surface2.png")),
                          Expanded(
                            flex:6,
                            child: Slider(
                              min: 0,
                              max: 100,
                              activeColor: Colors.yellow,
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                          Expanded(flex:1,child: Image.asset("assets/images/solution-1.png")),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30.0, top: 30),
                        child: Text(colors, style: defaultBlack,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10),
                        child: Row(
                          children: [
                            ColorCard(
                              color: Colors.yellow,
                              onTap: (){setColor(Colors.yellow);},
                            ),
                            ColorCard(
                              color: Colors.red,
                              onTap: (){setColor(Colors.red);},
                            ),
                            ColorCard(
                              color: Colors.blue,
                              onTap: (){setColor(Colors.blue);},
                            ),
                            ColorCard(
                              color: Colors.cyan,
                              onTap: (){setColor(Colors.cyan);},
                            ),
                            ColorCard(
                              color: Colors.orange,
                              onTap: (){setColor(Colors.orange);},
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/+.png", width: 15, fit: BoxFit.fitWidth,),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:30.0, top: 30),
                        child: Text(scenes, style: defaultBlack,),
                      ),
                      GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        children: [
                          LightsCard(
                            color: Colors.orangeAccent,
                            title: birthday,
                            img: "surface1.png",
                          ),
                          LightsCard(
                            color: Colors.purpleAccent,
                            title: party,
                            img: "surface1.png",
                          ),
                          LightsCard(
                            color: Colors.lightBlueAccent,
                            title: relax,
                            img: "surface1.png",
                          ),
                          LightsCard(
                            color: Colors.lightGreenAccent,
                            title: fun,
                            img: "surface1.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  openRoom() {
    setState(() {
      currentState = states.Room;
    });
  }

  setColor(MaterialColor color) {
    setState(() {
      selectedColor = color;
    });
  }
}
