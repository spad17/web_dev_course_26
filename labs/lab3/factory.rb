# ============================================
# Лабораторная работа 3: Паттерн Factory (Фабрика)
# ============================================
# Паттерн Factory предоставляет интерфейс для создания объектов
# без указания их конкретных классов.
# Запустите этот файл командой: ruby factory.rb

# Упражнение 1: Простая фабрика для создания различных типов транспорта
# Реализуйте VehicleFactory, которая создаёт Cars, Motorcycles и Trucks

class Vehicle
  attr_reader :type, :wheels, :capacity
  
  def initialize(type, wheels, capacity)
    @type = type
    @wheels = wheels
    @capacity = capacity
  end
  
  def description
    "#{@type} with #{@wheels} wheels, capacity: #{@capacity} passengers"
  end
end

class Car < Vehicle
  def initialize
    # TODO: Вызовите super с соответствующими значениями
    # Car: 4 колеса, 5 пассажиров
    nil
  end
end

class Motorcycle < Vehicle
  def initialize
    # TODO: Вызовите super с соответствующими значениями
    # Motorcycle: 2 колеса, 2 пассажира
    nil
  end
end

class Truck < Vehicle
  def initialize
    # TODO: Вызовите super с соответствующими значениями
    # Truck: 6 колёс, 3 пассажира
    nil
  end
end

class VehicleFactory
  # TODO: Реализуйте метод create_vehicle
  # Он должен принимать символ (:car, :motorcycle, или :truck)
  # и возвращать экземпляр соответствующего класса
  # Верните nil для неизвестных типов

  def self.create_vehicle(type)
    nil
  end
end

# Упражнение 2: Паттерн Factory Method (Фабричный метод)
# Создайте различные типы уведомлений (Email, SMS, Push)

class Notification
  def send(message)
    raise NotImplementedError, "Подклассы должны реализовать метод send"
  end
end

class EmailNotification < Notification
  # TODO: Реализуйте метод send
  # Верните "Email sent: #{message}"
  def send(message)
    nil
  end
end

class SMSNotification < Notification
  # TODO: Реализуйте метод send
  # Верните "SMS sent: #{message}"
  def send(message)
    nil
  end
end

class PushNotification < Notification
  # TODO: Реализуйте метод send
  # Верните "Push notification sent: #{message}"
  def send(message)
    nil
  end
end

class NotificationFactory
  # TODO: Создайте фабричный метод, который возвращает соответствующее уведомление
  # Вход: type (:email, :sms, :push)
  # Выход: экземпляр соответствующего класса уведомления

  def self.create(type)
    nil
  end
end

# Упражнение 3: Паттерн Abstract Factory (Абстрактная фабрика)
# Создайте элементы UI для различных тем (Светлая и Тёмная)

module UIElement
  def render
    raise NotImplementedError
  end
end

class LightButton
  include UIElement

  # TODO: Реализуйте метод render
  # Верните "Rendering light button"
  def render
    nil
  end
end

class DarkButton
  include UIElement

  # TODO: Реализуйте метод render
  # Верните "Rendering dark button"
  def render
    nil
  end
end

class LightTextField
  include UIElement

  # TODO: Реализуйте метод render
  # Верните "Rendering light text field"
  def render
    nil
  end
end

class DarkTextField
  include UIElement

  # TODO: Реализуйте метод render
  # Верните "Rendering dark text field"
  def render
    nil
  end
end

class ThemeFactory
  def create_button
    raise NotImplementedError
  end

  def create_text_field
    raise NotImplementedError
  end
end

class LightThemeFactory < ThemeFactory
  # TODO: Реализуйте create_button для возврата LightButton
  # TODO: Реализуйте create_text_field для возврата LightTextField

  def create_button
    nil
  end

  def create_text_field
    nil
  end
end

class DarkThemeFactory < ThemeFactory
  # TODO: Реализуйте create_button для возврата DarkButton
  # TODO: Реализуйте create_text_field для возврата DarkTextField

  def create_button
    nil
  end

  def create_text_field
    nil
  end
end

