class Text < ApplicationRecord
  belongs_to :user
  before_save :set_sentiment, if: :text_changed?

  default_scope { order(created_at: :desc) }
  validates :text, presence: true, length: { minimum: 1 }



  def set_sentiment
    self.sentiment = $analyzer.sentiment(text)
    self.score = $analyzer.score(text)
  end
end
