import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatelessWidget {
  final _formkeyEmail = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redefinição de Senha"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("imagens/password.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Por favor informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as estuçoes para recupera sua senha. ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formkeyEmail,
              child: TextFormField(
                controller: _controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-Mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              /*height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      1
                    ],
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF92B7F),
                    ]),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),*/
              child: RaisedButton(
                  child: Text(
                    "Enviar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(32, 30, 32, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  onPressed: () {
                    if (_formkeyEmail.currentState.validate()) {
                      auth
                          .sendPasswordResetEmail(email: _controllerEmail.text)
                          .then((value) {
                        print("Email enviado com sucesso!");
                      }).catchError((e) => print(e.toString()));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
