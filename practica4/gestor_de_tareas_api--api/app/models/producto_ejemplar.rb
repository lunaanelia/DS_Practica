class ProductoEjemplar < ApplicationRecord
  belongs_to :producto
  belongs_to :ejemplar
end
