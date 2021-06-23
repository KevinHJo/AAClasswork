class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password,length: { minimum: 6, allow_nil: true }
    after_initialize :ensure_session_token
    attr_reader :password
    
    has_many :goals

    has_many :comments,
        through: :goals,
        source: :comments

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64 
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end









end
