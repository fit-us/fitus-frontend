import 'package:flutter/material.dart';
import 'dart:io';

class RecordAppBarAndroid extends StatelessWidget
    implements PreferredSizeWidget {
  const RecordAppBarAndroid({super.key});

  @override
  Size get preferredSize =>
      Size.fromHeight(Platform.isIOS ? 44.0 : kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(""),
      //     backgroundColor:
      //         Theme.of(context).colorScheme.primaryContainer, // 필요에 따라 색상 변경
      //     title: const Center(
      //       child: Text(
      //         "감정 기록",
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 18.0,
      //           color: Colors.black87,
      //         ),
      //       ),
      //     ),
      //     leading: IconButton(
      //       icon: const Icon(Icons.arrow_back_ios_new),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       color: Colors.black87,
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.of(
      //             context,
      //           ).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      //         },
      //         child: const Text(
      //           "취소",
      //           style: TextStyle(fontSize: 16.0, color: Colors.black87),
      //         ),
      //       ),
      //     ],
      //     elevation: 1,
      //   );
      // }
    );
  }
}
