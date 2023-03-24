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