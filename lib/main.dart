import 'package:archive/controllers/artist_controller.dart';
import 'package:archive/screens/home_screen.dart';
import 'package:archive/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  try {
    await initServices();
  } catch (_) { }
  runApp(const MyApp());
}

Future<void> initServices() async {
  try {
    await Get.putAsync(() => GraphQLService().init());
  } catch (_) {}
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    Get.put(ArtistController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: _getPages(),
    );
  }

  List<GetPage> _getPages () {
    return [
      GetPage(name: '/', page: () => const HomeScreen()),
    ];
  }
}
