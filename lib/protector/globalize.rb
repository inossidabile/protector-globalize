require 'protector/globalize/version'
require 'globalize'
require 'protector'


module GlobalizeWithProtector
  module Adapter
    def save_translations!
      Protector.insecurely do
        super
      end
    end
  end

  module InstanceMethods
    def read_attribute(name, options = {})
      return nil if protector_subject? && !can?(:read, name)

      Protector.insecurely do
        super
      end
    end
  end

  module Base
    def destroy
      return super unless protector_subject?
      return super unless self.class.method_defined?(:translations)

      self.transaction do
        Protector.insecurely do
          self.translations.destroy_all
        end
        ret = super
        if ret
          return ret
        else
          raise ActiveRecord::Rollback
          return false
        end
      end
    end
  end

end

Globalize::ActiveRecord::Adapter.send :prepend, GlobalizeWithProtector::Adapter
Globalize::ActiveRecord::InstanceMethods.send :prepend, GlobalizeWithProtector::InstanceMethods
ActiveRecord::Base.send :prepend, GlobalizeWithProtector::Base