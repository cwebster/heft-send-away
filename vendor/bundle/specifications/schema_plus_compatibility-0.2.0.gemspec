# -*- encoding: utf-8 -*-
# stub: schema_plus_compatibility 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "schema_plus_compatibility"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["ronen barzel", "boaz yaniv"]
  s.date = "2016-09-11"
  s.description = "Compatibility helpers for the SchemaPlus family of gems"
  s.email = ["ronen@barzel.org", "boazyan@gmail.com"]
  s.homepage = "https://github.com/SchemaPlus/schema_plus_compatibility"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Compatibility helpers for the SchemaPlus family of gems"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 5.1", ">= 4.2"])
      s.add_runtime_dependency(%q<schema_monkey>, ["~> 2.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<schema_dev>, ["~> 3.5"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<simplecov-gem-profile>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["< 5.1", ">= 4.2"])
      s.add_dependency(%q<schema_monkey>, ["~> 2.1"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<schema_dev>, ["~> 3.5"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<simplecov-gem-profile>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 5.1", ">= 4.2"])
    s.add_dependency(%q<schema_monkey>, ["~> 2.1"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<schema_dev>, ["~> 3.5"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<simplecov-gem-profile>, [">= 0"])
  end
end