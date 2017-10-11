module ApplicationHelper
    def sorted(column, title=nil)
      title ||= column.upcase
      direction = column == sort_column && sort_direction== 'desc' ? "asc" : "desc"
      link_to title, :sort => column, :direction => direction
    end
end