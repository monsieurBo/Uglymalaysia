class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t.boolean :vote
    	t.references :user, index: true
    	t.references :article, index:true

    end
  end
end
