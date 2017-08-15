class Book < ApplicationRecord
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  def self.search(search)
    where("lower(title) LIKE ? OR lower(classification) LIKE ? OR lower(genre) LIKE ? OR lower(category) LIKE ?",
     "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end
end
