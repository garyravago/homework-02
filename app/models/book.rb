class Book < ApplicationRecord
  def self.search(search)
    where("lower(title) LIKE ? OR lower(author) LIKE ? OR lower(classification) LIKE ? OR lower(genre) LIKE ? OR lower(category) LIKE ?",
     "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end
end
