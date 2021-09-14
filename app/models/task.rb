class Task < ApplicationRecord
belongs_to :user
validates :title, presence: true
validates :content, :deadline, presence: true
has_many :labellings, dependent: :destroy
	has_many :labels, through: :labellings
enum priority: [:low, :medium, :high]
scope :title_search, -> (query) {where("title LIKE ?", "%#{query}%")}
 def title_search(query)
   where("title LIKE ?", "%#{query}%")
 end
scope :status_search, -> (query) {where(status: query)}
 def status_search(query)
     where(status: query)
 end
 scope :label_search, -> (query) {
  @ids = Labelling.where(label_id: query).pluck(:task_id)
  where(id: @ids)}

 scope :user_task_list, -> (query) {where(user_id: query)}
  def user_task_list(query)
    where(user_id: query)
  end
max_paginates_per 5

end
