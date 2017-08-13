ROM::SQL.migration do
  up do
    alter_table(:authors) do
      add_column :avatar_data, String
    end
  end

  down do
    alter_table(:authors) do
      drop_column :avatar_data
      drop_index :email
    end
  end
end
