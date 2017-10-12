module ApplicationHelper
    def sorted(column, title=nil)
      title ||= column.upcase
      direction = column == sort_column && sort_direction == "DESC" ? "ASC" : "DESC"
      link_to title, :sort => column, :direction => direction
    end
end