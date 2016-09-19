# -*- encoding: utf-8 -*-
# stub: active_admin_import_anything 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "active_admin_import_anything"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Trevor Kimenye"]
  s.date = "2013-11-11"
  s.description = "Import any type of file via a collection action"
  s.email = ["trevor@sprout.co.ke"]
  s.homepage = "http://github.com/kimenye/active_admin_import_anything"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Import any type of file via a collection action. Unlike active_admin_importable which only handles csv"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
