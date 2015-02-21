require "yaml"

class FrenchPostalCode
  # Paths to check for file existence
  @load_paths = [File.join(File.dirname(__FILE__), "data")]

  # Gets cities belonging to specified postal code
  # Returns empty array if postal code isn't found
  def self.cities(postal_code)
    postal_code = postal_code.to_s
    return [] if postal_code.length < 2 # Path can't be constructed if length < 2

    path = @load_paths.find { |path| File.file?(build_file_path(path, postal_code)) }
    return [] if path.nil?
    YAML.load_file(build_file_path(path, postal_code))[:cities]
  end

  class << self
    alias_method :places, :cities

    attr_accessor :load_paths
  end

private

  def self.build_file_path(dir, postal_code)
    File.join(dir, postal_code[0..1], postal_code[2..-1]) + ".yml"
  end

end