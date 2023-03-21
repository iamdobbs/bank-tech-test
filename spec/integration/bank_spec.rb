# frozen_string_literal: true

require_relative '../../lib/bank_account'

describe 'BankAccount integration' do
  before(:each) do
    @account = BankAccount.new
  end

  context 'it records transactions correctly in the transactions array' do
    it 'records a deposit transaction' do
      @account.deposit(1000, '10/02/2023')
      transaction = @account.transactions.first
      expect(transaction.amount).to eq(1000)
      expect(transaction.date).to eq('10/02/2023')
      expect(transaction.transaction_type).to eq(:credit)
      expect(transaction.balance).to eq(1000)
    end

    it 'records a withdrawal transaction' do
      @account.deposit(1000, '10/02/2023')
      @account.withdraw(500, '11/02/2023')
      transaction = @account.transactions.last
      expect(transaction.amount).to eq(500)
      expect(transaction.date).to eq('11/02/2023')
      expect(transaction.transaction_type).to eq(:debit)
      expect(transaction.balance).to eq(500)
    end

    it 'records multiple transactions in the correct order' do
      @account.deposit(1000, '10/02/2023')
      @account.withdraw(500, '11/02/2023')
      @account.deposit(2000, '12/02/2023')
      expect(@account.transactions.length).to eq(3)
      expect(@account.transactions[0].amount).to eq(1000)
      expect(@account.transactions[1].amount).to eq(500)
      expect(@account.transactions[2].amount).to eq(2000)
    end
  end

  context 'updates the balance correctly' do
    it 'updates the balance when deposit and withdrawal made' do
      @account.deposit(1000, '01/01/2023')
      @account.withdraw(200, '02/01/2023')
      expect(@account.balance).to eq(800)
    end
  end  

  context 'integration between BankAccount and Statement classes' do
    it 'prints a statement with the correct transactions' do
      @account.deposit(1000, '10/01/2023')
      @account.deposit(2000, '13/01/2023')
      @account.withdraw(500, '14/01/2023')
      expect{ @account.print_statement }.to output(
        "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
