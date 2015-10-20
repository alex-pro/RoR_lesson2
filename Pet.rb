# coding: utf-8
class Pet
  def initialize(name, type)
    @name = name
    @type = type
    @health = 100 #жизнь
    @mood = 100 #настроение
    @hunger = 0 #голод
    @dream = 100 #сон
    @cleaness = 100 #чистота
    @poo = 0 #нуджа
  end

  def treat
    puts "Вы сводили #{@name}a(у) к доктору"
    @health = 100
    @time = 3
    change_status(@time)
  end

  def watch
    puts "#{@name} смотрит телевизор"
    @mood = 100
    @time = 2
    change_status(@time)
  end

  def feed
    puts "Вы покормили #{@name}a(у)"
    @hunger = 0
    @time = 1
    change_status(@time)
  end

  def sleep
    puts "Вы уложили #{@name}a(у) спать"
    @dream = 100
    @time = 3
    change_status(@time)
  end

  def wash
    puts "Вы отправили #{@name}a(у) в ванную"
    @cleaness = 100
    @time = 2
    change_status(@time)
  end

  def toilet
    puts "Вы сводили #{@name}a(у) в туалет"
    @poo = 0
    @time = 1
    change_status(@time)
  end

  def wait
    puts "Вы смотрите за #{@name}ом(ой)"
    @time = 1
    change_status(@time)
  end

  def status
    puts "-------Статус питомца-------"
    puts "Жизнь питомца = #{@health}"
    puts "Настроение питомца = #{@mood}"
    puts "Голод питомца = #{@hunger}"
    puts "Сонливость питомца = #{@dream}"
    puts "Опрятность питомца = #{@cleaness}"
    puts "Нужда питомца = #{@poo}"
    puts "----------------------------"
  end

  def help
    puts "------------------------------Помощь-------------------------------------"
    puts "Treat  - сводить к доктору (повышение жизни)       Длительность: 30 минут"
    puts "Watch  - смотеть телевизор (повышение настроения)  Длительность: 20 минут"
    puts "Feed   - покормить         (повышение сытости)     Длительность: 10 минут"
    puts "Sleep  - уложить спать     (понижение сонливости)  Длительность: 30 минут"
    puts "Wash   - помыть            (повышение опрятности)  Длительность: 20 минут"
    puts "Toilet - сводить в туалет  (понижение нужды)       Длительность: 10 минут"
    puts "Wait   - понаблюдать       (случайное событие)     Длительность: 10 минут"
    puts "Status - состояние питомца (без событий)           Длительность: 0  минут"
    puts "Help   - все действия      (без событий)           Длительность: 0  минут"
    puts "-------------------------------------------------------------------------"
  end

  private

  def hungry?
    @hunger >= 80
  end

  def poopy?
    @poo >= 80
  end

  def bored?
    @mood <= 20
  end

  def sleepy?
    @dream <= 20
  end

  def healthy?
    @health <= 20
  end

  def clean?
    @cleaness <= 20
  end

  def change_status(time)
    @health = @health < 0 ? 0 : @health > 100 ? 100 : @health - time
    @mood = @mood < 0 ? 0 : @mood > 100 ? 100 : @mood - time
    @hunger = @hunger < 0 ? 0 : @hunger > 100 ? 100 : @hunger + time
    @dream = @dream < 0 ? 0 : @dream > 100 ? 100 : @dream - time
    @cleaness = @cleaness < 0 ? 0 : @cleaness > 100 ? 100 : @cleaness - time
    @poo = @poo < 0 ? 0 : @poo > 100 ? 100 : @poo + time

    puts "#{@name} хочет есть!  (#{@hunger}%)" if hungry?
    puts "#{@name} хочет в туалет!  (#{@poo}%)" if poopy?
    puts "#{@name} скучает.  (#{@mood}%)" if bored?
    puts "#{@name} хочет спать.  (#{@dream}%)" if sleepy?
    puts "#{@name} плохо себя чуствует!  (#{@health}%)" if healthy?
    puts "#{@name} воняет!  (#{@cleaness}%)" if clean?

    if @health <= 0
      puts "Ваш питомец скончался в муках от дизентерии"
      puts "Игра окончена"
      exit
    end

    if @hunger >= 100
      puts "У вашего питомца слюнки текут при виде Вас. Вы пытались убежать, но он оказался быстрее и сьел Вас"
      puts "Игра окончена"
      exit
    end

    if @poo >= 100
      puts "Ой. #{@name} не вытерпел и обосрался на месте"
      @poo = 0
    end

    if @dream <= 0
      puts "#{@name} свалился с ног и уснул. \nХррр..."
      @dream = 100
    end
  end
end

def type_list
  type_list = Hash.new
  type_list[1] = "Питбуль"
  type_list[2] = "Пантера"
  type_list[3] = "Страус"
  type_list[4] = "Крокодил"
  type_list[5] = "Питон"
  type_list[6] = "Тарантул"
  type_list
end

def command_list
  command_list = Hash.new
  command_list[1] = "Treat"
  command_list[2] = "Watch"
  command_list[3] = "Feed"
  command_list[4] = "Sleep"
  command_list[5] = "Wash"
  command_list[6] = "Toilet"
  command_list[7] = "Wait"
  command_list[8] = "Status"
  command_list[9] = "Help"
  command_list
end

puts "Добро пожаловать в Тамагочи 1.0"
(type_list.length).times { |t| puts "#{t+1} - #{type_list[t+1]}" }

while 1
  puts "Пожалуйста, выберите тип питомца из списка: "
  type = gets.chomp.to_i
  break if type_list.keys.include?(type)
end

puts "Введите имья питомца: "
name = gets.chomp

pet = Pet.new(name, type)
system "clear"

puts "Создан(а) #{type_list[type]} с именем #{name}."

(command_list.length).times { |t| puts "#{t+1} - #{command_list[t+1]}" }

while 1
  puts "\nЧто делаем?"
  command = gets.chomp.to_i
  if command_list.keys.include?(command)
    command = command_list[command].downcase
    pet.send command
  end
end
