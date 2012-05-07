module ActiveRecord
  # = Active Record Column Timestamp
  #
  # Automatically timestamps when particular attributes (columns) have been changed
  # if the table has fields suffixed with <tt>_updated_at/_updated_on</tt>
  #
  # Example: A table with a field <tt>user_name</tt> would have it's modification time
  # recorded if a field named <tt>user_name_updated_at</tt> exists.
  module TimestampedColumn
  private
    def create(*args) #:nodoc:
      update_timestamp_attributes
      super
    end

    def update(*args) #:nodoc:
      update_timestamp_attributes
      super
    end

    def update_timestamp_attributes #:nodoc:
      current_time = current_time_from_proper_timezone

      timestamped_attributes_in_model.each do |attribute, timestamp_attribute|
        if attribute_changed?(attribute)
          write_attribute(timestamp_attribute, current_time)
        end
      end
    end

    def timestamped_attributes_in_model #:nodoc:
      {}.tap do |timestamped_attributes|
        self.class.column_names.each do |column|
          if attribute = timestamp_attribute_for_column(column)
            timestamped_attributes[column] = attribute
          end
        end
      end
    end

    def timestamp_attribute_for_column(column) #:nodoc:
      self.class.column_names.detect { |c| %r{(#{possible_timestamp_attributes_for_column(column).join('|')})$} =~ c }
    end

    def possible_timestamp_attributes_for_column(column) #:nodoc:
      column_timestamp_attribute_suffixes.map { |suffix| [ column, suffix].join }
    end

    def column_timestamp_attribute_suffixes #:nodoc:
      ['_updated_at', '_updated_on']
    end

    def current_time_from_proper_timezone # from ActiveRecord::Timestamp
      self.class.default_timezone == :utc ? Time.now.utc : Time.now
    end
  end
end
