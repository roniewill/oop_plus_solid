bank_account_pin = '1234'
bank_account_balance = 0
bank_account_overdraft_limit = 100
bank_account_transactions = []

require_relative 'bank_account'

bank_account_balance = BankAccount::Deposit.call(100, bank_account_balance, bank_account_transactions, bank_account_pin)

puts

bank_account_balance = BankAccount::Withdraw.call(100, '1234', bank_account_pin, bank_account_balance, bank_account_overdraft_limit, bank_account_transactions)
bank_account_balance = BankAccount::Withdraw.call(100, '1234', bank_account_pin, bank_account_balance, bank_account_overdraft_limit, bank_account_transactions)
bank_account_balance = BankAccount::Withdraw.call(100, '1234', bank_account_pin, bank_account_balance, bank_account_overdraft_limit, bank_account_transactions)

puts

BankAccount::Display.statement('1234', bank_account_pin, bank_account_transactions)

puts

BankAccount::Withdraw.call(100, '1235', bank_account_pin, bank_account_balance, bank_account_overdraft_limit, bank_account_transactions)
BankAccount::Display.balance('1235', bank_account_pin, bank_account_balance)
BankAccount::Display.statement('1235', bank_account_pin, bank_account_transactions)
