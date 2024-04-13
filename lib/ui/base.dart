import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/control/basestate.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseState>(
      builder: (context, baseState, child) {
        baseState.inistate();
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.width*0.3,
            width: MediaQuery.of(context).size.width*0.3,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Boot up')
              ],
            ),
          ),
        ); // Ganti dengan widget Anda
      },
    );
  }
}
