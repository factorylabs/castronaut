require 'uri'
require 'net/https'

module Castronaut
  module Models

    class ServiceTicket < ActiveRecord::Base
      include Castronaut::Models::Consumeable
      include Castronaut::Models::Dispenser
      
      before_validation :dispense_ticket, :if => :new_record?
      validates_presence_of :ticket, :client_hostname, :service, :username

      def self.generate_ticket_for(service, ticket_result)
        # service
        # ticket_result
        # ticket = ticket_result.ticket
        # username = ticket_result.username
      end

      # Note: URI.parse is prone to throwing up exceptions if it doesn't like what it sees.
      def service_uri
        begin
          raw_uri = URI.parse(service)

          if service.include? "?"
            if raw_uri.query.empty?
              query_separator = ""
            else
              query_separator = "&"
            end
          else
            query_separator = "?"
          end

          "#{service}#{query_separator}ticket=#{ticket}"
        rescue URI::InvalidURIError
          nil
          # TODO: Log message
        end
      end

      private
        def set_ticket
          write_attribute :ticket, "ST-#{Castronaut::Utilities::RandomString.generate}"
        end
    end

  end
end
