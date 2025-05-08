import 'package:practica3/User.dart';
import 'package:practica3/Account.dart';
import 'package:practica3/transaction.dart';
import 'package:practica3/deposit_transaction.dart';
import 'package:practica3/withdrawal_transaction.dart';
import 'package:practica3/transfer_transaction.dart';

import 'dart:io';

import 'package:practica3/transaction.dart'; //-> borrar

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

  void deposit (String account, double amount) {
    // comprobar si la cuenta exise para algún usuario

    Transaction deposit = DepositTransaction(amount);
    deposit.apply(this._getAccount(account));



   /* for (var user in this._users ) {
      for (var acc in user.accounts) {
        if (acc.id == account) {
          acc.deposit(amount);
          print("Se han depositado $amount en la cuenta $amount.");
          return;
        }
      }
    }
    */


  }

  void witdraw (String account, double amount) {
    Transaction withdraw = WithdrawalTransaction(amount);
    withdraw.apply(this._getAccount(account));
  }

  void transfer (String from, String to, amount) {
    Transaction transfer = TransferTransaction(amount,this._getAccount(to));
    transfer.apply(this._getAccount(from));

  }


  Account _getAccount (String account) {

    Account a = Account();
    for (var user in this._users ) {
      for (var acc in user.accounts) {
        if (acc.id == account) {
          return acc;
        }
      }
    }

    return a; // cambiar esto, esto no se hace así

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


  print ("TRANSFER");
  print("Introduzca el ID de una cuenta FROM:");
  acc = stdin.readLineSync();

  print("Introduzca el ID de una cuenta TO:");
  String? acc2 = stdin.readLineSync();

  print("Introduzca la cantidad a depositar:");
  amountStr = stdin.readLineSync();
  amount = double.tryParse(amountStr ?? '');

  if (acc != null && amount != null && acc2 != null) {
    bs.transfer(acc, acc2, amount);
  } else {
    print("Entrada inválida.");
  }

  bs.showAllUsers();
}