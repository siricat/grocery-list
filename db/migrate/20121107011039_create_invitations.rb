class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string      :email
      t.text        :note
      t.text        :role
      t.integer     :inviter_id
      t.integer     :invitee_id
      t.integer     :invitation_id
      t.references  :list
      t.timestamps
    end
  end
end
