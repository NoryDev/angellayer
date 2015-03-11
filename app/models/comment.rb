class Comment < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:content]

  belongs_to :evaluation
  belongs_to :founder

  validates :content, presence: true

end
