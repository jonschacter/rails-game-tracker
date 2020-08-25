jon = User.create(username: "jschacter", password: "password")

clank = Game.create(name: "Clank!", gametype: "Board")
clank.user = jon
clank.save

mario = Game.create(name: "Mario Kart", gametype: "Video")
mario.user = jon
mario.save

poker = Game.create(name: "Texas Hold 'Em", gametype: "Card")
poker.user = jon
poker.save

pandemic = Game.create(name: "Pandemic", gametype: "Board")
pandemic.user = jon
pandemic.save

me = Player.create(name: "Current User")
amy = Player.create(name: "Amy Schacter")
alex = Player.create(name: "Alex Layne")
jordan = Player.create(name: "Jordan Reveley")
jason = Player.create(name: "Jason Gross")

sess1 = GameSession.new
sess1.user = jon
sess1.date = "2020-03-15"
sess1.game = clank
sess1.players = [me, amy]
sess1.winner = [me]
sess1.save

sess2 = GameSession.new
sess2.user = jon
sess2.date = "2020-03-20"
sess2.game = mario
sess2.players = [me, jason, jordan]
sess2.winner = [jason]
sess2.save

sess3 = GameSession.new
sess3.user = jon
sess3.date = "2020-03-21"
sess3.game = mario
sess3.players = [me, amy]
sess3.winner = [me]
sess3.save

sess4 = GameSession.new
sess4.user = jon
sess4.date = "2020-03-22"
sess4.game = clank
sess4.players = [me, amy]
sess4.winner = [amy]
sess4.save

sess5 = GameSession.new
sess5.user = jon
sess5.date = "2020-03-22"
sess5.game = clank
sess5.players = [me, amy]
sess5.winner = [me]
sess5.save

sess6 = GameSession.new
sess6.user = jon
sess6.date = "2020-03-30"
sess6.game = poker
sess6.players = [me, amy, alex, jason, jordan]
sess6.winner = [jordan]
sess6.save

sess7 = GameSession.new
sess7.user = jon
sess7.date = "2020-04-02"
sess7.game = pandemic
sess7.players = [me, amy, alex]
sess7.winner = [me, amy, alex]
sess7.save
