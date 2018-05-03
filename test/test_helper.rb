$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'event_loop'

require 'minitest/autorun'

unless Time.respond_to?(:__original_now)
  Time.instance_eval do
    class << self
      attr_accessor :__frozen_now
      alias_method :__original_now, :now

      def now
        __frozen_now || __original_now
      end
    end
  end
end

