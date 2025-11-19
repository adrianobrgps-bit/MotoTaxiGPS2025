class CadastroController {
  String nome = "";
  String telefone = "";
  String cpf = "";
  String senha = "";

  bool cadastrar({
    required String nomeCompleto,
    required String telefoneCadastro,
    required String cpfCadastro,
    required String senhaCadastro,
  }) {
    nome = nomeCompleto;
    telefone = telefoneCadastro;
    cpf = cpfCadastro;
    senha = senhaCadastro;

    // Aqui salvaria no banco / API
    return true;
  }
}