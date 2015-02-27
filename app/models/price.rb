class Price < ActiveRecord::Base
  # extends ...................................................................
  acts_as_paranoid
  # includes ..................................................................
  # include Spree::DefaultPrice
  # relationships .............................................................
  belongs_to :variant, inverse_of: :prices, touch: true
  # validations ...............................................................
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  # class methods .............................................................
  # public instance methods ...................................................
  # def money
  #   Spree::Money.new(amount || 0, { currency: currency })
  # end
  # def price
  #   amount
  # end
  # def price=(price)
  #   self[:amount] = Spree::LocalizedNumber.parse(price)
  # end
  # protected instance methods ................................................
  # private instance methods ..................................................
end
