# ============================================
# Лабораторная работа 3: Паттерн Strategy (Стратегия)
# ============================================
# Паттерн Strategy определяет семейство алгоритмов, инкапсулирует каждый из них
# и делает их взаимозаменяемыми. Strategy позволяет алгоритму изменяться независимо
# от клиентов, которые его используют.
# Запустите этот файл командой: ruby strategy.rb

# Упражнение 1: Стратегия оплаты
# Реализуйте различные методы оплаты, которые можно использовать взаимозаменяемо

class PaymentStrategy
  def pay(amount)
    raise NotImplementedError, "Подклассы должны реализовать метод pay"
  end
end

class CreditCardPayment < PaymentStrategy
  def initialize(card_number)
    @card_number = card_number
  end

  # TODO: Реализуйте метод pay
  # Верните "Paid $#{amount} using Credit Card ending in #{last_4_digits}"
  def pay(amount)
    nil
  end

  private

  def last_4_digits
    @card_number[-4..-1]
  end
end

class PayPalPayment < PaymentStrategy
  def initialize(email)
    @email = email
  end

  # TODO: Реализуйте метод pay
  # Верните "Paid $#{amount} using PayPal account #{@email}"
  def pay(amount)
    nil
  end
end

class CryptoPayment < PaymentStrategy
  def initialize(wallet_address)
    @wallet_address = wallet_address
  end

  # TODO: Реализуйте метод pay
  # Верните "Paid $#{amount} using Crypto wallet #{@wallet_address}"
  def pay(amount)
    nil
  end
end

class ShoppingCart
  def initialize
    @items = []
    @payment_strategy = nil
  end

  def add_item(name, price)
    @items << { name: name, price: price }
  end

  # TODO: Реализуйте метод set_payment_strategy
  def set_payment_strategy(strategy)
    nil
  end

  def total
    @items.sum { |item| item[:price] }
  end

  # TODO: Реализуйте метод checkout
  # Используйте стратегию оплаты для обработки платежа
  # Верните результат из метода pay стратегии оплаты
  def checkout
    nil
  end
end

# Упражнение 2: Стратегия сортировки
# Реализуйте различные алгоритмы сортировки как стратегии

module SortStrategy
  def sort(array)
    raise NotImplementedError
  end
end

class BubbleSort
  include SortStrategy

  # TODO: Реализуйте пузырьковую сортировку
  # Верните отсортированный массив (по возрастанию)
  def sort(array)
    nil
  end
end

class QuickSort
  include SortStrategy

  # TODO: Реализуйте быструю сортировку или используйте встроенную sort в Ruby
  # Верните отсортированный массив (по возрастанию)
  def sort(array)
    nil
  end
end

class ReverseSort
  include SortStrategy

  # TODO: Реализуйте обратную сортировку
  # Верните отсортированный массив (по убыванию)
  def sort(array)
    nil
  end
end

class DataProcessor
  def initialize(sort_strategy)
    @sort_strategy = sort_strategy
  end

  # TODO: Реализуйте метод set_strategy
  def set_strategy(strategy)
    nil
  end

  # TODO: Реализуйте метод process
  # Используйте стратегию сортировки для сортировки данных
  def process(data)
    nil
  end
end

# Упражнение 3: Стратегия сжатия
# Реализуйте различные алгоритмы сжатия

class CompressionStrategy
  def compress(data)
    raise NotImplementedError
  end
end

class ZipCompression < CompressionStrategy
  # TODO: Реализуйте метод compress
  # Верните "ZIP compressed: #{data}"
  def compress(data)
    nil
  end
end

class RarCompression < CompressionStrategy
  # TODO: Реализуйте метод compress
  # Верните "RAR compressed: #{data}"
  def compress(data)
    nil
  end
end

class NoCompression < CompressionStrategy
  # TODO: Реализуйте метод compress
  # Верните "Not compressed: #{data}"
  def compress(data)
    nil
  end
end

class FileHandler
  attr_reader :compression_strategy

  def initialize(compression_strategy = NoCompression.new)
    @compression_strategy = compression_strategy
  end

  # TODO: Реализуйте метод set_compression
  def set_compression(strategy)
    nil
  end

  # TODO: Реализуйте метод save_file
  # Сожмите данные, используя стратегию, и верните результат
  def save_file(data)
    nil
  end
end

