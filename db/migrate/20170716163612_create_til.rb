ROM::SQL.migration do
  change do
    create_table :tils do
      primary_key :id

      column :title, String, null: false
      column :text, 'text', null: false
      column :created_at, DateTime,  null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
