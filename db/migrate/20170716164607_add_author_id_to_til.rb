ROM::SQL.migration do
  up do
    alter_table(:tils) do
      add_foreign_key :author_id, :authors
      add_index :author_id
    end
  end

  down do
    alter_table(:tils) do
      drop_foreign_key :author_id
    end
  end
end
