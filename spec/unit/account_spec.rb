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
  
end