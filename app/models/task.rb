class Task < ApplicationRecord
validates_presence_of :title,
        message: "Title should be included"
validates_presence_of :content,
        message: "Content should be provided"
validates_presence_of :deadline,
                  message: "Task_deadline should be listed"
end
