# frozen_string_literal: true

require_relative '../../lib/statement'

describe Statement do
  let(:transaction_1) do
    double('Transaction', date: '10/01/2023', amount: 1000.00, transaction_type: :credit, balance: 1000.00)
  end
  let(:transaction_2) do
    double('Transaction', date: '13/01/2023', amount: 2000.00, transaction_type: :credit, balance: 3000.00)
  end
  let(:transaction_3) do
    double('Transaction', date: '14/01/2023', amount: 500.00, transaction_type: :debit, balance: 2500.00)
  end
  let(:transactions) { [transaction_1, transaction_2, transaction_3] }

  before(:each) do
    @statement = Statement.new(transactions)
  end

  context 'print method' do
    it 'prints the transactions in reverse chronological order' do
      expect { @statement.print_statement }.to output(
        "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
