ROM::SQL.migration do
  change do
    create_table(:authors) do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false
      column :created_at, DateTime,  null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP

      index :name
    end
  end
end
