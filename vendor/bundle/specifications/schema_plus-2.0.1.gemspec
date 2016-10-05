# -*- encoding: utf-8 -*-
# stub: schema_plus 2.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "schema_plus"
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ronen Barzel", "Michal Lomnicki"]
  s.date = "2016-03-24"
  s.description = "SchemaPlus is a gem that simply pulls in a collection of other gems from the SchemaPlus family of ActiveRecord extensions"
  s.email = ["ronen@barzel.org", "michal.lomnicki@gmail.com"]
  s.homepage = "https://github.com/SchemaPlus/schema_plus"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubyforge_project = "schema_plus"
  s.rubygems_version = "2.5.1"
  s.summary = "Wrapper that pulls in many gems from the SchemaPlus family of ActiveRecord extensions"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 4.2"])
      s.add_runtime_dependency(%q<schema_auto_foreign_keys>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_core>, ["~> 1.0"])
      s.add_runtime_dependency(%q<schema_monkey>, ["~> 2.1"])
      s.add_runtime_dependency(%q<schema_plus_columns>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_enums>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_db_default>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_default_expr>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_foreign_keys>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_indexes>, [">= 0.1.3", "~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_pg_indexes>, [">= 0.1.3", "~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_tables>, ["~> 0.1"])
      s.add_runtime_dependency(%q<schema_plus_views>, ["~> 0.1"])
      s.add_development_dependency(%q<schema_dev>, ["~> 3.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-profile>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 4.2"])
      s.add_dependency(%q<schema_auto_foreign_keys>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_core>, ["~> 1.0"])
      s.add_dependency(%q<schema_monkey>, ["~> 2.1"])
      s.add_dependency(%q<schema_plus_columns>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_enums>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_db_default>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_default_expr>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_foreign_keys>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_indexes>, [">= 0.1.3", "~> 0.1"])
      s.add_dependency(%q<schema_plus_pg_indexes>, [">= 0.1.3", "~> 0.1"])
      s.add_dependency(%q<schema_plus_tables>, ["~> 0.1"])
      s.add_dependency(%q<schema_plus_views>, ["~> 0.1"])
      s.add_dependency(%q<schema_dev>, ["~> 3.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<simplecov-gem-profile>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 4.2"])
    s.add_dependency(%q<schema_auto_foreign_keys>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_core>, ["~> 1.0"])
    s.add_dependency(%q<schema_monkey>, ["~> 2.1"])
    s.add_dependency(%q<schema_plus_columns>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_enums>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_db_default>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_default_expr>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_foreign_keys>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_indexes>, [">= 0.1.3", "~> 0.1"])
    s.add_dependency(%q<schema_plus_pg_indexes>, [">= 0.1.3", "~> 0.1"])
    s.add_dependency(%q<schema_plus_tables>, ["~> 0.1"])
    s.add_dependency(%q<schema_plus_views>, ["~> 0.1"])
    s.add_dependency(%q<schema_dev>, ["~> 3.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<simplecov-gem-profile>, [">= 0"])
  end
end
