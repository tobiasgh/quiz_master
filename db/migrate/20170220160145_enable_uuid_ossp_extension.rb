class EnableUuidOsspExtension < ActiveRecord::Migration[5.0]
  def change
    execute 'create extension "uuid-ossp"'
    enable_extension 'uuid-ossp'
  end
end
