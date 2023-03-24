module BankAccount
  module Deposit
    def self.call(amount)
      $bank_account_balance += amount
    
      $bank_account_transactions << {type: 'credit', amount: amount, balance: $bank_account_balance, recorded_at: Time.now}
    
      Display.balance($bank_account_pin)
    end
  end
end