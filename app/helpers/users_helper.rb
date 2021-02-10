module UsersHelper
  def set_user
    @user = User.find(params[:id])
  end

  def start_session(user)
    if user
      session[:user_id] = user.id
      redirect_to user_path(current_user.id), notice: "User #{user.name} account signed up successfully!"
    else
      flash.now[:alert] = "Username is invalid"
    end
  end

  def render_invitation_table(user)
    html_out = ''
    html_out << "<table class=\"table table-hover text-center align-middle\">
              <tbody><th>Name</th><th>Status</th><th>Action</th>
              <% @users.reject { |user| user == Event.find(params[:event_id]).creator }.each do |user| %>
              <% @event_enrolment = EventEnrolment.find_by(event_id: params[:event_id], user_id: user.id) %>
              <tr><td><%= user.name %></td>
              <% unless @event_enrolment.nil? || @event_enrolment.nil? %><td>
              <span class=\"tag is-primary is-medium is-light\"><%= @event_enrolment %></span>
              </td><% else %><td></td><% end %><% if @event_enrolment.nil? %><td>
              <%= button_to \"Invite\", event_enrolment_index_path(event_id: params[:event_id],
                               user_id: user.id), class: \"btn btn-sm btn-secondary w-75\" %>
              </td><% else %><td><%= button_to \"Cancel Invitation\", event_enrolment_path(id: @event_enrolment.id,
                       event_id: params[:event_id]), method: :delete, class: \"btn btn-sm btn-danger w-75 m-0\" %>
              </td><% end %></tr><% end %></tbody></table>
          <%= link_to 'Back', event_path(id: params[:event_id]), class: \"btn btn-light w-100 my-3\" %>"
    render inline: html_out, locals: { user: user }
  end

end
