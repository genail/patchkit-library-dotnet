require_relative "base_generator.rb"
require_relative "get_request_generator.rb"

class RequestsGenerator < BaseGenerator
  def initialize(data)
    super()
    @data = data
  end

  def write_methods
    @data["paths"].each do |path, data|
      generator = GetRequestGenerator.new(@data["basePath"], path, data)
      write generator.generate
    end
  end

  def generate
    super()

    write "using PatchKit.Api.Models;"
    write "using System.Collections.Generic;"
    write nil
    write_block "namespace PatchKit.Api" do
      write_block "public partial class ApiConnection" do
        write_methods
      end
    end

    @output
  end
end