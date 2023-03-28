module BankAccount
  Data = Struct.new(:pin, :balance, :overdraft_limit, :transactions)

  require_relative 'bank_account/display'
  require_relative 'bank_account/deposit'
  require_relative 'bank_account/withdraw'
end