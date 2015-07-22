# -*- encoding : utf-8 -*-
module PlaceHelper

def type_find (id)
    @type = Type.find(id)
  end
end

def check_name_place
	place_name = place_client("none")

	place_name.force_encoding("UTF-8")
end