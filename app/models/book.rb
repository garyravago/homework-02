class Book < ApplicationRecord
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  def self.search(search)
    joins(:authors).where("lower(first_name) LIKE ? OR lower(last_name) LIKE ? OR lower(title) LIKE ? OR lower(classification) LIKE ? OR lower(genre) LIKE ? OR lower(category) LIKE ?",
     "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end
end
