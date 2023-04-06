require_relative 'selectMenu/menu_list'
require_relative 'selectMenu/select'

class Main
  def start
    puts 'welcome'
    menu_list
    select = Select.new
    loop do
      opt = gets.chomp.to_i
      select.opt_select(opt)
    end
  end
end

main = Main.new
main.start
