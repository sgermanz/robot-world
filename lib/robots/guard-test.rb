require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"

guard = Guard.new
guard.moveToStore
