class CreateTemplatesAbilities < ActiveRecord::Migration
  def change
    create_table :templates_ability, class_name: 'Templates::Ability' do |t|
      t.references :player, class_name: 'Templates::Player', index: true
      t.references :skill, class_name: 'Templates::Skill', index: true

      t.timestamps null: false
    end
  end
end
