require_relative '../../lib/transaction'

describe Transaction do
  let(:date) { '01/01/2023' }
  let(:amount) { 1000 }
  let(:transaction_type) { 'credit' }
  let(:balance) { 2000 }

  subject(:transaction) { described_class.new(date, amount, transaction_type, balance) }

  context 'when Transaction class is initialized' do
    it 'sets the relevant attribute' do
      expect(transaction.date).to eq(date)
      expect(transaction.amount).to eq(amount)
      expect(transaction.transaction_type).to eq(transaction_type)
      expect(transaction.balance).to eq(balance)
    end

    it 'does not allow modification of attributes' do
      expect { transaction.date = "02/01/2023" }.to raise_error(NoMethodError)
      expect { transaction.amount = 500 }.to raise_error(NoMethodError)
      expect { transaction.transaction_type = "debit" }.to raise_error(NoMethodError)
      expect { transaction.balance = 1000 }.to raise_error(NoMethodError)
    end  
  end
end  
