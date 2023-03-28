module BankAccount
  module Withdraw
    def self.call(amount, pin, bank_account)
      return Display.invalid_pin if bank_account.pin != pin 

      if (bank_account.balance + bank_account.overdraft_limit) < amount
        puts 'Insufficient funds!'

        return bank_account.balance
      end
  
      new_balance = bank_account.balance -= amount
  
      bank_account.transactions << {type: 'debit', amount: amount, balance: new_balance, recorded_at: Time.now}
  
      puts "Withdrawn: #{amount} | New balance: #{new_balance}"

      new_balance
    end
  end
end