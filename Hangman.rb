#class Hangman


def set_lives(lives)
	@lives = lives
end

def get_lives()
	@lives
end

def set_nameArray(names)
	@nameArray = names
end

def get_nameArray()
	@nameArray
end

def set_gWordA(eName)
	@gWord = eName
end

def get_gWordA()
	@gWord
end

def set_word(names)
	@word = names
end

def get_word()
	@word
end

def set_letterPos(letter, i)
	@gWord[i] = letter
end	

def set_guessedLetter(letter)
	@letter = letter
end

def get_guessedLetter()
	@letter
end





		 






def init()
	wordBank = ["james", "gordon", "bruce", "wayne", "fish", "mooney", "carmine", "falcone"]
	prng = Random.new
	wordPos = prng.rand(0..9)
	set_word(wordBank[wordPos])
	set_lives(9)
	set_nameArray(wordBank[wordPos].split(//))
	x = get_word()
	l = (x.length) 
	arr = Array.new(l,"_")
	set_gWordA(arr)
	y = get_gWordA()
	puts y.inspect
	
end


def checkWin()
	x = get_nameArray()
	y = get_gWordA()
	if y.uniq.sort == x.uniq.sort then
		true
	end 
end

def guessLetter()
	lives = get_lives()
	while lives > 0
		puts "Guess a letter in the name"
		uGuessL = gets.chomp
		set_guessedLetter(uGuessL)
		x = get_word()
		l = (x.length)-1
		survive = false
		for i in 0..l
			if uGuessL == x[i] then
				set_letterPos(uGuessL, i)
				survive = true	
			end	
		end
		if checkWin() == true then
			y = get_gWordA()
			puts y.inspect
			puts "The game is over. You win!" 
			break
		end
		if survive == false then
			p = lives -= 1
			set_lives(p)
		end	
		a = get_lives()
		puts "You have #{a} lives left"

		y = get_gWordA()
		puts y.inspect
	end
	if lives == 0 then
		puts "The game is over. You lose!"
	end	
end

init()
guessLetter()
