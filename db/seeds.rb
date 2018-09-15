training_list = {
    "Public Speaking" => {
    },
    "Training the Trainer" => {
    },
    "Dealing with Difficult People" => {
    },
    "Persuasion 101" => {
    }
  }

training_list.each do |name, user_hash|
  p = Training.new
  p.name = name
  p.save
end