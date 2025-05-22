class Prestamo < ApplicationRecord
  belongs_to :ejemplar
  belongs_to :user
end
