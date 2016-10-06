require 'schema_plus/columns'
require 'schema_plus/db_default'
require 'schema_plus/default_expr'
require 'schema_plus/enums'
require 'schema_plus/foreign_keys'
require 'schema_plus/indexes'
require 'schema_plus/tables'
require 'schema_plus/views'
require 'schema_plus_pg_indexes'
require 'schema_auto_foreign_keys'

require_relative 'schema_plus/version'

module SchemaPlus
  class DeprecatedConfig
    def foreign_keys
      SchemaPlus::ForeignKeys.config
    end
  end

  def self.setup # :yields: config
    ActiveSupport::Deprecation.warn "SchemaPlus.setup is deprecated.  Use SchemaPlus::ForeignKeys.setup instead"
    yield DeprecatedConfig.new
  end
end
