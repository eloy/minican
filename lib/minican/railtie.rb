module Minican
  class Railtie < ::Rails::Railtie
    initializer "minican.configure_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include Minican::ControllerHelpers
      end

      # ActionController::Base.send :include, Minican::ControllerHelpers
      ActionView::Base.send :include, Minican::ControllerHelpers
      ActiveSupport.on_load(:active_record) do
        include Minican::ModelHelpers
      end
    end
  end
end
