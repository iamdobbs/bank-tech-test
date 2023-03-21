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
  end
end