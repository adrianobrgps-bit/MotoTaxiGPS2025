
class LoginController {
  String telefone = "";
  String senha = "";

  bool fazerLogin(String tel, String pass) {
    telefone = tel;
    senha = pass;

    // Lógica real pode incluir API, Firebase etc
    return telefone.isNotEmpty && senha.isNotEmpty;
  }
}