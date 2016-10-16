require "rack/test"
require "test/unit"

project_root = File.join(File.dirname("__FILE__"), "..")
$LOAD_PATH.unshift(File.expand_path(project_root))

require 'ruby_on_monorail'
