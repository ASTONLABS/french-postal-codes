require 'mysql2'
require 'yaml'

CURDIR = File.dirname(__FILE__)

client = Mysql2::Client.new(host: "localhost", username: "root", database: "atds_dev")

dirs = client.query("SELECT SUBSTRING(postal_code, 1, 2) AS STR FROM cities GROUP BY STR")
dirs.each do |row|
  path = CURDIR + "/#{row["STR"]}"
  Dir.mkdir(path) unless File.exists?(path)

  codes = client.query("SELECT postal_code FROM cities WHERE postal_code LIKE \"#{row["STR"]}%\"")
  codes.each do |crow|
    cities = client.query("SELECT `name` FROM cities WHERE postal_code = '#{crow["postal_code"]}'")
    city_names = cities.map { |c| c["name"]  }
    File.write(path + "/" + crow["postal_code"][2..-1] + ".yml", YAML.dump({ cities: city_names }))
  end
end