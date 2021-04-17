import 'package:emt/models/user.dart';
import 'package:emt/screens/drawer/l_in_drawer.dart';
import 'package:emt/screens/drawer/l_out_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if(user == null){
      return LOutDrawer();
    }else{
      return LInDrawer();
    }
  }
}
