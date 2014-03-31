class ChangeDateColumnsReports < ActiveRecord::Migration
  def up
  	change_table :reports do |t|
      t.change :start_date, :string
      t.change :end_date, :string
    end
  end

  def down
  	change_table :reports do |t|
      t.change :start_date, :date
      t.change :end_date, :date
    end
  end
end
