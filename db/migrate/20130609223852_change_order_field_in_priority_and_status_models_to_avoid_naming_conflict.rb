class ChangeOrderFieldInPriorityAndStatusModelsToAvoidNamingConflict < ActiveRecord::Migration
  def change
    rename_column  :statuses, :order, :status_order
    rename_column  :priorities, :order, :priority_order
  end
end
