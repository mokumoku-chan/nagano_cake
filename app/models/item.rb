class Item < ApplicationRecord

 belongs_to :genres
 attachment :image

 enum is_active: { sale: 0, stop_selling: 1}

end
