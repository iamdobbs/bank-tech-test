# Bank Tech Test

This is a command-line application that allows a user to utilise a bank account and make deposits, 
withdrawals and print a statement of their transactions.
## #Specification

Please click [here](https://github.com/makersacademy/course/blob/main/individual_challenges/bank_tech_test.md) to view
the original specification for this project, provided by @makersacademy.

### Installation

1. Clone this repository to your local machine.
2. Install the required dependencies using `bundle install`.

### Testing

This project uses Rspec for testing and SimpleCov to confirm a test coverage of 100%.
Use the `rspec` command to run tests.

### Usage
To use the application, start IRB from the command line with `irb`.

Require the necessary file:
```
require './lib/bank_account.rb'
```

You can then perform transactions and print a statement, using the following example as a guide:
```
account = BankAccount.new
account.deposit(1000, '10/01/2023')
account.deposit(2000, '13/01/2023')
account.withdraw(500, '14/01/2023')
account.print_statement
```

The output for this particular example will be:
```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### Approach
For my solution, I followed the principles of object-oriented programming and focused on
creating clean, readable code. I used a TDD approach to develop the application, writing tests
for each feature before implementing the code. I also made use of dependency injection to
ensure that each class had minimal dependencies on other classes. Once all tests were passing
and I was happy with the solution, I did some additional refactoring for code quality.

### Code Structure
The code is organised into three classes to manage the functionality of this application:

• BankAccount - represents a bank account and allows for deposits, withdrawals and printing of statements.
• Transaction - represents a single transaction and stores information such as the date, amount, type of transaction
  and updated balance.
• Statement - represents a statement of transactions and is responsible for formatting and printing the statement.

### Screenshot


