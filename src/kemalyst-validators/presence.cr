# WIP
module Kemalyst::Validators
  abstract class Validator
  end

  class Presence < Validator
    def self.validate(value, field)
      return -> (value, field) { obj != null ? "#{field} is required" : nil }
    end
  end
end
