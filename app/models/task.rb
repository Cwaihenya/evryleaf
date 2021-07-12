class Task < ApplicationRecord
validates_presence_of :title,
        message: "Title should be included"
validates_presence_of :content,
        message: "Content should be provided"
validates_presence_of :deadline,
                  message: "Task_deadline should be listed"
enum priority: [:low, :medium, :high]
scope :title_search, -> (query) {where("title LIKE ?", "%#{query}%")}
 def title_search(query)
   where("title LIKE ?", "%#{query}%")
 end

scope :status_search, -> (query) {where(status: query)}
 def status_search(query)
     where(status: query)
 end
                   scope :priority_ordered, -> {order("
  	    CASE tasks.priority
  	    WHEN 'high' THEN 'a'
  	    WHEN 'medium' THEN 'b'
  	    WHEN 'low' THEN 'c'
  	    ELSE 'z'
  	    END ASC,
  	    id DESC" )}
max_paginates_per 5

end
