require_relative 'bank_account'

bank_account = BankAccount::Data.new

bank_account.pin = '1234'
bank_account.balance = 0
bank_account.overdraft_limit = 100
bank_account.transactions = []

BankAccount::Deposit.call(100, bank_account)

puts

BankAccount::Withdraw.call(100, '1234', bank_account)
BankAccount::Withdraw.call(100, '1234', bank_account)
BankAccount::Withdraw.call(100, '1234', bank_account)

puts

BankAccount::Display.statement('1234', bank_account)

puts

BankAccount::Withdraw.call(100, '1235', bank_account)
BankAccount::Display.balance('1235', bank_account)
BankAccount::Display.statement('1235', bank_account)
