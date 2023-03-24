module BankAccount
  module Display
    def self.balance(pin)
      return invalid_pin if $bank_account_pin != pin
    
      puts "Balance: #{$bank_account_balance}"
    end
    
    def self.statement(pin)
      return invalid_pin if $bank_account_pin != pin
    
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
    
    def self.invalid_pin
      puts('Access denied: invalid PIN.')
    end
  end
end