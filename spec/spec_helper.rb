require File.expand_path("../../lib/plexus.rb",  __FILE__)

require 'plexus'
include Plexus

module AncestryHelper
  # "Algorithmic Graph Theory and Perfect Graphs", Martin Charles
  # Golumbic, 1980, Academic Press, page 38, Figure 2.6
  def assign_dfsnumber_ancestry(graph, dfsnumber, father, start)
    i = 0
    dfsnumber.clear
    father.clear
    ev = Proc.new {|v| dfsnumber[v]     = (i+=1)   }
    te = Proc.new {|e| father[e.target] = e.source }
    graph.dfs({:enter_vertex => ev, :tree_edge => te, :start => start})
  end

  # "Algorithmic Graph Theory and Perfect Graphs", Martin Charles
  # Golumbic, 1980, Academic Press, page 40, Figure 2.7
  def assign_bfsnumber_ancestry(graph, bfsnum, level, father, start)
    i = 0
    bfsnum.clear
    level.clear
    father.clear
    rt = Proc.new {|v| level[v] = 0 }
    ev = Proc.new {|v| bfsnum[v]=(i+=1);level[v]=(level[father[v]]+1) if father[v]}
    te = Proc.new {|e| father[e.target] = e.source }
    graph.dfs({:enter_vertex => ev, :tree_edge => te,
               :root_vertex => rt, :start => start})
  end


  # Is v an ancestor of u?
  def ancestor?(father, u, v)
    i = 1
    while v
      return i if father[v] == u
      v = father[v]
      i += 1
    end; nil
  end

  # Is there any relationship?
  def related?(father,u,v)
    ancestor?(father,u,v) or ancestor?(father,v,u)
  end

end

RSpec.configure do |config|
  config.include AncestryHelper
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec
end
