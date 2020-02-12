import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        
      ),
      body: _body(),

    );
  }

  _body(){
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[          
          TextFormField(
            style: TextStyle(
              fontSize: 25,
              color: Colors.orange
            ),
            decoration: InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(
                fontSize: 25,
                color: Colors.grey
              ),
              hintText: "Digite o login",
              hintStyle: TextStyle(
                fontSize: 16
              )
            ),
          ),
          
          SizedBox(height: 10,),
          Text("Senha"),
          TextFormField(
            obscureText: true, 
            style: TextStyle(
              fontSize: 25,
              color: Colors.orange
            ),
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                fontSize: 25,
                color: Colors.grey
              ),
              hintText: "Digite a senha",
              hintStyle: TextStyle(
                fontSize: 16
              )
            ),   
          ),
          SizedBox(height: 20,),
          Container(
            height: 46,
            child: RaisedButton(
              color: Colors.orange,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,                  
                ),
              ),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}