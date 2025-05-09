import 'package:practica3/User.dart';
import 'package:practica3/Account.dart';
import 'package:practica3/transaction.dart';
import 'package:practica3/deposit_transaction.dart';
import 'package:practica3/withdrawal_transaction.dart';
import 'package:practica3/transfer_transaction.dart';



class BankService {
  final Set<User> _users = {};
  final List<Transaction> _transactions = [];

  BankService();

  get users => this._users;

  get transactions => this._transactions;

  List<Account> getAllAcounts () {
    List<Account> l = [];

    for (var user in this._users) {
      for (var acc in user.accounts) {
        l.add(acc);
      }
    }
    return l;
  }

  // Métod para crear una cuenta para un usuario
  Account createAccount(String name) {
    // Buscar el usuario por su ID
    User? user = _users.firstWhere(
          (u) => u.name == name,
      orElse: () {
        // Si no existe, lo crea
        User newUser = User(name);
        _users.add(newUser);
        return newUser;
      },
    );

    // Crear la cuenta y añadirla al usuario
    Account newAccount = Account();
    user.addAccount(newAccount);
    return newAccount;

    print("Cuenta creada para ${user.name} con ID: ${newAccount.id}");
  }

  void deposit(String account, double amount) {
    Account? acc = this._getAccount(account);
    if (acc != null) {
      Transaction deposit = DepositTransaction(amount);
      deposit.apply(acc);
      //print("Se han depositado $amount en la cuenta $account.");
      this._transactions.add(deposit);

    } else {
      print("La cuenta $account no existe.");
    }
  }

  void withdraw(String account, double amount) {
    Account? acc = this._getAccount(account);
    if (acc != null) {

        if(amount>acc.amount) {
          throw StateError("Saldo insuficiente");
        }
        else {
          Transaction withdraw = WithdrawalTransaction(amount);
          withdraw.apply(acc);
          this._transactions.add(withdraw);
          print("Se han retirado $amount de la cuenta $account.");
        }


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

      this._transactions.add(transfer);
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

  List<String> getUsers() {
    List<String> list = [];

    for (var user in _users) {
      list.add(user.name);
    }

    return list;
  }

  List<String> getUserAccounts(String name) {
    List<String> accountsList = [];

    try {
      var user = _users.firstWhere((u) => u.name == name);
      for (var account in user.accounts) {
        accountsList.add("${account.name}: ${account.id}");
      }
    } catch (e) {
      // Si no se encuentra el usuario, devolvemos lista vacía.
    }


    return accountsList;
  }



}
