class Text < ApplicationRecord
  validates :text, presence: true, length: { minimum: 1 }
end
