import 'package:practica3/User.dart';
import 'package:practica3/Account.dart';
import 'package:practica3/transaction.dart';
import 'package:practica3/deposit_transaction.dart';
import 'package:practica3/withdrawal_transaction.dart';
import 'package:practica3/transfer_transaction.dart';

import 'dart:io'; //-> borrar


class BankService {
  final Set<User> _users = {};
  final Set<Transaction> _transactions ={};

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

  void deposit(String account, double amount) {
    Account? acc = this._getAccount(account);
    if (acc != null) {
      Transaction deposit = DepositTransaction(amount);
      deposit.apply(acc);
      print("Se han depositado $amount en la cuenta $account.");
    } else {
      print("La cuenta $account no existe.");
    }
  }

  void withdraw(String account, double amount) {
    Account? acc = this._getAccount(account);
    if (acc != null) {
      Transaction withdraw = WithdrawalTransaction(amount);
      withdraw.apply(acc);
      print("Se han retirado $amount de la cuenta $account.");
    } else {
      print("La cuenta $account no existe.");
    }
  }

  void transfer(String from, String to, double amount) {
    Account? fromAcc = this._getAccount(from);
    Account? toAcc = this._getAccount(to);

    if (fromAcc != null && toAcc != null) {
      Transaction transfer = TransferTransaction(amount, toAcc);
      transfer.apply(fromAcc);
      print("Se han transferido $amount desde la cuenta $from a la cuenta $to.");
    } else {
      if (fromAcc == null) {
        print("La cuenta de origen $from no existe.");
      }
      if (toAcc == null) {
        print("La cuenta de destino $to no existe.");
      }
    }
  }



  Account? _getAccount(String account) {
    for (var user in this._users) {
      for (var acc in user.accounts) {
        if (acc.id == account) {
          return acc;
        }
      }
    }
    return null; // Retornar null si no se encuentra la cuenta.
  }


  // Mostrar todos los usuarios y sus cuentas
  void showAllUsers() {
    for (var user in this._users) {
      print ("-----------------------------------------");
      print("Usuario: ${user.name} (ID: ${user.id})");
      user.showAccounts();
    }
  }

  List<String> getUsers() {
    List<String> list = [];

    for (var user in _users) {
      list.add('${user.id} ${user.name}');
    }

    return list;
  }

}

void main () {
  BankService bs = BankService();

  bs.showAllUsers();

  bs.createAccount("1234", "Sofia");
  bs.createAccount("1234", "Sofia");

  bs.createAccount("22222", "Alba");

  bs.showAllUsers();

  print ("DEPOSIT");
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

  print ("WITHDRAW");
  print("Introduzca el ID de una cuenta:");
  acc = stdin.readLineSync();

  print("Introduzca la cantidad a retirar:");
  amountStr = stdin.readLineSync();
  amount = double.tryParse(amountStr ?? '');

  if (acc != null && amount != null) {
    bs.withdraw(acc, amount);
  } else {
    print("Entrada inválida.");
  }

  bs.showAllUsers();


  print ("TRANSFER");
  print("Introduzca el ID de una cuenta FROM:");
  acc = stdin.readLineSync();

  print("Introduzca el ID de una cuenta TO:");
  String? acc2 = stdin.readLineSync();

  print("Introduzca la cantidad a transferir:");
  amountStr = stdin.readLineSync();
  amount = double.tryParse(amountStr ?? '');

  if (acc != null && amount != null && acc2 != null) {
    bs.transfer(acc, acc2, amount);
  } else {
    print("Entrada inválida.");
  }

  bs.showAllUsers();
}