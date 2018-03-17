class User < ApplicationRecord
  attr_accessor :password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def self.authenticate(email:, password:)
    user = User.find_by(email: email)

    if user.match_password(password)
      user
    else
      nil
    end
  end

  def match_password(password)
    encrypted_password == BCrypt::Engine.hash_secret(password, salt)
  end

  private

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
