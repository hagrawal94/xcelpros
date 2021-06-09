import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros/constants.dart';

class txtField extends StatelessWidget {
  final String hint, icon;
  final onChanged;
  final bool obscure;

  const txtField(
      {Key key, this.hint, this.icon, this.onChanged, this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(AssetImage(icon)),
              )),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: obscure,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: defaultGrey,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.trim() == "")
                    return "Can't be empty";
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class btn extends StatelessWidget {
  final String text;
  final onPressed;

  const btn({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: kPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                child: Text(
                  text,
                  style: defaultWhite,
                ),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomsCard extends StatelessWidget {
  final String img, title, no;
  final onTap;

  const RoomsCard({Key key, this.img, this.title, this.no, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: Image.asset("assets/images/$img")),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  title,
                  style: defaultBlack,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "$no Lights",
                  style: defaultOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LightsCard extends StatelessWidget {
  final String img, title;
  final color;

  const LightsCard({Key key, this.img, this.title, this.color=Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset("assets/images/$img"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title, style: color==Colors.white?defaultBlack:defaultWhite,),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class ColorCard extends StatelessWidget {
  final color, onTap;
  const ColorCard({Key key, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextButton(
        onPressed: onTap,
        child: CircleAvatar(
          backgroundColor: color,
        ),
      ),
    );
  }
}


