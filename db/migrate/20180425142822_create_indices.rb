class CreateIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :indices do |t|
      t.string :name
      t.string :givenName
      t.string :sn
      t.string :displayName
      t.string :description
      t.string :physicalDeliveryOfficeName
      t.string :telephoneNumber
      t.string :mail
      t.string :title
      t.string :department
      t.string :company
      t.string :ipphone
      t.string :mobile
      t.string :homephone
      t.string :photo
      t.boolean :cloudUser
      t.boolean :usbUser
      t.boolean :userit
      t.string :sAMAccountName
      t.boolean :registered

      t.timestamps
    end
  end
end
