module ApplicationHelper
    def paginate(collection, params= {})
        will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
    end
    
    def sort_column(column, title=nil)
      title ||= column.upcase
      direction = column == params[:sort] && params[:direction] == 'ASC' ? "DESC" : "ASC"
      link_to title, :sort => column, :direction => direction
    end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
end

