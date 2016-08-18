class CreateAptitudes < ActiveRecord::Migration[5.0]
  def change
    create_table :aptitudes do |t|
      t.references :player, index: true
      t.references :skill, class_name: 'Templates::Skill', index: true

      t.timestamps
    end
  end
end
