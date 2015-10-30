# coding: utf-8
class Pet
  def initialize(name, type)
    @name = name
    @type = type
    @health = 100 #жизнь
    @mood = 100 #настроение
    @satiety = 100 #сытость
    @cheerfulness = 100 #бодрость
    @cleaness = 100 #чистота
    @poo = 0 #нужда

    @actions = ["бегает и все крушит",
                "сьел вашу новую рыбку",
                "привторяеться, что умеет читать",
                "грустит и смотрит в окно",
                "дико смееться, глядя на Вас",
                "рисует себя",
                "пытаеться допрыгнуть до потолка",
                "обдирает обои",
                "что-то ищет в мусорном ведре",
                "побежал на улицу",
                "смотрит на Вас вызывающее",
                "просит Вас поиграть с ним"]

    @results = ["устает, но его настроение повышаеться",
                "поел и теперь не голоден. Правда нужда повысилась",
                "умственно вымотался и теперь хочет спать",
                "очень ванильный #{type_list[@type]}",
                "намекает, что Вам стоит посмотреть в зеркало",
                "рисует весьма неплохо. Настроение повысилось",
                "вылез на стул, чтобы достать и падает. Жизнь и настроение уменшились",
                "хочет, чтобы его наказали",
                "немного поел, но жизнь и опрятность уменшилась, а нужда повысилась",
                "нашел там свою старую игрушку. Настроение повысилось, но немного устал",
                "выглядит устрашающее",
                "получает травму, когда вы, играя с ним, случайно задели его правой ногой"]
  end

  def treat
    puts "Вы сводили #{@name} к доктору"
    @health = 115
    @time = 15
    change_status(@time)
  end

  def watch
    puts "#{@name} смотрит телевизор"
    @mood = 110
    @time = 10
    change_status(@time)
  end

  def feed
    puts "Вы покормили #{@name}"
    @satiety = 105
    @time = 5
    change_status(@time)
  end

  def sleep
    puts "Вы уложили #{@name} спать"
    @cheerfulness = 115
    @time = 15
    change_status(@time)
  end

  def wash
    puts "Вы отправили #{@name} в ванную"
    @cleaness = 110
    @time = 10
    change_status(@time)
  end

  def toilet
    puts "Вы сводили #{@name} в туалет"
    @poo = -5
    @time = 5
    change_status(@time)
  end

  def wait
    puts "Вы смотрите за #{@name}"

    action_index = rand(@actions.length)
    action = @actions[action_index]
    result = @results[action_index]
    puts "#{@name} #{action}! #{@name} #{result}"

    case action_index
    when 0
      @mood += 10
      @cheerfulness -= 5
    when 1
      @satiety += 15
      @poo += 10
    when 2
      @cheerfulness -= 15
    when 5
      @mood += 5
    when 6
      @health -= 10
      @mood -= 10
    when 8
      @satiety += 5
      @health -= 10
      @cleaness -= 10
      @poo += 5
    when 9
      @mood += 15
      @cheerfulness -= 5
    when 11
      @health -= 15
    end

    @time = 3
    change_status(@time)
  end

  def status
    puts "-------Статус питомца-------"
    puts "Жизнь питомца = #{@health}"
    puts "Настроение питомца = #{@mood}"
    puts "Сытость питомца = #{@satiety}"
    puts "Бодрость питомца = #{@cheerfulness}"
    puts "Опрятность питомца = #{@cleaness}"
    puts "Нужда питомца = #{@poo}"
    puts "----------------------------"
  end

  def help
    puts "------------------------------Помощь-------------------------------------"
    puts "Treat  - сводить к доктору (повышение жизни)       Длительность: 30 минут"
    puts "Watch  - смотеть телевизор (повышение настроения)  Длительность: 20 минут"
    puts "Feed   - покормить         (повышение сытости)     Длительность: 10 минут"
    puts "Sleep  - уложить спать     (повышение бодрости)    Длительность: 30 минут"
    puts "Wash   - помыть            (повышение опрятности)  Длительность: 20 минут"
    puts "Toilet - сводить в туалет  (понижение нужды)       Длительность: 10 минут"
    puts "Wait   - понаблюдать       (случайное событие)     Длительность: 10 минут"
    puts "Status - состояние питомца (без событий)           Длительность: 0  минут"
    puts "Help   - все действия      (без событий)           Длительность: 0  минут"
    puts "Exit   - выход из игры                                                   "
    puts "-------------------------------------------------------------------------"
  end

  private

  def hungry?
    @satiety <= 20
  end

  def poopy?
    @poo >= 80
  end

  def bored?
    @mood <= 20
  end

  def sleepy?
    @cheerfulness <= 20
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
    @satiety = @satiety < 0 ? 0 : @satiety > 100 ? 100 : @satiety - time
    @cheerfulness = @cheerfulness < 0 ? 0 : @cheerfulness > 100 ? 100 : @cheerfulness - time
    @cleaness = @cleaness < 0 ? 0 : @cleaness > 100 ? 100 : @cleaness - time
    @poo = @poo < 0 ? 0 : @poo > 100 ? 100 : @poo + time

    puts "#{@name} хочет есть!  (#{@satiety}%)" if hungry?
    puts "#{@name} хочет в туалет!  (#{@poo}%)" if poopy?
    puts "#{@name} скучает.  (#{@mood}%)" if bored?
    puts "#{@name} хочет спать.  (#{@cheerfulness}%)" if sleepy?
    puts "#{@name} плохо себя чуствует!  (#{@health}%)" if healthy?
    puts "#{@name} воняет!  (#{@cleaness}%)" if clean?

    if @health <= 0
      puts "Ваш питомец скончался в муках от дизентерии"
      puts "Игра окончена"
      exit
    end

    if @satiety <= 0
      random = rand(1)
      if random == 1
        puts "У вашего питомца слюнки текут при виде Вас. Вы пытались убежать, но он оказался быстрее и сьел Вас"
        puts "Игра окончена"
        exit
      else
        puts "Ваш питомец ненавидит Вас. Он оставил записку и убежал"
        puts "Игра окончена"
        exit
      end
    end

    if @poo >= 100
      puts "Ой. #{@name} не вытерпел и обделался на месте\nОпрятность понизилась"
      @poo = 0
      @cleaness -= 30
    end

    if @cheerfulness <= 0
      puts "#{@name} свалился с ног и уснул. \nХррр...\nЖизнь питомца уменшилась"
      @cheerfulness = 100
      @health -= 30
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
  command_list[0] = "Exit"
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

puts "Добро пожаловать в тамагочи 1.0"
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

(command_list.length).times { |t| puts "#{t} - #{command_list[t]}" }

while 1
  puts "Что делаем?"
  command = gets.chomp.to_i
  if command_list.keys.include?(command)
    command = command_list[command].downcase
    pet.send command
  elsif command == 0
    exit
  end
end
