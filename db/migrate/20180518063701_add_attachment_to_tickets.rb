class AddAttachmentToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :attachment, :string
  end
end
