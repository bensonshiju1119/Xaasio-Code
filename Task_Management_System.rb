tasks = []

def create_task(tasks)
  task = {}
  print "Task Name: "
  task[:name] = gets.chomp
  print "Description: "
  task[:description] = gets.chomp
  print "Due Date (DD-MM-YYYY): "
  task[:due_date] = gets.chomp
  print "Category: "
  task[:category] = gets.chomp
  print "Priority (L/M/H): "
  task[:priority] = gets.chomp.upcase
  task[:subtask] = []
  tasks << task
  puts "Task created successfully!"
end

def view_tasks(tasks)
  if tasks.empty?
    puts "No tasks available."
  else
    tasks.each do |task, index|
      puts "\nTask #{index + 1}"
      puts "Name: #{task[:name]}"
      puts "Description: #{task[:description]}"
      puts "Due Date: #{task[:due_date]}"
      puts "Category: #{task[:category]}"
      puts "Priority: #{task[:priority]}"

  if task[:subtask].empty?
    puts "No subtasks available."
  else
    task[:subtask].each do |subtask|
      puts "Name: #{subtask[:name]}"
      puts "Description: #{subtask[:description]}"    
    end
  end
  end
end
end


def create_subtask(task)
  print "Enter the task name this subtask belongs to: "
  task_name = gets.chomp
 
  task = find_task(tasks, task_name)
 
  if task.nil?
    puts "Task not found. Create the task first."
    return
  end
  
  subtask = {}
  print "Subtask Name: "
  subtask[:name] = gets.chomp
  print "Description: "
  subtask[:description] = gets.chomp
  task[:subtask] << subtask
  puts "Subtask created successfully!"
end



def view_subtasks(tasks)
  if task[:subtask].empty?
    puts "No subtasks available."
  else
    task[:subtask].each do |subtask, index|
      puts "\nSubtask #{index + 1}"
      puts "Name: #{subtask[:name]}"
      puts "Description: #{subtask[:description]}"
    end
  end
end

def search_task(tasks)
  print "Enter task name to search: "
  name = gets.chomp

  found = false

  tasks.each do |task|
    if task[:name].downcase == name.downcase
      puts "\nTask Found!"
      puts "Name: #{task[:name]}"
      puts "Description: #{task[:description]}"
      puts "Due Date: #{task[:due_date]}"
      puts "Category: #{task[:category]}"
      puts "Priority: #{task[:priority]}"

      found = true
    end
  end 
  task[:subtask].each do |subtask|
    if subtask[:name].downcase == name.downcase
      puts "\nSubtask Found!"
      puts "Name: #{subtask[:name]}"
      puts "Description: #{subtask[:description]}"

      found = true
    end
  end

  if found == false
    puts "Task not found."
  end
end

def update_task(tasks)
  print "Enter task name to update: "
  name = gets.chomp

  tasks.each do |task|
    if task[:name].downcase == name.downcase

      print "Enter new description: "
      task[:description] = gets.chomp

      print "Enter new due date: "
      task[:due_date] = gets.chomp

      print "Enter new category: "
      task[:category] = gets.chomp

      print "Enter new priority (L/M/H): "
      task[:priority] = gets.chomp.upcase

      puts "Task updated successfully!"
      return
    end
  end
  task[:subtask].each do |subtask|  
    if subtask[:name].downcase == name.downcase
      print "Enter new description: "
      subtask[:description] = gets.chomp

      puts "Subtask updated successfully!"
      return
    end
  end
  puts "Task not found."
end


def delete_task(tasks,subtasks)
  print "Enter task name to delete: "
  name = gets.chomp

  tasks.each do |task, index|
    if task[:name].downcase == name.downcase
      tasks.delete_at(index)
      puts "Task deleted successfully!"
      return
    end
  end
  task[:subtask].each do |subtask, index|
    if subtask[:name].downcase == name.downcase
      task[:subtask].delete_at(index)
      puts "Subtask deleted successfully!"
      return
    end
  end

  puts "Task not found."
end

loop do

  puts "\n===== TASK MANAGEMENT SYSTEM ====="
  puts "1. Create Task"
  puts "2. View Tasks"
  puts "3. Create Subtask"
  puts "4. View Subtasks"
  puts "5. Search Task"
  puts "6. Update"
  puts "7. Delete"
  puts "8. Exit"

  print "Enter your choice: "
  choice = gets.chomp

  case choice

  when "1"
    create_task(tasks)

  when "2"
    view_tasks(tasks)

  when "3"
    create_subtask(tasks)

  when "4"
    view_subtasks(tasks)

  when "5"
    search_task(tasks)

  when "6"
    update_task(tasks)

  when "7"
    delete_task(tasks)

  when "8"
    puts "Thank you!"
    break

  else
    puts "Invalid choice. Please try again."
  end

end