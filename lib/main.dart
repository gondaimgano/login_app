import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/bloc/login/login_bloc.dart';
import 'package:login_app/controller/app_controller.dart';
import 'package:login_app/model/login_request.dart';
import 'package:login_app/service/app_service.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Services(),
    );
  }
}
class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AppServiceApiService.create(),
        child: Controller());
  }
}
class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppController(
        context.read(),
      ),
      child: ExampleAppProviders(),
    );
  }
}
class ExampleAppProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => LoginBloc(context.read())),
    ], child: App(),
    );
  }
}









class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
      if (state is LoginSucceeded) {
        //Navigator to a dashboard
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Success!!!")));
      }
      if (state is LoginFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
      if (state is LoginInProgress) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("In Progress!!!")));
      }
    }, builder: (context, state) {
      return buildBody(context);
    }),);
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextExample(
              controller: _username,
              label: "Username",
            ),
            SizedBox(
              height: 12,
            ),
            TextExample(
              controller: _password,
              label: "Password",
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        PressLogin(
                          LoginRequest(
                            username: _username.text,
                            password: _password.text,
                          ),
                        ),
                      );
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextExample extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  TextExample({this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
