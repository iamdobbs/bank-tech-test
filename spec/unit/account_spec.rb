require_relative '../../lib/bank_account'

describe BankAccount do
  context 'bank account unit tests' do
    it 'initializes with a balance of zero' do
      account = BankAccount.new
      expect(account.balance).to eq(0)
    end
  end
end