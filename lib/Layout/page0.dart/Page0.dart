import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/ChengPage.dart';
import '../page1.dart/Page1.dart';

class Page0 extends StatelessWidget {
  const Page0({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          context.read<ChengePage_Cubit>().changePage(Page1());
        },
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 60,
          child: Text("gotoPage1"),
        ),
      ),
    );
  }
}
