class AddUserIdToDelivery < ActiveRecord::Migration
  def up
    add_column :deliveries, :user_id, :integer

    Delivery.all.each do |delivery|
      delivery.update_attribute :user_id, delivery.task_subscription.user_id
    end
  end

  def down
    remove_column :deliveries, :user_id
  end
end
