class Plan < ApplicationRecord
 belongs_to  :user
 validates :start_time, presence: true

 validates :plan_which, presence: true

  private
    def plan_which
      title.presence or content.presence or tag.presence 
    end
end
