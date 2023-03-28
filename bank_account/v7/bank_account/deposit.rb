module BankAccount
  module Deposit
    def self.call(amount, bank_account)
      new_balance = bank_account.balance += amount
    
      bank_account.transactions << {type: 'credit', amount: amount, balance: new_balance, recorded_at: Time.now}
    
      Display.balance(bank_account.pin, bank_account)

      new_balance
    end
  end
end