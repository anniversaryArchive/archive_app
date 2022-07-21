import 'package:archive/common/functions.dart';
import 'package:archive/controllers/data_controller.dart';
import 'package:archive/screens/archive/archive_screen.dart';
import 'package:archive/screens/home_screen.dart';
import 'package:archive/screens/select_artist/select_artist_screen.dart';
import 'package:archive/screens/select-artist-in-group/select_group_artist_screen.dart';
import 'package:archive/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  try {
    await initServices();
    await dotenv.load(fileName: 'assets/config/.env');
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

  /// 앱 내에서 공통적으로 사용되는 Controller 에 경우 여기서 초기화해주시면
  /// Get.find<...>() 를 통해 페이지 내에서 공통으로 사용할 수 있습니다.
  void _initControllers() {
    Get.put(DataController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CommonFunctions.createMaterialColor(Colors.white),
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/select-artist',
      getPages: _getPages(),
    );
  }

  /// 페이지의 Route 를 정의해줍니다.
  List<GetPage> _getPages () {
    return [
      GetPage(name: '/', page: () => const HomeScreen()),
      GetPage(name: '/archive', page: () => const ArchiveScreen()),
      GetPage(name: '/select-artist', page: () => const SelectArtistScreen()),
      GetPage(name: '/select-group-artist', page: () => SelectGroupArtistScreen()),
    ];
  }
}
