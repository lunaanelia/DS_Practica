class ProductoAutor < ApplicationRecord
  belongs_to :producto
  belongs_to :autor
end
