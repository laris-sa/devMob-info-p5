import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Login(title: 'Login'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor digite seu email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Senha",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor digite sua senha';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (emailController.text == "admin@larissa.com" &&
                        passwordController.text == "admin") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroAluno(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Credenciais inválidas'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor preencha a entrada')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Aluno {
  String nome;
  String matricula;

  Aluno({required this.nome, required this.matricula});
}

class CadastroAluno extends StatefulWidget {
  @override
  _CadastroAlunoState createState() => _CadastroAlunoState();
}

class _CadastroAlunoState extends State<CadastroAluno> {
  List<Aluno> alunos = [];
  TextEditingController nomeController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Alunos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
            ),
            TextFormField(
              controller: matriculaController,
              decoration: InputDecoration(labelText: 'Matrícula do Aluno'),
            ),
            ElevatedButton(
              onPressed: () {
                String nome = nomeController.text;
                String matricula = matriculaController.text;
                Aluno aluno = Aluno(nome: nome, matricula: matricula);
                setState(() {
                  alunos.add(aluno);
                });
                nomeController.clear();
                matriculaController.clear();
              },
              child: Text('Cadastrar Aluno'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: alunos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(alunos[index].nome),
                    subtitle: Text(alunos[index].matricula),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          alunos.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

