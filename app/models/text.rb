class Text < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates :text, presence: true, length: { minimum: 1 }
end
