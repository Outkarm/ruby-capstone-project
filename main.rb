require_relative 'selectMenu/menu_list'
require_relative 'selectMenu/select'
require_relative 'app'

class Main
  def start
    puts 'welcome'
    app = App.new
    loop do
      menu_list
      opt = gets.chomp.to_i
      select_option(opt, app)
    end
  end
end

main = Main.new
main.start
