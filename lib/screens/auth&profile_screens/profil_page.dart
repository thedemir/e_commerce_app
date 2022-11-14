import 'package:e_commerce_app/state/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 95,
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 130),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.orange,
                      ),
                      radius: 65,
                    ),
                  ),
                ],
              ),
              //    Text(state.name ?? "", style: TextStyle(color: Colors.black)),
            ],
          ),
        );
      },
    );
  }
}
