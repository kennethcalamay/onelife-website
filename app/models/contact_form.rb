require 'mail'
require 'mail_form'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      m = Mail::Address.new(value)
      r = m.domain && m.address == value
      t = m.__send__(:tree)
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e
      r = false
    end
    record.errors[attribute] << (options[:message] || "is invalid") unless r
  end
end

class ContactForm < MailForm::Base
  attributes :name, :email, :subject, :message

  validates :email, :email => true
  validates :name, :email, :subject, :message, :presence => true

  def headers
    {
      :to => "\"1Life Contact Form\" <onelife@kennethcalamay.com>",
      :cc => ["\"Sammy\" <jowenaolivete03@gmail.com>", "\"Selle\" <smartinez@eperformax.com>", "\"Selle\" <prosellemartinez@hotmail.com>", "\"Vladi\" <paulvlady@yahoo.com>", "\"Vladi\" <vladimer.dungo@unilever.com>"],
      :subject => self.subject,
      :from => "\"#{self.name}\" <#{self.email}>",
      :body => self.message
    }
  end
end
