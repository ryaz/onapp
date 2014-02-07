module ApplicationHelper
  def nav_link(text, status)
    content_tag :li, class: "#{'active' if params[:status] == status}" do
      link_to text, tickets_path(status: status)
    end
  end
end
