class Product < ActiveRecord::Base
	has_many :orders
  has_many :comments
  validates :name, presence: true
  after_save  :expire_contact_all_cache
  after_destroy :expire_contact_all_cache

  def average_rating
    comments.average(:rating).to_f
  end

  def self.all_cached
    Rails.cache.fetch('Product.all') {all}
  end

  def expire_contact_all_cache
    Rails.cache.delete('Product.all')
  end

end
