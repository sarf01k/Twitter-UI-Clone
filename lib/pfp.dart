import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 40,
          height: 40,
          child: ClipOval(
            child: Image.asset(app.user.profileImageURL, fit: BoxFit.cover,),
          )
        ),
      )
    );
  }
}