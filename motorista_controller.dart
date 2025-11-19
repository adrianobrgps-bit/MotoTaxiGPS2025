class MotoristaController {
  String nome = "";
  String cpf = "";
  String telefone = "";
  bool online = false;

  void atualizarStatus(bool status) {
    online = status;
  }

  void atualizarDados({
    required String nomeMotorista,
    required String telefoneMotorista,
  }) {
    nome = nomeMotorista;
    telefone = telefoneMotorista;
  }
}