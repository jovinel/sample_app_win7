class Micropost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

	# has_many :comments
	acts_as_commentable
	# has_many :post_replies, foreign_key: "from_user_id" dependent: :destroy
	# has_many :replies_to_micropost, through: :post_replies, source: :to_micropost_id

	# has_many :reverse_post_replies, foreign_key: "to_micropost_id", class_name: "PostReply" dependent: :destroy
	# has_many :replies_from_users, through: :reverse_post_replies, source: :from_user_id

end
