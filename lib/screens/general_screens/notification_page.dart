import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[50],
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Bildirimler",
          style: GoogleFonts.lato(
              color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
