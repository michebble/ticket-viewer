class Interface
  def initialize(viewer)
    @viewer = viewer
  end

  def execute(instruction)
    if instruction.to_i.nonzero?
      action = 'show'
      id = instruction.to_i
      message = "\nEnter 'list' to return to list,\nEnter 'quit' to exit viewer."
    else
      action = instruction.downcase
      message = "\nEnter ticket id to view ticket,\nEnter 'next' or 'previous' to change page,\nEnter 'quit' to exit viewer."
    end
    puts @viewer.send(action, *id)
    puts message
  end
end
