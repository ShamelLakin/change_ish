class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    #allows us to delete associated comments along with deleted articles
    validates :title, presence: true, length: { minimum: 5 }
    #article has many comments
end
