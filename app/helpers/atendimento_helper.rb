# -*- encoding : utf-8 -*-
module AtendimentoHelper

  def check_place
  	place_name = place_client("none")
    place_selected =  Place.where(active: true, name: place_name.chomp)
   

    place_selected
  end
end
