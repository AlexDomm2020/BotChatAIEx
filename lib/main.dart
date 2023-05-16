import 'package:chat_gpt_app/chat/data/repositories_implementations/openai_repository_impl.dart';
import 'package:chat_gpt_app/chat/presentation/chat_gpt_cubit.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'chat/presentation/screens/chat_screen.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

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
        create: (context) => ChatGptCubit(OpenAIRepositoryImpl(OpenAI.instance.build(token: dotenv.env['OPENAI_API_KEY']))),
        child: ChatScreen(),
      ),
    );
  }
}
