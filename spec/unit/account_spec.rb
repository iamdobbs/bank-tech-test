require_relative '../../lib/bank_account'

describe BankAccount do
  context 'bank account unit tests' do
    it 'initializes with a balance of zero' do
      account = BankAccount.new
      expect(account.balance).to eq(0)
    end
    it 'initializes with an empty transactions array' do
      account = BankAccount.new
      expect(account.transactions).to be_empty
    end
  end
end