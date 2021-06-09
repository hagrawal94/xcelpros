import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros/constants.dart';
import 'package:xcelpros/home_screen.dart';
import 'package:xcelpros/strings.dart';
import 'package:xcelpros/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum states { Login, Signup, Loading }

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  String user, pass, email;
  states currentState = states.Login;
  final GlobalKey<FormState> _formKey = GlobalKey();

  AnimationController _controller;
  CurvedAnimation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: background,
        child: Stack(
          children: [
            AnimatedContainer(
              height: currentState == states.Loading? MediaQuery.of(context).size.height: currentState == states.Login
                  ? MediaQuery.of(context).size.height / 2
                  : MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Mask Group 1.png"),
                    alignment: Alignment.topRight),
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: currentState==states.Loading?Column(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotationTransition(
                          turns: _animation,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/Group 61.png",),
                          ),
                        ),
                        btn(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          },
                          text: goToHome,
                        ),
                      ],
                    ),
                  ),
                ],
              ):Container(),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    height: currentState == states.Loading? 0:currentState == states.Login
                        ? MediaQuery.of(context).size.height / 2
                        : MediaQuery.of(context).size.height / 4,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: currentState == states.Login
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 80,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    welcome,
                                    style: headingBold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    toRoomControl,
                                    style: heading,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Image.asset("assets/images/Group 62.png"),
                                  onPressed: () {
                                    setState(() {
                                      currentState = states.Login;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    signup,
                                    style: headingBold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  AnimatedContainer(
                    height: currentState == states.Loading? 0:currentState == states.Login
                        ? MediaQuery.of(context).size.height / 2
                        : MediaQuery.of(context).size.height * 3 / 4,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              txtField(
                                onChanged: (value) {
                                  setState(() {
                                    user = value;
                                  });
                                },
                                icon: "assets/images/Icon feather-user.png",
                                hint: username,
                              ),
                              txtField(
                                onChanged: (value) {
                                  setState(() {
                                    pass = value;
                                  });
                                },
                                icon: "assets/images/Icon feather-lock.png",
                                hint: password,
                                obscure: true,
                              ),
                              if (currentState != states.Login)
                                txtField(
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  icon: "assets/images/Icon feather-mail.png",
                                  hint: eMail,
                                ),
                              btn(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    if(currentState==states.Login){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                                    }
                                    else setState(() {
                                      currentState=states.Loading;
                                    });
                                  }
                                  return;
                                },
                                text: currentState == states.Login
                                    ? signin
                                    : signup,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentState == states.Login
                                        ?dontHaveAnAccount:haveAnAccount,
                                    style: defaultGrey,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          currentState =
                                              currentState == states.Login
                                                  ? states.Signup
                                                  : states.Login;
                                        });
                                      },
                                      child: Text(
                                        currentState == states.Login
                                            ? signup
                                            : signin,
                                        style: defaultPrimary,
                                      ))
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
