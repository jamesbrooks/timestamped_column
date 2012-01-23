module TimestampedColumn::ActiveRecord
  extend ActiveSupport::Concern

  included do
    before_save    :update_timestamped_column_times
    cattr_accessor :timestamped_columns
  end

  module ClassMethods
    def timestamped_column(column, opts={})
      timestamp_column = opts[:column] || "#{column}_updated_at"

      self.timestamped_columns ||= {}
      self.timestamped_columns[column] = timestamp_column
    end
  end

  module InstanceMethods
  private
    def update_timestamped_column_times
      if self.timestamped_columns && changes.any?
        self.timestamped_columns.each do |column, timestamp_column|
          if changes[column.to_s]
            send "#{timestamp_column}=", Time.zone.now
          end
        end
      end
    end
  end
end

class ActiveRecord::Base
  include TimestampedColumn::ActiveRecord
end
