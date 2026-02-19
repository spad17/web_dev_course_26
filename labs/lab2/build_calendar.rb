require 'date'
# Класс команды
class Team
  attr_reader :name, :home

  def initialize(name, home)
    @name = name
    @home = home
  end

  def to_s
    "#{@name} (#{@home})"
  end
end 
#проверка входных данных 
if ARGV.length != 4
  exit(1)
end
teams_file = ARGV[0]
start_date_str = ARGV[1]
end_date_str = ARGV[2]
output_file = ARGV[3]
#чтение
teams = []
unless File.exist?(teams_file)
  exit(1)
end
