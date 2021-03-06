module ApplicationHelper



def sortable(column, pagesize, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction, :pagesize => pagesize}, {:class => css_class}
end


def pagination(column, pagesize, title = nil)
		sortable(column, pagesize, title)
end

end
