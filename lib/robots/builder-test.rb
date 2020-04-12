require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"

guard = Guard.new
builder = Builder.new
builder.setGuard (guard)
builder.build
