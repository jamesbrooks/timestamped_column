require "timestamped_column/version"
require "timestamped_column/active_record/timestamped_column"

module TimestampedColumn
  ActiveRecord::Base.send :include, ActiveRecord::TimestampedColumn
end
