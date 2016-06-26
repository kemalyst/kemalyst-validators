require "./kemalyst-validators/*"

module Kemalyst::Validators
  property errors = [] of String

  macro included
    @@validators = Array({message: String, block: Proc(self, Bool)}).new
  end

  macro validate(message, block)
    @@validators << {message: {{message}}, block: {{block}}}
  end
    
  def valid?
    @@validators.each do |validator|
      unless validator[:block].call(self)
        errors << validator[:message]
      end
    end
    errors.empty?
  end
end
