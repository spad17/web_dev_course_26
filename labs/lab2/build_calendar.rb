# encoding: UTF-8
require 'date'

class SportsCalendar
  GAME_DAYS = [5, 6, 0]  # Пятница=5, Суббота=6, Воскресенье=0
  GAME_TIMES = ['12:00', '15:00', '18:00']
  MAX_SIMULTANEOUS_GAMES = 2

  def initialize(teams_file, start_date, end_date, output_file)
    @teams_file = teams_file
    @start_date = parse_date(start_date)
    @end_date = parse_date(end_date)
    @output_file = output_file
    @teams = []
    @schedule = []
  end

  def parse_date(date_str)
    begin
      Date.strptime(date_str, '%d.%m.%Y')
    rescue ArgumentError
      raise "Неверный формат даты: #{date_str}. Используйте формат ДД.ММ.ГГГГ"
    end
  end

  def validate_dates
    raise "Дата начала должна быть раньше даты окончания" if @start_date >= @end_date
    raise "Диапазон дат слишком большой (максимум 2 года)" if (@end_date - @start_date).to_i > 730
  end

  def read_teams
    raise "Файл с командами не существует: #{@teams_file}" unless File.exist?(@teams_file)
    
    File.readlines(@teams_file, encoding: 'UTF-8').each_with_index do |line, index|
      line = line.strip
      next if line.empty? || line.start_with?('#')
      
      # Удаляем номер строки в начале
      line = line.sub(/^\d+\.\s*/, '')
      
      # Разделяем по " — "
      parts = line.split(' — ')
      raise "Неверный формат строки #{index + 1}: '#{line}'" unless parts.length == 2
      
      team_name = parts[0].strip
      city = parts[1].strip
      
      raise "Название команды не может быть пустым" if team_name.empty?
      raise "Название города не может быть пустым" if city.empty?
      raise "Название команды слишком длинное (макс. 50 символов)" if team_name.length > 50
      raise "Название города слишком длинное (макс. 50 символов)" if city.length > 50
      
      @teams << { name: team_name, city: city }
    end
    
    raise "Файл не содержит команд" if @teams.empty?
    raise "Необходимо минимум 2 команды" if @teams.length < 2
    raise "Слишком много команд (максимум 50)" if @teams.length > 50
  end

  def get_game_slots
    slots = []
    current_date = @start_date
    
    while current_date <= @end_date
      if GAME_DAYS.include?(current_date.wday)
        GAME_TIMES.each do |time|
          slots << { date: current_date, time: time, games: [] }
        end
      end
      current_date += 1
    end
    
    slots
  end

  def generate_matches
    matches = []
    @teams.each_with_index do |team1, i|
      @teams.each_with_index do |team2, j|
        if i < j
          matches << { home: team1, away: team2 }
          matches << { home: team2, away: team1 }
        end
      end
    end
    matches
  end

  def distribute_games(matches, slots)
    total_matches = matches.length
    total_slots = slots.length
    
    raise "Недостаточно игровых слотов для всех матчей" if total_slots * MAX_SIMULTANEOUS_GAMES < total_matches
    
    matches_per_slot = (total_matches.to_f / total_slots).ceil
    slot_index = 0
    games_in_slot = 0
    
    matches.each do |match|
      while slot_index < slots.length
        current_slot = slots[slot_index]
        
        if current_slot[:games].length < MAX_SIMULTANEOUS_GAMES
          current_slot[:games] << match
          @schedule << {
            date: current_slot[:date],
            time: current_slot[:time],
            home_team: match[:home],
            away_team: match[:away]
          }
          break
        else
          slot_index += 1
        end
      end
      
      slot_index += 1 if games_in_slot >= matches_per_slot
      games_in_slot += 1
    end
    
    @schedule.sort_by! { |game| [game[:date], game[:time]] }
  end

  def write_calendar
    File.open(@output_file, 'w:UTF-8') do |file|
      file.puts "=" * 100
      file.puts "СПОРТИВНЫЙ КАЛЕНДАРЬ"
      file.puts "=" * 100
      file.puts "Период: #{@start_date.strftime('%d.%m.%Y')} - #{@end_date.strftime('%d.%m.%Y')}"
      file.puts "Команд: #{@teams.length}"
      file.puts "Всего игр: #{@schedule.length}"
      file.puts "=" * 100
      file.puts
      
      current_date = nil
      
      @schedule.each do |game|
        if current_date != game[:date]
          current_date = game[:date]
          day_name = case current_date.wday
                     when 5 then "Пятница"
                     when 6 then "Суббота"
                     when 0 then "Воскресенье"
                     end
          file.puts "-" * 100
          file.puts "#{day_name}, #{current_date.strftime('%d.%m.%Y')}"
          file.puts "-" * 100
        end
        
        file.puts sprintf("%-8s | %-40s vs %-40s", 
                         game[:time],
                         "#{game[:home_team][:name]} (#{game[:home_team][:city]})",
                         "#{game[:away_team][:name]} (#{game[:away_team][:city]})")
      end
      
      file.puts
      file.puts "=" * 100
      file.puts "Календарь сгенерирован: #{Time.now.strftime('%d.%m.%Y %H:%M')}"
      file.puts "=" * 100
    end
  end

  def build
    puts "Проверка дат..."
    validate_dates
    puts "✓ Даты валидны"
    
    puts "Чтение команд из #{@teams_file}..."
    read_teams
    puts "✓ Загружено #{@teams.length} команд"
    
    puts "Генерация игровых слотов..."
    slots = get_game_slots
    puts "✓ Найдено #{slots.length} игровых слотов"
    
    puts "Генерация матчей..."
    matches = generate_matches
    puts "✓ Сгенерировано #{matches.length} матчей"
    
    puts "Распределение игр по слотам..."
    distribute_games(matches, slots)
    puts "✓ Игры распределены"
    
    puts "Запись календаря в #{@output_file}..."
    write_calendar
    puts "✓ Календарь сохранён"
    
    puts "\n" + "=" * 50
    puts "КАЛЕНДАРЬ УСПЕШНО СОЗДАН!"
    puts "=" * 50
    puts "Файл: #{@output_file}"
    puts "Период: #{@start_date.strftime('%d.%m.%Y')} - #{@end_date.strftime('%d.%m.%Y')}"
    puts "Команд: #{@teams.length}"
    puts "Всего игр: #{@schedule.length}"
    puts "=" * 50
  end
end

# Главная программа
if __FILE__ == $PROGRAM_NAME
  if ARGV.length != 4
    puts "Ошибка: Неверное количество аргументов!"
    puts "Использование: ruby build_calendar.rb teams.txt start_date end_date output.txt"
    puts "Пример: ruby build_calendar.rb teams.txt 01.08.2026 01.06.2027 calendar.txt"
    exit 1
  end

  begin
    calendar = SportsCalendar.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
    calendar.build
  rescue => e
    puts "Ошибка: #{e.message}"
    exit 1
  end
end
