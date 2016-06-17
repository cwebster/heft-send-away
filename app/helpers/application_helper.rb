module ApplicationHelper
  def authorised?
#   need to add some autorisation code here. User should be admin or that laboratories manager
    TRUE
  end
  
      def is_active_controller(controller_name)
        params[:controller] == controller_name ? "active" : nil
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end
end
