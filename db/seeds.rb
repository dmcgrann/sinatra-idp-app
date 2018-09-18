status_list = {
    "Completed!!" => {
    },
    "About done" => {
    },
    "Halfway there" => {
    },
    "Just started" => {
    },
    "Still planning" => {
    }
  }

status_list.each do |name, user_hash|
  p = Status.new
  p.name = name
  p.save
end