class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    #allows us to delete associated comments along with deleted articles
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: {minimum: 2} 
    #article has many comments
end
