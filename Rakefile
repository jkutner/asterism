# This file is part of the Asterism project.
#
# This application is free software; you can redistribute it and/or
# modify it under the terms of the GNU license defined in the
# LICENSE.txt file.
#
# Copyright (c) 2011 Joe Kutner. All rights reserved.
#
# * Authors:  Joe Kutner

require 'rubygems'

require 'rake'
require 'rake/clean'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'rake/rdoctask'

require 'spec/rake/spectask'

spec = Gem::Specification.new do |s|

  s.name = "asterism"
  s.version = "0.1"
  s.authors = ["Joe Kutner"]
  s.email = 'jpkutner@gmail.com'
  s.homepage = "https://github.com/jkutner/asterism"
  s.summary = "JRuby Concurrency with Akka"
  s.license = "GPL3"
  s.extra_rdoc_files = ["LICENSE.txt", "GPL.txt"]
  s.require_paths = ["lib"]
  s.has_rdoc          = true
  s.rubyforge_project = 'asterism'
  s.description = <<EOF
Asterism provides a Ruby friendly wrapper for the Akka library.  Thus, it only runs on the
Java Virtual Machine using JRuby.
EOF

  #[ 'other-gem', 'yet-another-gem' ].each do |d|
  #    s.requirements << d
  #    s.add_dependency d
  #end

  files = FileList["{lib}/**/*"]
  s.files = files.to_a
end

Rake::GemPackageTask.new(spec) do |pkg|
  #pkg.need_tar = true
end

Rake::RDocTask.new do |rd|

  rd.rdoc_files.include(
      "LICENSE.txt",
      "GPL.txt",
      "lib/**/*.rb")

  rd.title = "asterism rdoc"

  rd.options << '-N' # line numbers
  rd.options << '-S' # inline source

end