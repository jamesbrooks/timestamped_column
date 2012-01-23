Time-stamped Column
===================

Records modified time for individual columns.

Usage (in a model)
------------------

`timestamped_column :email_address`

Records the most recent modification time of `:email_address` to `:email_address_updated_at` (defaults to `name_updated_at`)


`timestamped_column :email_address, :column => :email_address_changed_at`

Records the most recent modification time of `:email_address` to `:email_address_changed_at`
