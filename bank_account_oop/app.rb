require_relative 'bank_account'

bank_account = BankAccount.new('1234', 0, 100)

bank_account.deposit(100)

puts

bank_account.withdraw(100, '1234')
bank_account.withdraw(100, '1234')
bank_account.withdraw(100, '1234')

puts

bank_account.display_statement('1234')

puts

bank_account.withdraw(100, '1235')
bank_account.display_balance('1235')
bank_account.display_statement('1235')
