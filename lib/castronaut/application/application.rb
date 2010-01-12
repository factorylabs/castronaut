class Castronaut::Application < Sinatra::Base
  
  configure do
    root      = File.dirname(__FILE__)
    views     = "#{root}/views"
    pub_dir   = "#{root}/public"

    Castronaut.logger.debug "Sinatra Config - setting root path to #{root}"
    Castronaut.logger.debug "Sinatra Config - setting views path to #{views}"
    Castronaut.logger.debug "Sinatra Config - setting public path to #{pub_dir}"

    set :root,          root
    set :views,         views
    set :static,        true
    set :public,        pub_dir
    set :logging,       true
    set :raise_errors,  true
    
    set :environment,   Castronaut.config.environment.to_sym
    set :run,           false
    set :raise_errors,  true
    set :logging,       true
    set :port,          (Castronaut.config.respond_to?(:server_port) ? Castronaut.config.server_port : Sinatra::Application.default_options[:port])
  end
  
  get '/' do
    redirect '/login'
  end

  get '/login' do
    no_cache
    @presenter = Castronaut::Presenters::Login.new(self)
    @presenter.represent!
    @presenter.your_mission.call
  end

  post '/login' do
    @presenter = Castronaut::Presenters::ProcessLogin.new(self)
    @presenter.represent!
    @presenter.your_mission.call
  end

  get '/logout' do
    @presenter = Castronaut::Presenters::Logout.new(self)
    @presenter.represent!
    @presenter.your_mission.call
  end

  get '/serviceValidate' do
    @presenter = Castronaut::Presenters::ServiceValidate.new(self)
    @presenter.represent!
    @presenter.your_mission.call
  end

  get '/proxyValidate' do
    @presenter = Castronaut::Presenters::ProxyValidate.new(self)
    @presenter.represent!
    @presenter.your_mission.call
  end

  private

  def no_cache
    response.headers.merge! 'Pragma' => 'no-cache',
    'Cache-Control' => 'no-store',
    'Expires' => (Time.now - 5.years).rfc2822
  end
  
  
end