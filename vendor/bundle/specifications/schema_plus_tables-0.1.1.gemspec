# -*- encoding: utf-8 -*-
# stub: schema_plus_tables 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "schema_plus_tables"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["ronen barzel"]
  s.date = "2016-03-24"
  s.email = ["ronen@barzel.org"]
  s.homepage = "https://github.com/SchemaPlus/schema_plus_tables"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Extends ActiveRecord's handling of tables"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 4.2"])
      s.add_runtime_dependency(%q<schema_plus_core>, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-given>, [">= 0"])
      s.add_development_dependency(%q<schema_dev>, ["~> 3.6"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-profile>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 4.2"])
      s.add_dependency(%q<schema_plus_core>, ["~> 1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-given>, [">= 0"])
      s.add_dependency(%q<schema_dev>, ["~> 3.6"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<simplecov-gem-profile>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 4.2"])
    s.add_dependency(%q<schema_plus_core>, ["~> 1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-given>, [">= 0"])
    s.add_dependency(%q<schema_dev>, ["~> 3.6"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<simplecov-gem-profile>, [">= 0"])
  end
end
