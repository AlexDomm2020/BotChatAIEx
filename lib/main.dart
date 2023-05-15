import 'package:chat_gpt_app/chat/presentation/chat_gpt_cubit.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat/presentation/screens/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BlocProvider(
        create: (context) => ChatGptCubit(OpenAI.instance.build(token: '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')),
        child: ChatScreen(),
      ),
    );
  }
}
