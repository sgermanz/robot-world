require "#{Rails.root}/lib/robots/stocker"

stocker = Stocker.new
puts stocker.validate.to_json