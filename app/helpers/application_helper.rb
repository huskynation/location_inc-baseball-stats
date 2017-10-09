module ApplicationHelper
    def paginate(collection, params= {})
        will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
    end
    
    def sorted(column, title=nil)
      title ||= column.upcase
      direction = column == sort_column && sort_direction== 'ASC' ? "DESC" : "ASC  "
      link_to title, :sort => column, :direction => direction
    end
end
