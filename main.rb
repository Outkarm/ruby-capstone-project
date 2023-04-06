
require_relative 'selectMenu/menu_list'
require_relative 'selectMenu/select'
require_relative 'app'


class Main
  def start
    puts 'welcome'
    menu_list
    app = App.new
    loop do
      opt = gets.chomp.to_i
      select_option(opt, app)
    end
  end
end

main = Main.new
main.start
