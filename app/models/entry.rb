class Entry < ActiveRecord::Base
  belongs_to :user
  validates :content, length: { maximum: 1500 }
  validates :user_id, presence: true
end
