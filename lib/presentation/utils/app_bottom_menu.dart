import 'package:flutter/material.dart';
// import 'package:mobile/utils/src/items/entry.dart';
// import 'package:mobile/utils/src/pull_down_button.dart';

class AppPopupMenu {
  static Future<String?> showPopupMenu(
      BuildContext context, GlobalKey<State> key,
      {required List<PopupMenuEntry<String>> items}) async {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          offset.dx,
          offset.dy + renderBox.size.height,
          offset.dx + renderBox.size.width,
          offset.dy + 2 * renderBox.size.height),
      items: items,
    );
  }

  // static Future<dynamic> showcupertinoPopMenu(
  //     BuildContext context, GlobalKey<State> key,
  //     {required List<PullDownMenuEntry<dynamic>> items}) async {
  //   final RenderBox renderBox =
  //       key.currentContext!.findRenderObject() as RenderBox;
  //   final Offset offset = renderBox.localToGlobal(Offset.zero);
  //   return await showPullDownMenu(
  //     context: context,
  //     items: items,
  //     scrollController: ScrollController(),
  //     position: Rect.fromLTRB(
  //         offset.dy,
  //         offset.dy + renderBox.size.height,
  //         offset.dx + renderBox.size.width,
  //         offset.dy + 0.8 * renderBox.size.height),
  //   );
  // }
}
