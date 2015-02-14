class Product < ActiveRecord::Base
  # extends ...................................................................
  acts_as_paranoid
  # includes ..................................................................
  # relationships .............................................................
  has_many :product_option_types, dependent: :destroy, inverse_of: :product
  has_many :option_types, through: :product_option_types
  has_many :product_properties, dependent: :destroy, inverse_of: :product
  has_many :properties, through: :product_properties

  has_many :classifications, dependent: :delete_all, inverse_of: :product
  has_many :taxons, through: :classifications
  # validations ...............................................................
  validates :spu, presence: true, uniqueness: true
  validates :name, presence: true
  # validates :price, presence: true, if: proc { Spree::Config[:require_master_price] }
  validates :meta_keywords, length: { maximum: 255 }
  validates :meta_title, length: { maximum: 255 }
  # validates :shipping_category_id, presence: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................
end
