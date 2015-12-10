module Minican
  module ControllerHelpers

    # if defined?(Rails)
    #   def self.included(klass)
    #     class << klass
    #       helper_method :user_can?, :user_is?, :user_is_not?
    #     end
    #   end
    # end

    def user_can?(action, model)
      if user_signed_in?
        current_user.can? action, model
      else
        User.can? action, model, nil
      end
    end

    def user_is?(action, model)
      if user_signed_in?
        current_user.is? action, model
      else
        User.is? action, model, nil
      end
    end

    def user_is_not?(action, model)
      !user_is?(action, model)
    end

    def ensure_user_can!(action, model)
      raise Minican::NotAllowedError.new(action, model) unless user_can?(action, model)
    end

    def ensure_user_is!(action, model)
      raise Minican::UserRoleMismatchError.new(action, model) unless user_is?(action, model)
    end

  end
end
