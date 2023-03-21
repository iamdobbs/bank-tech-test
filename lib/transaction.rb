# frozen_string_literal: true

# Transaction class holds the details of a transaction
class Transaction
  attr_reader :date, :amount, :transaction_type, :balance

  def initialize(date, amount, transaction_type, balance)
    @date = date
    @amount = amount
    @transaction_type = transaction_type
    @balance = balance
  end
end
