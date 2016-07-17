class User < ActiveRecord::Base
  # t.string :name
  # t.string :email
  # t.string :mobile
  # t.string :password
  # t.datetime :register_at
  # t.string :register_ip

  # def initialize
  # end



  class << self
    def test(num)
      (1..num).each do |n|
        _name = SecureRandom.urlsafe_base64(3)
        _mobile = g_salt(11)
        _password = SecureRandom.urlsafe_base64(4)
        User.create(name: _name, mobile: _mobile, password: _password)
        p ('------------' + n.to_s)
      end
    end

    def g_salt(len)
      # chars = Array('a'..'z') + Array('A'..'Z') + Array(0..9)
      chars = Array(0..9)
      len.times.map { chars.sample }.join
    end
  end

  private

  def generate_token
    loop do
      self.token = SecureRandom.urlsafe_base64(6)
      break unless User.where(token: token).exists?
    end
  end




end
