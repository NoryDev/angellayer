class Comment < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :founder

validates :content, presence: true

end
