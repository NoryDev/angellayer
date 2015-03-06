class Vote < ActiveRecord::Base
  belongs_to :founder
  belongs_to :evaluation
end
