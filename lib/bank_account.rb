# frozen_string_literal: true

require_relative './transaction'
require_relative './statement'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @transactions << Transaction.new(date, amount, :credit, balance)
  end

  def withdraw(amount, date)
    raise 'Insufficient balance' if amount > @balance

    @balance -= amount
    @transactions << Transaction.new(date, amount, :debit, balance)
  end

  def print_statement
    Statement.new(@transactions).print_statement
  end
end
