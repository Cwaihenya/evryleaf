class Task < ApplicationRecord
validates_presence_of :title,
        message: "Title should be included"
validates_presence_of :content,
        message: "Content should be provided"
validates_presence_of :deadline,
                  message: "Task_deadline should be listed"

  
                  scope :search_status, -> (status){where('status = ?',status)}
                   scope :search_title, -> (title){where('title LIKE ?',"%#{title}%")}
max_paginates_per 5
end
