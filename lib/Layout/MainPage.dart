import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/ChengPage.dart';
import '../global/dataGlobal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChengePage_Cubit(),
      child: BlocBuilder<ChengePage_Cubit, Widget>(
        builder: (context, page) {
          return page;
        },
      ),
    );
  }
}
