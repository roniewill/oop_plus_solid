class BankAccount
  attr_accessor :pin, :balance, :overdraft_limit, :transactions

  def initialize(pin, balance, overdraft_limit)
    @pin = pin
    @balance = balance
    @overdraft_limit = overdraft_limit
    @transactions = []
  end

  def deposit(amount)
    self.balance += amount
  
    self.transactions << {type: 'credit', amount: amount, balance: self.balance, recorded_at: Time.now}
  
    display_balance(self.pin)
  end

  def withdraw(amount, pin)
    return display_invalid_pin if self.pin != pin 

    puts 'Insufficient funds!' if (self.balance + self.overdraft_limit) < amount

    self.balance -= amount

    self.transactions << {type: 'debit', amount: amount, balance: self.balance, recorded_at: Time.now}

    puts "Withdrawn: #{amount} | New balance: #{self.balance}"
  end

  def display_statement(pin)
    return display_invalid_pin if self.pin != pin
  
    i = 0
    rows = ''
  
    while i < self.transactions.size
      record = self.transactions[i]
  
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

  def display_balance(pin)
    return display_invalid_pin if self.pin != pin
  
    puts "Balance: #{self.balance}"
  end

  def display_invalid_pin
    puts 'Access denied: invalid PIN.'
  end
end
