import 'package:flutter/material.dart';

class LOutDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/emt.jpg'),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0),
                          BlendMode.screen
                      ),
                    fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.redAccent.withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    title: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white70
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_outline_sharp,
                      color: Colors.white,
                    ),
                    title: Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.white70
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                // color: Colors.white.withOpacity(0.9),
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.redAccent[100],
                    ),
                    title: Text(
                      'LOGOUT',
                      style: TextStyle(
                        color: Colors.redAccent[100]
                      ),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
