# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ReactionCategory.destroy_all

ReactionCategory.create(position: 1, display_html: "Love it")
ReactionCategory.create(position: 2, display_html: "Hate it")
ReactionCategory.create(position: 3, display_html: "Meh")

puts "There are #{ReactionCategory.count} reaction categories in the database"

CommentCategory.destroy_all

CommentCategory.create(position: 1, name: "Claim", description: "What are you trying to prove in your argument?")
CommentCategory.create(position: 2, name: "Evidence", description: "What do you have from the text to support your claim?")
CommentCategory.create(position: 3, name: "Reasoning", description: "How do you link your evidence to your claim?")
CommentCategory.create(position: 3, name: "Counter", description: "What are some opposing positions to your claim?")

puts "There are #{CommentCategory.count} comment categories in the database"
