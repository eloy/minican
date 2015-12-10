module Minican

  class NotAllowedError < StandardError
    attr_reader :action, :model
    def initialize(action, model)
      @action = action
      @model = model
      super()
    end
  end

  class UserRoleMismatchError < NotAllowedError
  end

end
