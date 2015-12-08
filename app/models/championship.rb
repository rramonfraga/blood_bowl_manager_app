class Championship < ActiveRecord::Base
  belongs_to :society

  validates :name, :kind, presence: true
end
