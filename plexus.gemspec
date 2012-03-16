# -*- encoding: utf-8 -*-
require './lib/plexus/version'

Gem::Specification.new do |s|
  s.name = %q{plexus}
  s.version = Plexus::VERSION
  s.authors = ["Bruce Williams", "Jean-Denis Vauguet <jd@vauguet.fr>"]
  s.summary = "A framework for graph data structures and algorithms."
  s.description = %q{This library is based on GRATR and RGL.

Graph algorithms currently provided are:

* Topological Sort
* Strongly Connected Components
* Transitive Closure
* Rural Chinese Postman
* Biconnected
}
  s.email = %q{jd@vauguet.fr}
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + Dir["spec/**/*"] + ["Gemfile", "LICENSE", "Rakefile", "README.md"]
  s.homepage = %q{http://github.com/chikamichi/plexus}
  s.add_dependency "rake"
  s.add_dependency "activesupport"
  s.add_dependency "facets"
  s.add_development_dependency "rspec"
  s.add_development_dependency "yard"
end

