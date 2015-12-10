class Season < ActiveRecord::Base
  belongs_to :championship
  has_many :matches
end
