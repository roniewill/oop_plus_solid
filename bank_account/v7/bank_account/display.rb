module BankAccount
  module Display
    def self.balance(pin, bank_account)
      return invalid_pin if bank_account.pin != pin
    
      puts "Balance: #{bank_account.balance}"
    end
    
    def self.statement(pin, bank_account)
      return invalid_pin if bank_account.pin != pin
    
      i = 0
      rows = ''
    
      while i < bank_account.transactions.size
        record = bank_account.transactions[i]
    
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
    
    def self.invalid_pin
      puts('Access denied: invalid PIN.')
    end
  end
end
