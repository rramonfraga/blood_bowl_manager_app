class CreateTemplatesSkills < ActiveRecord::Migration
  def change
    create_table :templates_skill, class_name: 'Templates::Skill' do |t|
      t.string  :name
      t.string  :category
      t.text    :description
      
      t.timestamps null: false
    end
  end
end
