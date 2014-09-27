class Song < ActiveRecord::Base

  # @param [Object] search
  def self.search(search)
    search_condition = "%" + search + "%"
    where('title LIKE ?', search_condition)
  end
end
