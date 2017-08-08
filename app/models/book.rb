class Book < ApplicationRecord
  def self.search(search)
    where("lower(title) LIKE ?", "%#{search.downcase}%")
  end
end
