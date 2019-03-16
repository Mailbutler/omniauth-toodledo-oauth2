# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class ToodledoOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'toodledo_oauth2'

      option :client_options,
             site: 'https://api.toodledo.com/',
             authorize_url: '/3/account/authorize.php',
             token_url: '/3/account/token.php'

      uid { raw_info['id'] }

      info do
        # raw_info.merge(token: access_token.token)
        {
          name: raw_info['alias'],
          email: raw_info['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def callback_url
        options['redirect_uri'] || full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get('/3/account/get.php').parsed
      end
    end
  end
end
