# 13.6 Interactive baby dragon
# page 112

class Dragon

	attr_reader :actions

	def initialize name
		@name = name
		@asleep = false
		@stuff_in_belly = 10
		@stuff_in_intestine = 0
		@actions = ['feed', 'walk', 'put to bed',
					'toss', 'rock']

		puts "#{@name} is born."
	end

	def feed
		puts "You feed #{@name}."
		@stuff_in_belly = 10
		passage_of_time
	end

	def walk
		puts "You walk #{@name}."
		@stuff_in_intestine = 0
		passage_of_time
	end

	def put_to_bed
		puts "You put #{@name} to bed."
		@asleep = true
		3.times do
			if @asleep
				passage_of_time
			end
			if @asleep
				puts "#{@name} snores, filling the room with smoke."
			end
		end
		if @asleep
			@asleep = false
			puts "#{@name} wakes up slowly"
		end
	end

	def toss
		puts "You toss #{@name} up into the air."
		puts "He giggles, which singes your eyebrows."
		passage_of_time
	end

	def rock
		puts "You rock #{@name} gently."
		@asleep = true
		puts 'He briefly dozes off...'
		passage_of_time
		if @asleep
			@asleep = false
			puts '...but wakes when you stop.'
		end
	end

	private
		def hungry?
			@stuff_in_belly <= 2
		end

		def poopy?
			@stuff_in_intestine >= 8
		end

		def passage_of_time
			if @stuff_in_belly > 0
				@stuff_in_belly = @stuff_in_belly - 1
				@stuff_in_intestine = @stuff_in_intestine + 1
			else
				if @asleep
					@asleep = false
					puts 'He wakes up suddenly!'
				end
				puts "#{@name} s starving! In desperation, he at YOU!"
				exit
			end
			if @stuff_in_intestine >= 10
				@stuff_in_intestine = 0
				puts "Whoops! #{@name} had an accident..."
			end

			if hungry?
				if @asleep
					@asleep = false
					puts 'He wakes up suddenly!'
				end
				puts "#{@name}'s stomach grumbles..."
			end

			if poopy?
				if @asleep
					@asleep = false
					puts 'He wakes up suddenly!'
				end
				puts "#{@name} does the potty dance..."
			end
		end
	end


def display_help actions
	actions.each do |action|
		puts action
	end
end

puts 'What would you like to call your dragon?'
pet = gets.chomp
pet = Dragon.new pet
action_list = []
print "Type 'help' for a list of actions. "
print "Type 'bye' to quit.\n"

while true
	action = gets.chomp
	if action == 'help'
		action_list = pet.actions
		display_help action_list
	end
	if action == 'feed' ; pet.feed end
	if action == 'walk' ; pet.walk end
	if action == 'put to bed' ; pet.put_to_bed end
	if action == 'toss' ; pet.toss end
	if action == 'rock' ; pet.rock end
	if action == 'bye' ; exit end
end
