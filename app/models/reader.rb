class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
    end

    def total_subcription_price
        all_prices = self.subscriptions.map {|subscription| subscription.price}
        all_prices.sum()
    end

    def cancel_subscription(magazine)
        self.subscriptions.destroy_by(magazine_id: magazine.id)
        # subscription_to_cancel = self.subscriptions.find_by magazine_id: magazine.id
        # subscription_to_cancel.destroy
    end
end