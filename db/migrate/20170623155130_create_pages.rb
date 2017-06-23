class CreatePages < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'

    create_table :pages do |t|
      t.string :url, null: false
      t.jsonb :content, null: false, default: '{}'
    end

    add_index  :pages, :content, using: :gin
  end
end
