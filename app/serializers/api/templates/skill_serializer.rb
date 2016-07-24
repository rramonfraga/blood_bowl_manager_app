class Api::Templates::SkillSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :category,
    :description

end