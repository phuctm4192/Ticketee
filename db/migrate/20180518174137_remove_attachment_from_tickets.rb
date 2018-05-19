class RemoveAttachmentFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :attachment, :string
  end
end