# ============================================
# ТЕСТОВЫЕ ПРИМЕРЫ - Не изменяйте код ниже этой строки
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  puts "Тестирование паттерна Strategy..."
  puts "=" * 40
  
  # Test 1: Credit Card Payment
  total_tests += 1
  begin
    cart = ShoppingCart.new
    cart.add_item("Book", 10)
    cart.add_item("Pen", 5)
    cart.set_payment_strategy(CreditCardPayment.new("1234567890123456"))
    result = cart.checkout
    
    if result.include?("15") && result.include?("3456")
      tests_passed += 1
      puts "✓ Test 1 passed: Credit Card payment works"
    else
      puts "✗ Test 1 failed: Credit Card payment incorrect"
    end
  rescue => e
    puts "✗ Test 1 failed: #{e.message}"
  end
  
  # Test 2: PayPal Payment
  total_tests += 1
  begin
    cart = ShoppingCart.new
    cart.add_item("Mouse", 25)
    cart.set_payment_strategy(PayPalPayment.new("user@example.com"))
    result = cart.checkout
    
    if result.include?("25") && result.include?("user@example.com")
      tests_passed += 1
      puts "✓ Test 2 passed: PayPal payment works"
    else
      puts "✗ Test 2 failed: PayPal payment incorrect"
    end
  rescue => e
    puts "✗ Test 2 failed: #{e.message}"
  end
  
  # Test 3: Crypto Payment
  total_tests += 1
  begin
    cart = ShoppingCart.new
    cart.add_item("Keyboard", 50)
    cart.set_payment_strategy(CryptoPayment.new("0x1234abcd"))
    result = cart.checkout
    
    if result.include?("50") && result.include?("0x1234abcd")
      tests_passed += 1
      puts "✓ Test 3 passed: Crypto payment works"
    else
      puts "✗ Test 3 failed: Crypto payment incorrect"
    end
  rescue => e
    puts "✗ Test 3 failed: #{e.message}"
  end
  
  # Test 4: Bubble Sort
  total_tests += 1
  begin
    processor = DataProcessor.new(BubbleSort.new)
    result = processor.process([3, 1, 4, 1, 5, 9, 2, 6])
    
    if result == [1, 1, 2, 3, 4, 5, 6, 9]
      tests_passed += 1
      puts "✓ Test 4 passed: Bubble sort works"
    else
      puts "✗ Test 4 failed: Bubble sort incorrect"
    end
  rescue => e
    puts "✗ Test 4 failed: #{e.message}"
  end
  
  # Test 5: Quick Sort
  total_tests += 1
  begin
    processor = DataProcessor.new(QuickSort.new)
    result = processor.process([5, 2, 8, 1, 9])
    
    if result == [1, 2, 5, 8, 9]
      tests_passed += 1
      puts "✓ Test 5 passed: Quick sort works"
    else
      puts "✗ Test 5 failed: Quick sort incorrect"
    end
  rescue => e
    puts "✗ Test 5 failed: #{e.message}"
  end
  
  # Test 6: Reverse Sort
  total_tests += 1
  begin
    processor = DataProcessor.new(ReverseSort.new)
    result = processor.process([3, 1, 4, 1, 5])
    
    if result == [5, 4, 3, 1, 1]
      tests_passed += 1
      puts "✓ Test 6 passed: Reverse sort works"
    else
      puts "✗ Test 6 failed: Reverse sort incorrect"
    end
  rescue => e
    puts "✗ Test 6 failed: #{e.message}"
  end
  
  # Test 7: Change sorting strategy
  total_tests += 1
  begin
    processor = DataProcessor.new(BubbleSort.new)
    processor.set_strategy(ReverseSort.new)
    result = processor.process([1, 2, 3])
    
    if result == [3, 2, 1]
      tests_passed += 1
      puts "✓ Test 7 passed: Strategy change works"
    else
      puts "✗ Test 7 failed: Strategy change incorrect"
    end
  rescue => e
    puts "✗ Test 7 failed: #{e.message}"
  end
  
  # Test 8: ZIP Compression
  total_tests += 1
  begin
    handler = FileHandler.new
    handler.set_compression(ZipCompression.new)
    result = handler.save_file("test data")
    
    if result == "ZIP compressed: test data"
      tests_passed += 1
      puts "✓ Test 8 passed: ZIP compression works"
    else
      puts "✗ Test 8 failed: ZIP compression incorrect"
    end
  rescue => e
    puts "✗ Test 8 failed: #{e.message}"
  end
  
  # Test 9: RAR Compression
  total_tests += 1
  begin
    handler = FileHandler.new(RarCompression.new)
    result = handler.save_file("important file")
    
    if result == "RAR compressed: important file"
      tests_passed += 1
      puts "✓ Test 9 passed: RAR compression works"
    else
      puts "✗ Test 9 failed: RAR compression incorrect"
    end
  rescue => e
    puts "✗ Test 9 failed: #{e.message}"
  end
  
  # Test 10: No Compression
  total_tests += 1
  begin
    handler = FileHandler.new(NoCompression.new)
    result = handler.save_file("plain text")
    
    if result == "Not compressed: plain text"
      tests_passed += 1
      puts "✓ Test 10 passed: No compression works"
    else
      puts "✗ Test 10 failed: No compression incorrect"
    end
  rescue => e
    puts "✗ Test 10 failed: #{e.message}"
  end
  
  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Фантастика! Вы освоили паттерн Strategy!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
