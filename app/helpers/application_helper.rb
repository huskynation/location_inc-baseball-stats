module ApplicationHelper
    def paginate(collection, params= {})
        will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
    end
    
    def sort_column(column, title=nil)
      title ||= column.upcase
      direction = column == params[:sort] && params[:direction] == 'ASC' ? "DESC" : "ASC"
      link_to title, :sort => column, :direction => direction
    end
end
