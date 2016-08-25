include("types.jl")

games = let ff = map(chomp, `find . -name "*.def.jl"`|>readlines);
  #info(ff)
  [ n=>Dict(
			  :file=>f,
          	  :name=>chomp(open(readlines, f)|>first)
            ) for (n,f) in enumerate(ff) ]
end


for n in games|>keys|>collect|>sort
  game = games[n]
  println("$n - $(game[:name])")
end
println("0 - выход")

gamen = parse(Int, STDIN|>readline|>chomp)::Int # польз вводит N игры
selected_game = get(exit, games, gamen) # данные об игре
selected_game[:file]|>include # выполнить файл определений игры
