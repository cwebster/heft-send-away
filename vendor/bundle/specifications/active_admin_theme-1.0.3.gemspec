# -*- encoding: utf-8 -*-
# stub: active_admin_theme 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "active_admin_theme"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Igor Fedoronchuk", "Alex Sikorskiy"]
  s.date = "2015-11-19"
  s.description = "Flat design for activeadmin gem "
  s.email = ["igor.f@didww.com", "alex.s@didww.com"]
  s.homepage = "https://github.com/didww/active_admin_theme"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Flat design for ActiveAdmin"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end
