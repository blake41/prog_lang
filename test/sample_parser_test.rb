$:.unshift File.expand_path("../../", __FILE__)
require 'rspec'
require "sample_parser"
require 'pry'
require 'pry-nav'

describe "no code" do

  it "should return a Node array" do
    nodes = Nodes.new([])
    expect(test_def).to eq(nodes)
  end

    
end

  def test_def
    code = <<-CODE
              "a" + "b"
            CODE
    ast = Parser.new.parse(code)
    binding.pry
  end