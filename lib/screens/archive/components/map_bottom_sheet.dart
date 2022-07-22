import 'package:archive/models/archive.dart';
import 'package:archive/screens/archive/components/archive_item.dart';
import 'package:flutter/material.dart';

class MapBottomSheet extends StatefulWidget {
  const MapBottomSheet({
    Key? key,
    required this.archives,
  }) : super(key: key);

  final List<Archive> archives;

  @override
  _MapBottomSheetState createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {
  late Size _size;
  final GlobalKey _globalKey = GlobalKey();

  late double _top;
  double _minTop = 10.0;
  double _diff = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _size = MediaQuery.of(context).size;
    _top = _size.height - 150.0;
    _minTop += MediaQuery.of(context).padding.top;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      child: GestureDetector(
        onHorizontalDragStart: (DragStartDetails details) {
          _diff = details.globalPosition.dy - _top;
          BuildContext? keyContext = _globalKey.currentContext;
          if (keyContext == null) { return; }
          RenderBox box = keyContext.findRenderObject() as RenderBox;
          _minTop = _size.height - box.size.height;
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          double top = details.globalPosition.dy - _diff;
          if (top <= _minTop) { return; }
          setState(() { _top = top; });
        },
        child: Container(
          key: _globalKey,
          width: _size.width,
          constraints: BoxConstraints(
            minHeight: _size.height,
          ),
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: widget.archives.map((Archive archive) {
              return ArchiveItem(archive: archive);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
