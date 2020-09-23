class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  #いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #検索機能
  def self.search(search, word)
    if search == "forward_match"
       @book = Book.where("title LIKE?","#{word}%").or Book.where("body LIKE?","#{word}%")
    elsif search == "backward_match"
       @book = Book.where("title LIKE?","%#{word}").or Book.where("body LIKE?","%#{word}")
    elsif search == "perfect_match"
       @book = Book.where("title LIKE?","#{word}").or Book.where("body LIKE?","#{word}")
    elsif search == "partial_match"
       @book = Book.where("title LIKE?","%#{word}%").or Book.where("body LIKE?","%#{word}%")
    else
       @book = Book.all
    end
end

end
