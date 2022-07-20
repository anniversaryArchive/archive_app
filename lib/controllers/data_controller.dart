import 'package:archive/models/artist.dart';
import 'package:archive/models/group.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Rx<Group?> group = Rx<Group?>(null);
  Rx<Artist?> artist = Rx<Artist?>(null);

  void selectGroup(Group group) {
    // TODO: Solo Artist 인 경우에는, artist 변수에 저장활 수 있게끔 구현
    this.group.value = group;
  }

  void selectArtist(Artist artist) {
    this.artist.value = artist;
  }
}
