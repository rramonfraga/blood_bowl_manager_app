class Api::Templates::PlayerSerializer < ActiveModel::Serializer
  attributes :id, 
    :quantity, 
    :title, 
    :cost, 
    :ma, 
    :st, 
    :ag, 
    :av, 
    :normal, 
    :double, 
    :feeder

  has_many :skills, class_name: 'Templates::Skill', through: :abilities
    
end