class CreateLdapManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :ldap_managers do |t|

      t.timestamps
    end
  end
end
