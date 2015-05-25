class User < ActiveRecord::Base
  validates :username,  presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, length: { minimum: 6 }
	has_and_belongs_to_many :quizzes
	
	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
