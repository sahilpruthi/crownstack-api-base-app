class User < ApplicationRecord
  include BCrypt
  
  ############# VALIDATIONS ###########
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  ############# ASSOCIATIONS ##########
  has_one :cart
  has_many :cart_products, through: :cart
  ############# CALLBACKS ###########
  after_commit :create_cart, on: :create

  def create_cart
    self.create_cart!
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
