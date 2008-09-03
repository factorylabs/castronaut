require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

$LOAD_PATH.unshift(File.dirname(__FILE__) + '../vendor/sinatra/lib')

require 'sinatra'

Sinatra::Application.default_options.merge!(
  :env => :test,
  :run => false,
  :raise_errors => true,
  :logging => false
)

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'application'))
require 'sinatra/test/unit'
