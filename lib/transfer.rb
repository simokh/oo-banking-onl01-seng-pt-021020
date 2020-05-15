require 'pry'

class Transfer
  attr_reader :name
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?? true : fasle  
  end 

  def execute_transaction 
    if sender.balance > amount && self.status == "pending"
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
  end 

  def reverse_transfer 
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end 



end 


# if self.valid? && @sender.balance > @amount && @status == "pending" 
  #   @sender.balance -= @amount
  #   receiver.deposit(self.amount)
  #   return @status = "complete"
  # else
  #   self.status = "rejected"
  #   "Transaction rejected. Please check your account balance."
  # end 