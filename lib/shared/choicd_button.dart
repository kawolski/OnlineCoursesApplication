import 'package:emt/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoiceButton extends StatefulWidget {
  final String userChoice;
  final String noUserChoice;
  final Function userFunction;
  final Function noUserFunction;
  ChoiceButton({this.userFunction,this.noUserFunction,this.noUserChoice,this.userChoice});
  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    String btnText;
    Function selected;
    final user = Provider.of<CustomUser>(context);
    if(user == null){
      btnText = widget.noUserChoice;
      selected = widget.noUserFunction;
    }else{
      btnText = widget.userChoice;
      selected = widget.userFunction;
    }
    return Container(
      child: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 50))
          ),
          child: Text(
            btnText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: selected,
        ),
      ),
    );
  }
}
