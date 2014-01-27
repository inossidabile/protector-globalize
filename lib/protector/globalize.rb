require 'protector/globalize/version'
require 'protector'
require 'globalize'

module Globalize
  module ActiveRecord
    class Adapter
      def save_translations_with_protector!
        Protector.insecurely do
          save_translations_without_protector!
        end
      end

      alias_method_chain :save_translations!, :protector
    end
  end
end