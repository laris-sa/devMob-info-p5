import 'package:flutter/material.dart';
import 'estudante.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    //login
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentCrudScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),

            ),
          ],
        ),
      ),
    );
  }
}

class StudentCrudScreen extends StatefulWidget {
  const StudentCrudScreen({Key? key}) : super(key: key);

  @override
  _StudentCrudScreenState createState() => _StudentCrudScreenState();
}


class _StudentCrudScreenState extends State<StudentCrudScreen> {
  final List<Student> students = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  int? selectedStudentIndex;

  void _addStudent() {
    setState(() {
      final name = _nameController.text;
      final email = _emailController.text;

      if (name.isNotEmpty && email.isNotEmpty) {
        students.add(Student(name: name, email: email));
        _nameController.clear();
        _emailController.clear();
      }
    });
  }

  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  void _editStudent(int index) {
    setState(() {
      selectedStudentIndex = index;
      _nameController.text = students[index].name;
      _emailController.text = students[index].email;
    });
  }

  void _updateStudent() {
    if (selectedStudentIndex != null) {
      setState(() {
        students[selectedStudentIndex!] = Student(
          name: _nameController.text,
          email: _emailController.text,
        );
        selectedStudentIndex = null;
        _nameController.clear();
        _emailController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Alunos'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: selectedStudentIndex == null
                      ? _addStudent
                      : _updateStudent,
                  child: Text(selectedStudentIndex == null
                      ? 'Adicionar Aluno'
                      : 'Atualizar Aluno'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedStudentIndex != null) {
                      _updateStudent();
                    } else {
                      _updateStudent();
                    }
                  },
                  child: Text(selectedStudentIndex != null ? 'Cancelar Edição' : 'Atualizar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return ListTile(
                    title: Text(student.name),
                    subtitle: Text(student.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editStudent(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteStudent(index);
                          },
                        ),
                      ],
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


