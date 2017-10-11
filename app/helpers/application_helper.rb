module ApplicationHelper
    def paginate(collection, params= {})
        will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
    end
    
    def sorted(column, title=nil)
      title ||= column.upcase
      direction = column == sort_column && sort_direction== 'desc' ? "asc" : "desc"
      link_to title, :sort => column, :direction => direction
    end



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

