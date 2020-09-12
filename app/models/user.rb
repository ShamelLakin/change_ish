class User < ApplicationRecord
    has_many :comments
    has_many :comments, through: :articles
end