# ============================================
# ТЕСТОВЫЕ ПРИМЕРЫ - Не изменяйте код ниже этой строки
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  puts "Тестирование паттерна Factory..."
  puts "=" * 40
  
  # Test 1: VehicleFactory creates Car
  total_tests += 1
  begin
    car = VehicleFactory.create_vehicle(:car)
    if car.is_a?(Car) && car.wheels == 4 && car.capacity == 5
      tests_passed += 1
      puts "✓ Test 1 passed: VehicleFactory creates Car"
    else
      puts "✗ Test 1 failed: Car not created correctly"
    end
  rescue => e
    puts "✗ Test 1 failed: #{e.message}"
  end
  
  # Test 2: VehicleFactory creates Motorcycle
  total_tests += 1
  begin
    motorcycle = VehicleFactory.create_vehicle(:motorcycle)
    if motorcycle.is_a?(Motorcycle) && motorcycle.wheels == 2
      tests_passed += 1
      puts "✓ Test 2 passed: VehicleFactory creates Motorcycle"
    else
      puts "✗ Test 2 failed: Motorcycle not created correctly"
    end
  rescue => e
    puts "✗ Test 2 failed: #{e.message}"
  end
  
  # Test 3: VehicleFactory creates Truck
  total_tests += 1
  begin
    truck = VehicleFactory.create_vehicle(:truck)
    if truck.is_a?(Truck) && truck.wheels == 6
      tests_passed += 1
      puts "✓ Test 3 passed: VehicleFactory creates Truck"
    else
      puts "✗ Test 3 failed: Truck not created correctly"
    end
  rescue => e
    puts "✗ Test 3 failed: #{e.message}"
  end
  
  # Test 4: NotificationFactory creates EmailNotification
  total_tests += 1
  begin
    email = NotificationFactory.create(:email)
    result = email.send("Hello")
    if result == "Email sent: Hello"
      tests_passed += 1
      puts "✓ Test 4 passed: Email notification works"
    else
      puts "✗ Test 4 failed: Email notification incorrect"
    end
  rescue => e
    puts "✗ Test 4 failed: #{e.message}"
  end
  
  # Test 5: NotificationFactory creates SMSNotification
  total_tests += 1
  begin
    sms = NotificationFactory.create(:sms)
    result = sms.send("Test")
    if result == "SMS sent: Test"
      tests_passed += 1
      puts "✓ Test 5 passed: SMS notification works"
    else
      puts "✗ Test 5 failed: SMS notification incorrect"
    end
  rescue => e
    puts "✗ Test 5 failed: #{e.message}"
  end
  
  # Test 6: NotificationFactory creates PushNotification
  total_tests += 1
  begin
    push = NotificationFactory.create(:push)
    result = push.send("Alert")
    if result == "Push notification sent: Alert"
      tests_passed += 1
      puts "✓ Test 6 passed: Push notification works"
    else
      puts "✗ Test 6 failed: Push notification incorrect"
    end
  rescue => e
    puts "✗ Test 6 failed: #{e.message}"
  end
  
  # Test 7: LightThemeFactory creates light UI elements
  total_tests += 1
  begin
    factory = LightThemeFactory.new
    button = factory.create_button
    text_field = factory.create_text_field
    
    if button.render == "Rendering light button" && 
       text_field.render == "Rendering light text field"
      tests_passed += 1
      puts "✓ Test 7 passed: LightThemeFactory works"
    else
      puts "✗ Test 7 failed: Light theme elements incorrect"
    end
  rescue => e
    puts "✗ Test 7 failed: #{e.message}"
  end
  
  # Test 8: DarkThemeFactory creates dark UI elements
  total_tests += 1
  begin
    factory = DarkThemeFactory.new
    button = factory.create_button
    text_field = factory.create_text_field
    
    if button.render == "Rendering dark button" && 
       text_field.render == "Rendering dark text field"
      tests_passed += 1
      puts "✓ Test 8 passed: DarkThemeFactory works"
    else
      puts "✗ Test 8 failed: Dark theme elements incorrect"
    end
  rescue => e
    puts "✗ Test 8 failed: #{e.message}"
  end
  
  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Отлично! Вы освоили паттерн Factory!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
