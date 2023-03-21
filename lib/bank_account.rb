class BankAccount

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end  

  def deposit(amount)
    @balance += amount
  end  

  def withdraw(amount)
    raise "Insufficient balance" if amount > @balance
    @balance -= amount
  end

end  