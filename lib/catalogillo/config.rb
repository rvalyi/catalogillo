require 'singleton'
module Catalogillo
  class Config
    include Singleton
    attr_accessor :per_page, :page
    def initialize
      @per_page = 50
      @page = 1
    end

    class << self
      def method_missing method, *args
        if instance.respond_to? method
          instance.send(method, *args)
        else
          super(method, *args)
        end
      end
    end
  end
end