class AddAddressToGolfcourses < ActiveRecord::Migration[6.1]
  def change
    add_column :golfcourses, :address, :string
    add_column :golfcourses, :latitude, :float
    add_column :golfcourses, :longitude, :float
  end
end
