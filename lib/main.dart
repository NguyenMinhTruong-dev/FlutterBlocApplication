import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterblocapplication/app_bloc.dart';
import 'package:flutterblocapplication/app_events.dart';
import 'package:flutterblocapplication/app_states.dart';
import 'package:flutterblocapplication/page/welcome/bloc/welcome_bloc.dart';
import 'package:flutterblocapplication/page/welcome/welcome.dart';
import 'package:flutterblocapplication/util/LogUtil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>WelcomeBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        ),
      )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<AppBloc, AppStates>(
          builder: (context, state) {
            LogUtil.start();
            LogUtil.end();
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    "${BlocProvider.of<AppBloc>(context).state.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [FloatingActionButton(
          onPressed: () => BlocProvider.of<AppBloc>(context).add(Decrement()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
