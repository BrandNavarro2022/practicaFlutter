import 'package:flutter/material.dart';
import 'package:brandnavarro/homeView.dart';
import 'package:flutter/cupertino.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String correo = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Image.asset(
                'assets/login.png',
                height: 250.0,
              ),
            ),
            Column(
              children: [
                Text('Inicio de Sesión',
                    style: Theme.of(context).textTheme.headline1),
                Text('Brand Navarro',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    onChanged: (value) => correo = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(
                        CupertinoIcons.mail,
                      ),
                      hintText: 'usuario@correo.com',
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    onChanged: (value) => password = value,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(
                        CupertinoIcons.lock_shield,
                      ),
                      hintText: 'Ingrese su clave de acceso',
                      labelText: 'Password',
                      iconColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              elevation: 10.0,
              minWidth: 300.0,
              height: 50.0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Text('Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              onPressed: () {
                if (_validarUsuario(correo, password)) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const HomeView();
                  }));
                } else {
                  _mostrarMensaje(
                      'Usuario o contraseña incorrectos', 'Verifica tus datos');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _validarUsuario(email, pass) {
    return email == 'brand@gmail.com' && pass == '87654321';
  }

  _mostrarMensaje(texto, mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(texto),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(mensaje),
              ],
            ),
          ),
          actions: [
            MaterialButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}
