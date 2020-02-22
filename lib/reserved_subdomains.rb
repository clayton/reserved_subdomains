require "reserved_subdomains/version"
require 'active_model/validator'
require 'active_support/core_ext/object/blank'
require "yaml"

module ActiveModel
  module Validations
    class AllowedSubdomainValidator < ::ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        if value.present? && ( exists_in_reserved_list(value) || matches_regexp_list(value))
          record.errors.add(attribute, "invalid_#{attribute}".to_sym)
        end
      end

      private

      def load_list(file)
        shared_path = File.dirname(__FILE__)
        YAML.load_file(File.join(shared_path, file))
      end

      def exists_in_reserved_list(value)
        list = load_list('reserved_subdomains_list.yml')
        list.include?(value)
      end

      def matches_regexp_list(value)
        list = load_list('regexp_list.yml')
        list.each do |regexp|
          return true unless value.match(regexp).nil?
        end
      end
    end

  end
end
