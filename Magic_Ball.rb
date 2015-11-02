# coding: utf-8
require 'colorize'

class Ball
  def initialize
    @answers = ["Бесспорно",
                "Предрешено",
                "Никаких сомнений",
                "Определённо да",
                "Можешь быть уверен в этом",
                "Мне кажется — «да»",
                "Вероятнее всего",
                "Хорошие перспективы",
                "Знаки говорят — «да»",
                "Да",
                "Пока не ясно, попробуй снова",
                "Спроси позже",
                "Лучше не рассказывать",
                "Сейчас нельзя предсказать",
                "Сконцентрируйся и спроси опять",
                "Даже не думай",
                "Мой ответ — «нет»",
                "По моим данным — «нет»",
                "Перспективы не очень хорошие",
                "Весьма сомнительно"]

    @actions = ["Думаю..",
                "Дай подумать...",
                "Дай поразмыслить...",
                "Подожди-ка чуток...",
                "Хмм.."]
  end

  def shake
    answer_index = rand(@answers.length)
    answer = @answers[answer_index]
    action = @actions[rand(@actions.length)]

    puts action
    sleep 2
    color(answer, answer_index)
  end

  def color(answer, answer_index)
    puts answer.blue if (0..4).include?(answer_index)
    puts answer.green if (5..9).include?(answer_index)
    puts answer.yellow if (10..14).include?(answer_index)
    puts answer.red if (15..19).include?(answer_index)
  end
end

puts "Для выхода введите 'exit'\n"
ball = Ball.new

while 1
  puts "Спрашивай, не стесняйся!"
  question = gets.chomp
  break if question == "exit"
  ball.shake
  puts
end
