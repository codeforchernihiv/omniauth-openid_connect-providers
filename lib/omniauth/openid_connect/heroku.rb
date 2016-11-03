module OmniAuth::OpenIDConnect
  class Heroku < Provider
    def host
      config?('host') || "id.heroku.com"
    end

    def options
      super.merge({
        scope: [:identity]
      })
    end

    def client_options
      opts = {
        :authorization_endpoint => "/oauth/authorize",
        :token_endpoint => "/oauth/token",
        :userinfo_endpoint => "/account"
      }

      opts.merge super
    end
  end
end
