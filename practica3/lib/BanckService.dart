import 'package:practica3/User.dart';
import 'package:practica3/Account.dart';
import 'dart:io'; //-> borrar

class BankService {
  final Set<User> _users = {};

  BankService();

  // Métod para crear una cuenta para un usuario
  void createAccount(String id, String name) {
    // Buscar el usuario por su ID
    User? user = _users.firstWhere(
          (u) => u.id == id,
      orElse: () {
        // Si no existe, lo crea
        User newUser = User(id, name);
        _users.add(newUser);
        return newUser;
      },
    );

    // Crear la cuenta y añadirla al usuario
    Account newAccount = Account();
    user.addAccount(newAccount);

    print("Cuenta creada para ${user.name} con ID: ${newAccount.id}");
  }

  void deposit (String account, double amount) {
    // comprobar si la cuenta exise para algún usuario

    for (var user in this._users ) {
      for (var acc in user.accounts) {
        if (acc.id == account) {
          acc.deposit(amount);
          print("Se han depositado $amount en la cuenta $amount.");
          return;
        }
      }
    }

  }

  // Mostrar todos los usuarios y sus cuentas
  void showAllUsers() {
    for (var user in this._users) {
      print ("-----------------------------------------");
      print("Usuario: ${user.name} (ID: ${user.id})");
      user.showAccounts();
    }
  }
}

void main () {
  BankService bs = BankService();

  bs.showAllUsers();

  bs.createAccount("1234", "Sofia");
  bs.createAccount("1234", "Sofia");

  bs.createAccount("22222", "Alba");

  bs.showAllUsers();

  print("Introduzca el ID de una cuenta:");
  String? acc = stdin.readLineSync();

  print("Introduzca la cantidad a depositar:");
  String? amountStr = stdin.readLineSync();
  double? amount = double.tryParse(amountStr ?? '');

  if (acc != null && amount != null) {
    bs.deposit(acc, amount);
  } else {
    print("Entrada inválida.");
  }

  bs.showAllUsers();
}