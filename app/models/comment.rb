class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  validates :comment, presence: true
  validates :user_id, presence: true
  validates :commentable_id, presence: true
  default_scope -> { order('created_at Desc') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  # belongs_to :micropost
end
