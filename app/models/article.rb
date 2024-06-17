class Article < ApplicationRecord
  has_many :comments # this is to tell that Article is associated with comments model. This will look like comments: []

  validates :title, presence: true # presense is saying a string must have one character that is non-whitespace
  validates :body, presence: true, length: { minimum: 10 } # same thing but must have a minimum of 10 characters
end
