class CreatePocos < ActiveRecord::Migration[7.0]
  def up
    create_table :pocos do |t|
      t.string :endereco
      t.string :complemento
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :lat
      t.string :long
      t.boolean :res
      t.timestamps
    end
  end

  def down
    drop_table :pocos
  end
end
