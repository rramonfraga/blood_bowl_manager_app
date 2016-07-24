class Api::Templates::TeamSerializer < ActiveModel::Serializer
  attributes :id, 
    :name, 
    :description, 
    :reroll_value, 
    :apothecary, 
    :stakes, 
    :revive

  has_many :players, class_name: 'Templates::Player'

end