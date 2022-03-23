class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        emails = self.readers.map {|reader| reader.email}
        emails.join(";")
    end

    def self.most_popular
        subscriptions_array = self.all.map {|magazine| magazine.subscriptions}
        most_subs = subscriptions_array.max_by {|subs| subs.length}
        self.all.find_by subscriptions: most_subs
    end
end