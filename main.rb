require_relative './classes/app'
require_relative './classes/initial'

def main
  app = App.new

  initial(app)
end

main
