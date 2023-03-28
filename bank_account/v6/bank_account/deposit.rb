module BankAccount
  module Deposit
    def self.call(amount, bank_account_balance, bank_account_transactions, bank_account_pin)
      new_balance = bank_account_balance += amount
    
      bank_account_transactions << {type: 'credit', amount: amount, balance: new_balance, recorded_at: Time.now}
    
      Display.balance(bank_account_pin, bank_account_pin, new_balance)

      new_balance
    end
  end
end