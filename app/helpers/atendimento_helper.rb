# -*- encoding : utf-8 -*-
module AtendimentoHelper

  def check_cookie
    if cookies[:place_name]
      place_selected =  Place.where('active' => true, 'name' => cookies[:place_name])
    else
      place_selected = Place.where('active' => true)
    end
    place_selected

  end
end
