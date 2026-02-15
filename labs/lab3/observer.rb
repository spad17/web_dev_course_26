# ============================================
# Лабораторная работа 3: Паттерн Observer (Наблюдатель)
# ============================================
# Паттерн Observer определяет зависимость "один ко многим" между объектами,
# чтобы при изменении состояния одного объекта все зависимые объекты уведомлялись.
# Запустите этот файл командой: ruby observer.rb

# Упражнение 1: Реализуйте Метеостанцию с Наблюдателями
# WeatherStation - это субъект, а дисплеи - наблюдатели

class WeatherStation
  # TODO: Инициализируйте с пустым массивом наблюдателей
  # TODO: Добавьте атрибуты temperature, humidity и pressure

  def initialize
    @observers = []
    @temperature = 0
    @humidity = 0
    @pressure = 0
  end

  # TODO: Реализуйте метод attach для добавления наблюдателя
  def attach(observer)
    nil
  end

  # TODO: Реализуйте метод detach для удаления наблюдателя
  def detach(observer)
    nil
  end

  # TODO: Реализуйте метод notify для вызова update у всех наблюдателей
  def notify
    nil
  end

  def set_measurements(temperature, humidity, pressure)
    @temperature = temperature
    @humidity = humidity
    @pressure = pressure
    notify
  end

  attr_reader :temperature, :humidity, :pressure
end

class CurrentConditionsDisplay
  # TODO: Реализуйте метод update
  # Используйте значения из weather_station и верните
  # "Current conditions: #{weather_station.temperature}°C, #{weather_station.humidity}% humidity"
  def update(weather_station)
    nil
  end
end

class StatisticsDisplay
  def initialize
    @temperatures = []
  end

  # TODO: Реализуйте метод update
  # Сохраните температуру и верните среднее значение
  # Верните "Avg temperature: #{average}°C"

  def update(weather_station)
    nil
  end
end

# Упражнение 2: Реализуйте Наблюдателя за Фондовым рынком
# Stock - это субъект, инвесторы - наблюдатели

class Stock
  attr_reader :symbol, :price

  def initialize(symbol, initial_price)
    @symbol = symbol
    @price = initial_price
    # TODO: Инициализируйте массив наблюдателей
    @observers = []
  end

  # TODO: Реализуйте метод subscribe для добавления наблюдателя
  def subscribe(observer)
    nil
  end

  # TODO: Реализуйте метод unsubscribe для удаления наблюдателя
  def unsubscribe(observer)
    nil
  end

  def update_price(new_price)
    old_price = @price
    @price = new_price
    # TODO: Уведомите всех наблюдателей с old_price и new_price
    nil
  end

  # TODO: Реализуйте метод notify_observers
  def notify_observers(old_price, new_price)
    nil
  end
end

class Investor
  attr_reader :name, :notifications

  def initialize(name)
    @name = name
    @notifications = []
  end

  # TODO: Реализуйте метод on_price_change
  # Сохраните уведомление: "#{stock.symbol}: #{old_price} -> #{new_price}"
  # Верните строку уведомления

  def on_price_change(stock, old_price, new_price)
    nil
  end
end

# Упражнение 3: Реализуйте Систему событий, используя модуль Observable в Ruby
# Примечание: Observable в Ruby устарел, поэтому реализуем простую версию

module Observable
  # TODO: Реализуйте этот модуль для добавления функциональности наблюдателя
  # Необходимые методы: add_observer, delete_observer, notify_observers

  def add_observer(observer)
    @observers ||= []
    # TODO: Добавьте наблюдателя в массив, если его там ещё нет
    nil
  end

  def delete_observer(observer)
    @observers ||= []
    # TODO: Удалите наблюдателя из массива
    nil
  end

  def notify_observers(data = nil)
    @observers ||= []
    # TODO: Вызовите метод update у каждого наблюдателя с self и data
    nil
  end
end

class NewsAgency
  include Observable

  attr_reader :latest_news

  def publish_news(news)
    @latest_news = news
    # TODO: Уведомите всех наблюдателей о новости
    nil
  end
end

class NewsSubscriber
  attr_reader :name, :received_news

  def initialize(name)
    @name = name
    @received_news = []
  end

  # TODO: Реализуйте метод update
  # Сохраните новость в массиве received_news
  # news_agency - первый параметр, news - второй

  def update(news_agency, news)
    nil
  end
end

