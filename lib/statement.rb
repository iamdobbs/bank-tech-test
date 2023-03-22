# frozen_string_literal: true

# Statement class allows user to generate printed summary of transaction history
class Statement
  HEADER = 'date || credit || debit || balance'

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    puts HEADER, transaction_list.join("\n")
  end

  def transaction_list
    @transactions.reverse.map do |t|
      if t.transaction_type == :credit
        "#{t.date} || #{format_output(t.amount)} || || #{format_output(t.balance)}"
      else
        "#{t.date} || || #{format_output(t.amount)} || #{format_output(t.balance)}"
      end
    end
  end

  def format_output(number)
    format('%.2f', number)
  end
end
