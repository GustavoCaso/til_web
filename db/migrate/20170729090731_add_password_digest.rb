ROM::SQL.migration do
  up do
    alter_table(:authors) do
      add_column :password_digest, String, null: false
      add_index :email, unique: true
    end
  end

  down do
    alter_table(:authors) do
      drop_column :password_digest
      drop_index :email
    end
  end
end
