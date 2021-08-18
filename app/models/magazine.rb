class Magazine < ActiveRecord::Base
	has_many :subscriptions
	has_many :readers, through: :subscriptions  

	def email_list
		emails_arr = self.readers.map {|r| r.email}
		emails_arr.join(";")
	end

	def self.most_popular
		all.sort {|a, b| a.subscriptions.count <=> b.subscriptions.count}.last
	end
end