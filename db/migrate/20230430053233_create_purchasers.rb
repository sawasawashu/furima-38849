class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.timestamps
    end
  end
end
