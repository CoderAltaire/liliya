import 'package:com.example.liliya/bloc/get_book_details_bloc.dart';
import 'package:com.example.liliya/hive_helper/hive_class.dart';
import 'package:com.example.liliya/view/main_tab/main_tab_view.dart';
import 'package:com.example.liliya/view/onboarding/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/color_extenstion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GetBookDetailsBloc())],
      child: MaterialApp(
        title: 'Readly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: TColor.primary,
          fontFamily: 'SF Pro Text',
        ),
        home: WelcomeView(),
      ),
    );
  }
}
