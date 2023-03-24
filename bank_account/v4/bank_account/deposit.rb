module BankAccount
  module Deposit
    def bank_account_deposit(amount)
      $bank_account_balance += amount
    
      $bank_account_transactions << {type: 'credit', amount: amount, balance: $bank_account_balance, recorded_at: Time.now}
    
      bank_account_display_balance($bank_account_pin)
    end
  end
end