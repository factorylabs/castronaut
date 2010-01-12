Dir[File.dirname(__FILE__) + "/../vendor/**"].each do |dir| 
  $LOAD_PATH.unshift(File.directory?(lib = "#{dir}/lib") ? lib : dir)
end

require 'active_support'
require 'activerecord'

require 'sinatra/base'

module Castronaut

  def self.config
    @cas_config
  end

  def self.config=(config)
    @cas_config = config
  end

  def self.logger
    @cas_config.logger
  end

end

require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'configuration'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'authentication_result'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'support', 'sample'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'utilities', 'random_string'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'consumeable'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'dispenser'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'login_ticket'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'service_ticket'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'proxy_ticket'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'ticket_granting_ticket'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'models', 'proxy_granting_ticket'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'authentication_result'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'ticket_result'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'presenters', 'login'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'presenters', 'logout'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'presenters', 'process_login'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'presenters', 'service_validate'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'presenters', 'proxy_validate'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters', 'restful_authentication', 'adapter'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters', 'restful_authentication', 'user'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters', 'development', 'adapter'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters', 'development', 'user'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters', 'ldap', 'adapter'))
require File.expand_path(File.join(File.dirname(__FILE__), 'castronaut', 'adapters', 'ldap', 'user'))