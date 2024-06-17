class Comment < ApplicationRecord
=begin
this is equivalent to expressjs Model
  comment : {
    creator: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  }
=end
  belongs_to :article
end
