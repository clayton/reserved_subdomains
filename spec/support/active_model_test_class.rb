require 'active_support'
require 'active_support/core_ext/module/delegation'
require 'active_model/naming'
require 'active_model/errors'
require 'active_model/translation'
require 'active_model/validations'
require 'active_model/callbacks'

class ActiveModelTestClass
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  attr_accessor :subdomain, :other_attribute
  validates :subdomain, allowed_subdomain: true

  def self.name
    'ActiveModelTestClass'
  end
end