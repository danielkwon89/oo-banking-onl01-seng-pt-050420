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
<<<<<<< HEAD
    elsif self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
=======
    else
      sender.balance -= amount
      receiver.balance += amount
      self.last_amount = self.amount
      self.amount = 0
>>>>>>> f9cd01a15330b409a7f5e3c2cbd263add21c97bd
      self.status = "complete"
    end
  end
  
  def reverse_transfer
<<<<<<< HEAD
    if self.status == "complete"
      binding.pry
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
=======
    unless self.status == "reversed"
    binding.pry
      self.receiver.balance -= self.last_amount
      self.sender.balance += self.last_amount
      self.status = "reversed"
    end
    
>>>>>>> f9cd01a15330b409a7f5e3c2cbd263add21c97bd
  end
end
