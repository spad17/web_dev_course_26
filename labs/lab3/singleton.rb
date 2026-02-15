# ============================================
# Лабораторная работа 3: Паттерн Singleton (Одиночка)
# ============================================
# Паттерн Singleton гарантирует, что у класса есть только один экземпляр
# и предоставляет глобальную точку доступа к нему.
# Запустите этот файл командой: ruby singleton.rb

# Упражнение 1: Реализуйте базовый Singleton
# Создайте класс Logger, который может иметь только один экземпляр
# Подсказка: Используйте переменные класса и приватный конструктор

class Logger
  # TODO: Сделайте конструктор приватным, используя private_class_method
  # TODO: Создайте переменную класса @@instance
  # TODO: Реализуйте метод self.instance, который возвращает единственный экземпляр

  def initialize
    @logs = []
  end

  def log(message)
    @logs << "[#{Time.now}] #{message}"
  end

  def show_logs
    @logs
  end

  def clear_logs
    @logs.clear
  end
end

# Упражнение 2: Реализуйте Singleton, используя модуль Singleton в Ruby
# Создайте класс Configuration, используя встроенный модуль Singleton в Ruby
# Подсказка: require 'singleton' и include Singleton

require 'singleton'

class Configuration
  # TODO: Подключите модуль Singleton

  attr_accessor :app_name, :version, :debug_mode

  def initialize
    @app_name = "MyApp"
    @version = "1.0.0"
    @debug_mode = false
  end

  def settings
    {
      app_name: @app_name,
      version: @version,
      debug_mode: @debug_mode
    }
  end
end

# Упражнение 3: Реализуйте Singleton для пула соединений с базой данных
# Создайте класс DatabaseConnection, который управляет единственным соединением

class DatabaseConnection
  # TODO: Реализуйте паттерн Singleton (вручную или с помощью модуля)
  # TODO: Добавьте атрибут @connected для отслеживания состояния соединения

  def initialize
    @connected = false
    @connection_string = nil
  end

  def connect(connection_string)
    # TODO: Установите @connected в true и сохраните connection_string
    # TODO: Верните "Connected to #{connection_string}"
    nil
  end

  def disconnect
    # TODO: Установите @connected в false
    # TODO: Верните "Disconnected"
    nil
  end

  def connected?
    @connected
  end

  def execute_query(query)
    # TODO: Верните "Executing: #{query}" если подключено
    # TODO: Верните "Not connected to database" если не подключено
    nil
  end
end

# ============================================
# ТЕСТОВЫЕ ПРИМЕРЫ - Не изменяйте код ниже этой строки
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  puts "Тестирование паттерна Singleton..."
  puts "=" * 40
  
  # Test 1: Logger Singleton - same instance
  total_tests += 1
  begin
    logger1 = Logger.instance
    logger2 = Logger.instance
    
    if logger1.object_id == logger2.object_id
      tests_passed += 1
      puts "✓ Test 1 passed: Logger returns same instance"
    else
      puts "✗ Test 1 failed: Logger returns different instances"
    end
  rescue => e
    puts "✗ Test 1 failed: #{e.message}"
  end
  
  # Test 2: Logger cannot be instantiated with new
  total_tests += 1
  begin
    Logger.new
    puts "✗ Test 2 failed: Logger.new should raise an error"
  rescue NoMethodError
    tests_passed += 1
    puts "✓ Test 2 passed: Logger.new is private"
  rescue => e
    puts "✗ Test 2 failed: Wrong error - #{e.message}"
  end
  
  # Test 3: Logger functionality
  total_tests += 1
  begin
    logger = Logger.instance
    logger.clear_logs
    logger.log("Test message")
    
    if logger.show_logs.length == 1 && logger.show_logs[0].include?("Test message")
      tests_passed += 1
      puts "✓ Test 3 passed: Logger stores messages"
    else
      puts "✗ Test 3 failed: Logger doesn't store messages correctly"
    end
  rescue => e
    puts "✗ Test 3 failed: #{e.message}"
  end
  
  # Test 4: Configuration Singleton
  total_tests += 1
  begin
    config1 = Configuration.instance
    config2 = Configuration.instance
    
    config1.app_name = "TestApp"
    
    if config2.app_name == "TestApp"
      tests_passed += 1
      puts "✓ Test 4 passed: Configuration shares state"
    else
      puts "✗ Test 4 failed: Configuration instances don't share state"
    end
  rescue => e
    puts "✗ Test 4 failed: #{e.message}"
  end
  
  # Test 5: Configuration cannot be instantiated with new
  total_tests += 1
  begin
    Configuration.new
    puts "✗ Test 5 failed: Configuration.new should raise an error"
  rescue NoMethodError
    tests_passed += 1
    puts "✓ Test 5 passed: Configuration.new is private"
  rescue => e
    puts "✗ Test 5 failed: Wrong error - #{e.message}"
  end
  
  # Test 6: DatabaseConnection Singleton
  total_tests += 1
  begin
    db1 = DatabaseConnection.instance
    db2 = DatabaseConnection.instance
    
    if db1.object_id == db2.object_id
      tests_passed += 1
      puts "✓ Test 6 passed: DatabaseConnection returns same instance"
    else
      puts "✗ Test 6 failed: DatabaseConnection returns different instances"
    end
  rescue => e
    puts "✗ Test 6 failed: #{e.message}"
  end
  
  # Test 7: DatabaseConnection functionality
  total_tests += 1
  begin
    db = DatabaseConnection.instance
    result = db.connect("localhost:5432")
    
    if db.connected? && result == "Connected to localhost:5432"
      tests_passed += 1
      puts "✓ Test 7 passed: DatabaseConnection connects"
    else
      puts "✗ Test 7 failed: DatabaseConnection doesn't connect properly"
    end
  rescue => e
    puts "✗ Test 7 failed: #{e.message}"
  end
  
  # Test 8: DatabaseConnection query execution
  total_tests += 1
  begin
    db = DatabaseConnection.instance
    db.connect("localhost:5432")
    result = db.execute_query("SELECT * FROM users")
    
    if result == "Executing: SELECT * FROM users"
      tests_passed += 1
      puts "✓ Test 8 passed: DatabaseConnection executes queries"
    else
      puts "✗ Test 8 failed: Query execution incorrect"
    end
  rescue => e
    puts "✗ Test 8 failed: #{e.message}"
  end
  
  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Превосходно! Вы поняли паттерн Singleton!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
