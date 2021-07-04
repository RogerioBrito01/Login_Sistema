import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> itensMenu = [];

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushNamed(context, "/login");
  }

  //Future _verificarUsuarioLogado() async {
  // FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseUser usuarioLogado = await auth.currentUser();

  // if (usuarioLogado == null) {
  //   itensMenu = ["Entrar / Cadastrar"];
  //  } else {
  //  itensMenu = ["Minhas denuncias", "Deslogar"];
  // }
  //}

  String _emailUsuario = "";
  String _nome = "";
  String _idUsuarioLogado = "";

  Future _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuarioLogado = usuarioLogado.uid;
    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot =
        await db.collection("usuario").document(_idUsuarioLogado).get();
    Map<String, dynamic> dados = snapshot.data;

    setState(() {
      _emailUsuario = usuarioLogado.email;
      _nome = dados["nome"];
    });
  }

  @override
  void initState() {
    super.initState();

    // _verificarUsuarioLogado();

    _recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Bem Vindo",
            style: TextStyle(fontSize: 40),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _deslogarUsuario();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_nome),
              accountEmail: Text(_emailUsuario),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("imagens/profile.png"),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text(
                "branca",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text(
                "azul",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text(
                "Rosa",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
