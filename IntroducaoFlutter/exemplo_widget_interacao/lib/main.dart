import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: TelaCadastroApp()));
}

//criar uma tela de Cadastro (formulário) - 
class TelaCadastroApp extends StatefulWidget{
  @override
  _TelaCadastroAppState createState() => _TelaCadastroAppState();
}

class _TelaCadastroAppState extends State<TelaCadastroApp>{
  //atributos
  final _formKey = GlobalKey<FormState>(); //Chave de Seleção dos Componenetes do Formulário
  String _nome = ""; // utilização do "_" antes da declaração da variável (private)
  String _email = "";
  String _senha = "";
  String _genero = "";
  String _dataNascimento = "";
  double _experiencia = 0;
  bool _aceite = false; //declaração da boolean (bool)

  //métodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Usuário - Exemplo Widget Interação")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,//validação de formulário
          child: Column(
            children: [
              //Campo Nome
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o Nome"),
                validator: (value) => value!.trim().isEmpty ? "Digite um Nome" : null, //operador ternário
                onSaved: (value)=> _nome = value!.trim(),
              ),
              //Campo Email
              TextFormField(
                decoration: InputDecoration(labelText: "Insira o Email"),
                validator: (value) => value!.contains("@") ? null : "Digite um Email Válido",
                onSaved: (value) => _email = value!.trim(),
              ),
              //Campo Senha
              TextFormField(
                decoration: InputDecoration(labelText: "Insira a Senha"),
                obscureText: true,
                validator: (value) => value!.trim().length>=6 ? null : "Digite uma Senha Válida",
                onSaved: (value)=>_senha = value!.trim(),
              ),
              //Campo Gênero
              Text("Gênero"),
              DropdownButtonFormField(
                items: ["Feminino", "Masculino", "Outro"].map((String genero)=>DropdownMenuItem(
                  value: genero,
                  child:Text(genero))).toList(), 
                onChanged: (value){},
                validator: (value) => value==null ? "Selecione um Gênero" : null,
                onSaved: (value) => _genero = value!
              ),
              //Campo DataNascimento
              TextFormField(
                decoration: InputDecoration(labelText: "Informe a Data de Nascimento"),
                validator: (value) => value!.trim().isEmpty ? "Digite a Data de Nascimento" : null,
                onSaved: (value)=> _dataNascimento = value!.trim(),
              ),
              //slider de Seleção(experiência)
              Text("Anos de Experiência com Programação:"),
              Slider(
                value: _experiencia,
                min: 0,
                max: 20,
                divisions: 20,
                label: _experiencia.round().toString(), 
                onChanged: (value)=>setState(() {
                  _experiencia = value;
                })),
                //aceite dos Termos de uso
                CheckboxListTile(
                  value: _aceite,
                  title: Text("Aceito os Termos de Uso do Aplicativo"),
                  onChanged: (value)=>setState(() {
                    _aceite = value!;
                  })),
                // botão de Envio do Formulário
                ElevatedButton(
                  onPressed: _enviarFormulario, 
                  child: Text("Enviar"))
            ],
          )),
        ),
    );
  }

  void _enviarFormulario(){

  }

}
