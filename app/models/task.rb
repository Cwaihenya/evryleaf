class Task < ApplicationRecord
validates :title, presence: true
validates :content, :deadline, presence: true
enum priority: [:low, :medium, :high]
scope :title_search, -> (query) {where("title LIKE ?", "%#{query}%")}
 def title_search(query)
   where("title LIKE ?", "%#{query}%")
 end
scope :status_search, -> (query) {where(status: query)}
 def status_search(query)
     where(status: query)
 end
max_paginates_per 5

end
