# -*- encoding : utf-8 -*-
module PlaceHelper

def type_find (id)
    @type = Type.find(id)
  end
end