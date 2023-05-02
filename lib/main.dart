import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_appdetail/bottom_nav_bar/bottom_nvaigation_bloc.dart';
import 'package:student_appdetail/image_picker/image_picker_bloc.dart';
import 'package:student_appdetail/list_view/list_view_bloc.dart';
import 'package:student_appdetail/model/database_model.dart';
import 'package:student_appdetail/screens/splash_screen.dart';
import 'model/dbfunction.dart';
import 'update_bloc/update_bloc_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
  Hive.registerAdapter(StudentModelAdapter());
  openStudentModel();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return BottomNvaigationBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return ImagePickerBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return ListViewBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return UpdateBlocBloc();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}