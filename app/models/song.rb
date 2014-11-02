class Song < ActiveRecord::Base

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title LIKE ?", "%#{query.downcase}%")
  end

end
