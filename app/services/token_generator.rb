require 'securerandom'

class TokenGenerator
    def self.generate(length = 20)
        SecureRandom.urlsafe_base64(length * 3 / 4)
    end
end