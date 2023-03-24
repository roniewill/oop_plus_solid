$bank_account_pin = '1234'
$bank_account_balance = 0
$bank_account_overdraft_limit = 100
$bank_account_transactions = []

require_relative 'bank_account'

BankAccount::Deposit.call(100)

puts

BankAccount::Withdraw.call(100, '1234')
BankAccount::Withdraw.call(100, '1234')
BankAccount::Withdraw.call(100, '1234')

puts

BankAccount::Display.statement('1234')

puts

BankAccount::Withdraw.call(100, '1235')
BankAccount::Display.balance('1235')
BankAccount::Display.statement('1235')
