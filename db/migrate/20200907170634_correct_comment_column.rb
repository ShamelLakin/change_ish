class CorrectCommentColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column(:comments, :commentor, :commenter)
  end
end
