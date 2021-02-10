module EventsHelper
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :date, :user_id)
  end

  def render_controls(event)
    if current_user && event.creator.id == current_user.id
      @@html_out = ''
      @@html_out << "<%= link_to event do %>
          <i class=\"fas fa-link\"></i>
        <% end %>
        <%= link_to edit_event_path(event) do %>
          <i class=\"far fa-edit\"></i>
        <% end %>
        <%= link_to event, method: :delete, data: { confirm: 'Are you sure?' } do %>
          <i class=\"fas fa-trash\"></i>
        <% end %>"
      render inline: @@html_out, locals: { event: event }
    end
  end

  def render_index_events(related_events)
    if related_events
      title = 'Upcoming Events' if related_events == @upcoming_events
      title = 'Past Events' if related_events == @past_events
      render 'events/partials/event_index', related_events: related_events, title: title
    end
  end

  def render_invite_controls(event)
    render 'events/partials/invite_controls', event: event if event.creator == current_user
  end

  def creator?
    set_event
    return if current_user.id == @event.user_id

    flash[:alert] = 'Unauthorized request'
    redirect_to root_path
  end
end
