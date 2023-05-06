import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/shared_preferance_cubit.dart';

class LogInpage extends StatefulWidget {
  const LogInpage({super.key});

  @override
  State<LogInpage> createState() => _LogInpageState();
}

final TextEditingController _textControllerEmail = TextEditingController();
final TextEditingController _textControllerPassword = TextEditingController();

List<String> email_pass = []; //ส่งไปcheck ที่cubit

class _LogInpageState extends State<LogInpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 340,
              child: TextField(
                onChanged: (String data) {
                  if (kDebugMode) {
                    print(data);
                  }
                },
                controller: _textControllerEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Emal',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 340,
              child: TextField(
                obscureText: true,
                onChanged: (String data) {
                  if (kDebugMode) {
                    print(data);
                  }
                },
                controller: _textControllerPassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                email_pass.insert(0, _textControllerEmail.text);
                email_pass.insert(1, _textControllerPassword.text);
                context.read<SharedPreferanceCubit>().SaveText(email_pass);
              },
              child: Text('SignIN'),
            ),
          )
          // Text(stateData)
        ],
      ),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}
