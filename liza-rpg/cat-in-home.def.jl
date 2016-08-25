# Кот дома

me = Some("Человек", XY(1,1), Props(
		:jobtreatcat=>BProp(false,
			"накормил кота",
			"хочет накормить кота")))




game = Any[
 Area("комната", "в комнате", c::XY->c.x in 1:3 && c.y in 1:3 )
 Some("Кот Вася", XY(1,2), Props(
	:friendly=>BProp(true, "дружит с вами", "прячется от вас"),
	:silent=>BProp(false, "спокоен", "мяукает")))

]


#target = (game)->begin
#  findfirst(game)
#end