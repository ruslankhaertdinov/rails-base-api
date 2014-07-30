class ApiResponder < ActionController::Responder
  def api_behavior(error)
    puts resource

    display_errors unless resourceful?

    #if get?
    #  display resource
    #elsif post?
    #  display resource, status: :created, location: nil
    #else
    #  head :no_content
    #end
  end

  def display_errors
    controller.render_validation_error resource_errors
  end
end
