Dir[File.dirname(__FILE__) + "/../vendor/**"].each do |dir| 
  $LOAD_PATH.unshift(File.directory?(lib = "#{dir}/lib") ? lib : dir)
end

require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'castronaut'))

default_config = File.expand_path("config/castronaut.yml")

if File.exist?(default_config)
  Castronaut.config = Castronaut::Configuration.load(default_config)
else
  STDERR.puts "Unable to locate configuration.  Currently looking at #{default_config}."
end

require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'castronaut', 'application', 'application'))

# Castronaut::Application.default_options.merge!(
#   :run => false,
#   :env => :production
# )

run Castronaut::Application.new
