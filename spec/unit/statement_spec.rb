# frozen_string_literal: true

require_relative '../../lib/statement'

describe Statement do
  let(:transaction) do
    double('Transaction', date: '10/01/2023', amount: 1000.00, transaction_type: :credit, balance: 1000.00)
  end
  let(:transaction_credit) do
    double('Transaction', date: '13/01/2023', amount: 2000.00, transaction_type: :credit, balance: 3000.00)
  end
  let(:transaction_debit) do
    double('Transaction', date: '14/01/2023', amount: 500.00, transaction_type: :debit, balance: 2500.00)
  end
  let(:transactions) { [transaction, transaction_credit, transaction_debit] }

  before(:each) do
    @statement = Statement.new(transactions)
  end

  context 'print method' do
    it 'prints the transactions in reverse chronological order' do
      expect { @statement.print_statement }.to output(
        <<~STATEMENT
          date || credit || debit || balance
          14/01/2023 || || 500.00 || 2500.00
          13/01/2023 || 2000.00 || || 3000.00
          10/01/2023 || 1000.00 || || 1000.00
        STATEMENT
      ).to_stdout
    end
  end
end
