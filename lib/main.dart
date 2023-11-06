import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_wall/Providers/connection_provider.dart';
import 'package:mirror_wall/View/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MirrorWall());
}

class MirrorWall extends StatefulWidget {
  const MirrorWall({super.key});

  @override
  State<MirrorWall> createState() => _MirroWallState();
}

class _MirroWallState extends State<MirrorWall> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConnectionProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(
          url: 'https://www.google.com/search?q=',
        ),
      ),
    );
  }
}
