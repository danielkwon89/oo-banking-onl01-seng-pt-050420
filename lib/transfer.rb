require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :last_amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      binding.pry
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end
end
