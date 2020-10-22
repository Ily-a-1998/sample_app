class User < ApplicationRecord
	before_save { self.email = email.downcase } # перед сохранением пользователя, регистр email меняем на нижний | база данных сохранит запись пользователя, основанную на первом запросе, и отклонит второе сохранение за нарушение уникальности.
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i # регулярное выражение правильности написания email
	validates :email, presence: true, length: { maximum: 255 }, 
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false } # предотвращение дублирования email
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