# ============================================
# ТЕСТОВЫЕ ПРИМЕРЫ - Не изменяйте код ниже этой строки
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  puts "Тестирование паттерна Observer..."
  puts "=" * 40
  
  # Test 1: WeatherStation with CurrentConditionsDisplay
  total_tests += 1
  begin
    station = WeatherStation.new
    display = CurrentConditionsDisplay.new
    station.attach(display)
    station.set_measurements(25, 65, 1013)
    
    result = display.update(station)
    if result == "Current conditions: 25°C, 65% humidity"
      tests_passed += 1
      puts "✓ Test 1 passed: CurrentConditionsDisplay works"
    else
      puts "✗ Test 1 failed: Display output incorrect"
    end
  rescue => e
    puts "✗ Test 1 failed: #{e.message}"
  end
  
  # Test 2: WeatherStation with StatisticsDisplay
  total_tests += 1
  begin
    station = WeatherStation.new
    stats = StatisticsDisplay.new
    station.attach(stats)
    station.set_measurements(20, 60, 1010)
    station.set_measurements(25, 65, 1013)
    station.set_measurements(22, 63, 1011)
    
    result = stats.update(station)
    if result.include?("22") || result.include?("22.33")
      tests_passed += 1
      puts "✓ Test 2 passed: StatisticsDisplay calculates average"
    else
      puts "✗ Test 2 failed: Statistics incorrect"
    end
  rescue => e
    puts "✗ Test 2 failed: #{e.message}"
  end
  
  # Test 3: WeatherStation detach observer
  total_tests += 1
  begin
    station = WeatherStation.new
    display = CurrentConditionsDisplay.new
    station.attach(display)
    station.detach(display)
    
    # Should not raise error even though observer is detached
    station.set_measurements(30, 70, 1015)
    tests_passed += 1
    puts "✓ Test 3 passed: Observer detached successfully"
  rescue => e
    puts "✗ Test 3 failed: #{e.message}"
  end
  
  # Test 4: Stock price update notifies investors
  total_tests += 1
  begin
    stock = Stock.new("AAPL", 150.0)
    investor = Investor.new("John")
    stock.subscribe(investor)
    stock.update_price(155.0)
    
    if investor.notifications.length > 0 && 
       investor.notifications[0].include?("AAPL") &&
       investor.notifications[0].include?("150") &&
       investor.notifications[0].include?("155")
      tests_passed += 1
      puts "✓ Test 4 passed: Investor notified of price change"
    else
      puts "✗ Test 4 failed: Investor not notified correctly"
    end
  rescue => e
    puts "✗ Test 4 failed: #{e.message}"
  end
  
  # Test 5: Multiple investors
  total_tests += 1
  begin
    stock = Stock.new("GOOGL", 2800.0)
    investor1 = Investor.new("Alice")
    investor2 = Investor.new("Bob")
    stock.subscribe(investor1)
    stock.subscribe(investor2)
    stock.update_price(2850.0)
    
    if investor1.notifications.length > 0 && investor2.notifications.length > 0
      tests_passed += 1
      puts "✓ Test 5 passed: Multiple investors notified"
    else
      puts "✗ Test 5 failed: Not all investors notified"
    end
  rescue => e
    puts "✗ Test 5 failed: #{e.message}"
  end
  
  # Test 6: Unsubscribe from stock
  total_tests += 1
  begin
    stock = Stock.new("TSLA", 700.0)
    investor = Investor.new("Charlie")
    stock.subscribe(investor)
    stock.update_price(720.0)
    stock.unsubscribe(investor)
    stock.update_price(740.0)
    
    if investor.notifications.length == 1
      tests_passed += 1
      puts "✓ Test 6 passed: Unsubscribe works"
    else
      puts "✗ Test 6 failed: Unsubscribe didn't work"
    end
  rescue => e
    puts "✗ Test 6 failed: #{e.message}"
  end
  
  # Test 7: NewsAgency with subscribers
  total_tests += 1
  begin
    agency = NewsAgency.new
    subscriber1 = NewsSubscriber.new("Reader1")
    subscriber2 = NewsSubscriber.new("Reader2")
    agency.add_observer(subscriber1)
    agency.add_observer(subscriber2)
    agency.publish_news("Breaking news!")
    
    if subscriber1.received_news.include?("Breaking news!") &&
       subscriber2.received_news.include?("Breaking news!")
      tests_passed += 1
      puts "✓ Test 7 passed: News subscribers notified"
    else
      puts "✗ Test 7 failed: Subscribers not notified correctly"
    end
  rescue => e
    puts "✗ Test 7 failed: #{e.message}"
  end
  
  # Test 8: Remove news subscriber
  total_tests += 1
  begin
    agency = NewsAgency.new
    subscriber = NewsSubscriber.new("Reader")
    agency.add_observer(subscriber)
    agency.publish_news("News 1")
    agency.delete_observer(subscriber)
    agency.publish_news("News 2")
    
    if subscriber.received_news.length == 1
      tests_passed += 1
      puts "✓ Test 8 passed: Observer removed successfully"
    else
      puts "✗ Test 8 failed: Observer removal didn't work"
    end
  rescue => e
    puts "✗ Test 8 failed: #{e.message}"
  end
  
  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Превосходно! Вы освоили паттерн Observer!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
