# -*- encoding: utf-8 -*-
# stub: prawn-labels 1.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "prawn-labels"
  s.version = "1.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jordan Byron"]
  s.date = "2016-08-02"
  s.description = "  Prawn/Labels takes the guess work out of generating labels using Prawn\n"
  s.email = ["jordan.byron@gmail.com"]
  s.extra_rdoc_files = ["README.md", "LICENSE", "COPYING"]
  s.files = ["COPYING", "LICENSE", "README.md"]
  s.homepage = "http://github.com/jordanbyron/prawn-labels"
  s.rdoc_options = ["--title", "Prawn/Labels Documentation", "--main", "README.md", "-q"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "prawn-labels"
  s.rubygems_version = "2.5.1"
  s.summary = "Make labels using Prawn"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<prawn>, ["< 3.0.0", ">= 1.0.0"])
    else
      s.add_dependency(%q<prawn>, ["< 3.0.0", ">= 1.0.0"])
    end
  else
    s.add_dependency(%q<prawn>, ["< 3.0.0", ">= 1.0.0"])
  end
end
