module Minican

  def self.callback_name(klass, action, verb="can")
    model_prefix = klass.name.underscore
    "#{verb}_#{model_prefix}_#{action}?"
  end

  module ModelHelpers


    def self.included(klass)
      class << klass
        def can?(action, model, instance=nil)
          method_name = Minican::callback_name(self, action, "can")
          model.send method_name, instance
        end

        def is?(action, model, instance=nil)
          method_name = Minican::callback_name(self, action, "is")
          model.send method_name, instance
        end

      end
    end


    def can?(action, model=nil)
      method_name = Minican::callback_name(self.class, action, "can")
      if model.nil?
        self.send method_name
      else
        model.send method_name, self
      end
    end

    def cannot?(action, model=nil)
      !can?(action, model)
    end

    def is?(action, model=nil)
      method_name = Minican::callback_name(self.class, action, "is")
      if model.nil?
        self.send method_name
      else
        model.send method_name, self
      end
    end

    def is_not?(action, model)
      !is?(action, model)
    end

    def minican_errors
      @minican_errors ||= { }
    end

    def add_minican_error(action, message)
      minican_errors[action] ||= []
      minican_errors[action].push message
      false
    end

    def minican_errors_full
      minican_errors.values.join("\n")
    end

  end
end
