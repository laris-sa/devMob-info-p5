//Programação de Dispositivos móveis

// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
}

void main() {
  // 1. Criar vários objetos Dependentes
  var dependente1 = Dependente("Dependente 1");
  var dependente2 = Dependente("Dependente 2");
  var dependente3 = Dependente("Dependente 3");
  var dependente4 = Dependente("Dependente 4");
  
  // 2. Criar vários objetos Funcionario com seus Dependentes associados
  var funcionario1 = Funcionario("Funcionário 1", [dependente1]);
  var funcionario2 = Funcionario("Funcionário 2", [dependente2]);
  var funcionario3 = Funcionario("Funcionário 3", [dependente3]);
  var funcionario4 = Funcionario("Funcionário 4", [dependente4]);
  
  // 3. Associar os Dependentes criados aos respectivos funcionários
  // Isso foi feito acima 
  
  // 4. Criar uma lista de Funcionários
  var funcionarios = [funcionario1, funcionario2, funcionario3, funcionario4];
  
  // 5. Criar um objeto EquipeProjeto com a lista de funcionários
  var equipeProjeto = EquipeProjeto("Projeto DevMob", funcionarios);
}
