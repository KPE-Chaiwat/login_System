import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Layout/LoginPage.dart';
import 'Layout/MainPage.dart';
import 'cubit/shared_preferance_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SharedPreferences Demo',
      home: BlocProvider(
        create: (context) => SharedPreferanceCubit(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  // void _saveText() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String text = _textController.text;
  //   await prefs.setString('myTextKey', text);
  // }

  // void _loadText() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String savedText = prefs.getString('myTextKey') ?? '';
  //   setState(() {
  //     _textController.text = savedText;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _loadText();
    context.read<SharedPreferanceCubit>().LoadText();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPreferanceCubit, String>(
      builder: (context, stateData) {
        Widget CheckLogin() {
          if (stateData == "SomeThing Wrong") {
            return LogInpage();
          } else {
            return MainPage();
          }
        }

        return Scaffold(
          appBar: AppBar(title: const Text('SharedPreferences Demo'), actions: [
            IconButton(
                onPressed: () {
                  context.read<SharedPreferanceCubit>().SaveText_LogOUT();
                },
                icon: const Icon(Icons.logout))
          ]),
          body: CheckLogin(),
        );
      },
    );
  }
}
