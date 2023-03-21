require_relative '../../lib/bank_account'

describe BankAccount do
  before(:each) do
    @account = BankAccount.new
  end

  context 'bank account initialization tests' do
    it 'initializes with a balance of zero' do
      expect(@account.balance).to eq(0)
    end
    it 'initializes with an empty transactions array' do
      expect(@account.transactions).to be_empty
    end
  end
  
  context 'updating balance when transaction functions called' do
    it 'increases balance when deposit is made' do
      @account.deposit(1000, '10/02/2023')
      expect(@account.balance).to eq(1000)
    end
    it 'reduces balance when withdrawal made after deposit' do
      @account.deposit(1000, '10/02/2023')
      @account.withdraw(500, '10/02/2023')
      expect(@account.balance).to eq(500)
    end  
    it 'raises error if withdrawal amount is greater than current balance' do
      expect{ @account.withdraw(500, '10/02/2023') }.to raise_error("Insufficient balance")
    end  
  end

end