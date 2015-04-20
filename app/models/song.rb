class Song < ActiveRecord::Base

  belongs_to :writer

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("lower(title) LIKE ?", "%#{query}%".downcase)
  end

end
