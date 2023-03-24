$bank_account_pin = '1234'
$bank_account_balance = 0
$bank_account_overdraft_limit = 100
$bank_account_transactions = []

require_relative 'bank_account_display'
require_relative 'bank_account_deposit'
require_relative 'bank_account_withdraw'

extend Bank_Account_Display
extend Bank_Account_Deposit
extend Bank_Account_Withdraw

bank_account_deposit(100)

puts

bank_account_withdraw(100, '1234')
bank_account_withdraw(100, '1234')
bank_account_withdraw(100, '1234')

puts

bank_account_display_statement('1234')

puts

bank_account_withdraw(100, '1235')
bank_account_display_balance('1235')
bank_account_display_statement('1235')
