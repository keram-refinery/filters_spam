require "net/http"
require "uri"

module FiltersSpam
  module Recaptcha
    module Validator
      def self.validate_recaptcha(challenge, response)
        uri = URI.parse("http://www.google.com/recaptcha/api/verify")
        params = {
          :privatekey => FiltersSpam.configuration.recaptcha_private_key,
          :challenge => challenge,
          :response => response
        }

        Net::HTTP.post_form(uri, params).body.split("\n")
      end
    end
  end
end
