module BankAccount
  module Withdraw
    def bank_account_withdraw(amount, pin)
      return bank_account_display_invalid_pin if $bank_account_pin != pin
  
      return puts 'Insufficient funds!' if ($bank_account_balance + $bank_account_overdraft_limit) < amount
  
      $bank_account_balance -= amount
  
      $bank_account_transactions << {type: 'debit', amount: amount, balance: $bank_account_balance, recorded_at: Time.now}
  
      puts "Withdrawn: #{amount} | New balance: #{$bank_account_balance}"
    end
  end
end