module MailForm
  class Base
    include ActiveModel::AttributeMethods
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::Validations

    class_attribute :_attributes
    self._attributes = []

    attribute_method_prefix 'clear_'
    attribute_method_suffix '?'

    def initialize(attributes = {})
      attributes.each do |attr, value|
        self.send("#{attr}=", value)
      end unless attributes.blank?
    end

    def self.attributes(*names)
      attr_accessor *names
      define_attribute_methods names
      self._attributes += names
    end

    def attributes
      self._attributes.inject({}) do |hash, attr|
        hash[attr.to_s] = send(attr)
        hash
      end
    end

    def persisted?
      false
    end

    def deliver
      if valid?
        MailForm::Notifier.contact(self).deliver
      else
        false
      end
    end

    protected

    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribtue?(attribute)
      send(attribute).present?
    end
  end
end
