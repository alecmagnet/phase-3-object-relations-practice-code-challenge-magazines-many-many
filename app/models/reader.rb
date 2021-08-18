class Reader < ActiveRecord::Base
	has_many :subscriptions
	has_many :magazines, through: :subscriptions

	def subscribe(magazine, price)
		Subscription.create(magazine_id: magazine.id, reader_id: self.id, price: price)
	end

	def total_subscription_price
		price_arr = self.subscriptions.map {|s| s.price }
		price_arr.sum
	end

	def cancel_subscription(magazine)
		to_cancel = self.subscriptions.find_by magazine_id: magazine.id
		Subscription.destroy(to_cancel.id)
	end
end