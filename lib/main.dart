import 'package:application_flutter/bloc/conter.bloc.dart';
import 'package:application_flutter/bloc/conter.cubit.dart';
import 'package:application_flutter/githubApi/home.page.dart';
import 'package:application_flutter/pages/conterBloc.page.dart';
import 'package:application_flutter/pages/conterCubit.page.dart';
import 'package:application_flutter/pages/conterProvider.page.dart';
import 'package:application_flutter/provider/conter.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// BLOC
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => ConterBloc()))],
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomePage(),
          '/provider': (context) => const ConterProvider(),
          '/cubit': (context) => const ConterCubitPage(),
          '/': (context) => const ConterBlocPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: "/",
      ),
    );
  }
}

// CUBIT
class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => ConterCubit(0)))],
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomePage(),
          '/provider': (context) => const ConterProvider(),
          '/': (context) => const ConterCubitPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: "/",
      ),
    );
  }
}

// PROVIDER
class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => ConterState()))],
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomePage(),
          '/': (context) => const ConterProvider(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: "/",
      ),
    );
  }
}
