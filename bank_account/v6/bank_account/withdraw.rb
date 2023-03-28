module BankAccount
  module Withdraw
    def self.call(amount, pin, bank_account_pin, bank_account_balance, bank_account_overdraft_limit, bank_account_transactions)
      return Display.invalid_pin if bank_account_pin != pin 

      if (bank_account_balance + bank_account_overdraft_limit) < amount
        puts 'Insufficient funds!'

        return bank_account_balance
      end
  
      new_balance = bank_account_balance -= amount
  
      bank_account_transactions << {type: 'debit', amount: amount, balance: new_balance, recorded_at: Time.now}
  
      puts "Withdrawn: #{amount} | New balance: #{new_balance}"

      new_balance
    end
  end
end