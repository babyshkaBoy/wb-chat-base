//
//  Bank.swift
//  chat-contacts
//
//  Created by Азамат Баев on 16.06.2024.
//
import SwiftUI

class BankAccount {
    var accountNumber: String
    var balance: Double

    init(accountNumber: String, balance: Double = 0) {
        self.accountNumber = accountNumber
        self.balance = balance
    }

    func deposit(amount: Double) {
        balance += amount
        print("Счет \(accountNumber): пополнен на \(amount). Текущий баланс: \(balance)")
    }

    func transfer(to other: BankAccount, amount: Double) {
        if balance >= amount {
            balance -= amount
            other.balance += amount
            print("Счет \(accountNumber) -> Счет \(other.accountNumber): переведено \(amount).")
        } else {
            print("Недостаточно средств для перевода с Счета \(accountNumber).")
        }
    }

    func printBalance() {
        print("Счет \(accountNumber): Баланс \(balance)")
    }
}

class Bank {
    var accounts: [BankAccount] = []

    func addAccount(_ account: BankAccount) {
        accounts.append(account)
    }

    func printAllAccounts() {
        for account in accounts {
            account.printBalance()
        }
    }
}

func main() {
    let bank = Bank()

    // Добавление счетов
    bank.addAccount(BankAccount(accountNumber: "123", balance: 1000))
    bank.addAccount(BankAccount(accountNumber: "456", balance: 1500))

    // Печать состояния всех счетов до операций
    print("Состояние счетов до операций:")
    bank.printAllAccounts()

    // Выполнение операций
    bank.accounts[0].deposit(amount: 500)
    bank.accounts[0].transfer(to: bank.accounts[1], amount: 700)

    // Печать состояния всех счетов после операций
    print("\nСостояние счетов после операций:")
    bank.printAllAccounts()
}

// Вызов функции main
main()
