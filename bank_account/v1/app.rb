$bank_account_pin = '1234'
$bank_account_balance = 0
$bank_account_overdraft_limit = 100
$bank_account_transactions = []

def bank_account_deposit(amount)
  $bank_account_balance += amount

  $bank_account_transactions << {type: 'credit', amount: amount, balance: $bank_account_balance, recorded_at: Time.now}

  bank_account_display_balance($bank_account_pin)
end

def bank_account_withdraw(amount, pin)
  return bank_account_display_invalid_pin if $bank_account_pin != pin

  return puts 'Insufficient funds!' if ($bank_account_balance + $bank_account_overdraft_limit) < amount

  $bank_account_balance -= amount

  $bank_account_transactions << {type: 'debit', amount: amount, balance: $bank_account_balance, recorded_at: Time.now}

  puts "Withdrawn: #{amount} | New balance: #{$bank_account_balance}"
end

def bank_account_display_balance(pin)
  return bank_account_display_invalid_pin if $bank_account_pin != pin

  puts "Balance: #{$bank_account_balance}"
end

def bank_account_display_statement(pin)
  return bank_account_display_invalid_pin if $bank_account_pin != pin

  i = 0
  rows = ''

  while i < $bank_account_transactions.size
    record = $bank_account_transactions[i]

    rows << (
      "#{record[:recorded_at].strftime("%Y-%m-%d")} | " +
      "#{record[:type]} | " +
      "#{record[:amount]} | " +
      "#{record[:balance]} \n"
    )

    i += 1
  end

  puts "date       | type | amount | balance", rows
end

def bank_account_display_invalid_pin
  puts('Access denied: invalid PIN.')
end

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
