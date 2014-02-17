require 'protector/globalize/version'
require 'globalize'
require 'protector'

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

    module InstanceMethods
      def read_attribute_with_protector(name, options = {})
        return nil if protector_subject? && !can?(:read, name)

        Protector.insecurely do
          read_attribute_without_protector(name, options)
        end
      end

      alias_method_chain :read_attribute, :protector
    end
  end
end