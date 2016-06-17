class Transfer
	attr_accessor :sender, :receiver, :amount, :status
	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"

	end

	def valid?
		if @sender.valid? && @receiver.valid? == true
			return true
		end
		
	end

	def execute_transaction
		if @status == "pending" && sender.balance > @amount && sender.valid? == true && receiver.valid? == true
			@status = "complete"
			@sender.balance -= @amount
			@receiver.balance += @amount
		else
			@status = "rejected"
			"Transaction rejected. Please check your account balance."
			
		end
	end

	def reverse_transfer
		if @status == "complete"

			@sender.balance += amount
			@receiver.balance -= amount
			@status = "reversed"
		else
			@status = "rejected"

		end
	end

end
