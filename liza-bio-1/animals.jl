#!/usr/bin/env julia

while true
 println(" ---------- Enter - продолжить \n x - конец")
 if STDIN |> readline |> chomp |> x->x=="x" exit() end
if length(ARGS)==0
    println("Нет аргументов")
    files = filter( f->ismatch(r"\.txt",f) ,readdir("."))
    println("Введите имя файла:")
    for f in files println(f) end
    file = chomp(readline(STDIN))
    if file |> isempty file=files[1] end
elseif length(ARGS)==1
    println("Работаем с $(ARGS[1])")
    file=ARGS[1]
else
    ("Выбор между $(ARGS)")
    println("Введите цифру - номер файла по порядку")
    i = readline(STDIN)
    if i |> chomp |> isempty file=ARGS[1] end
    file = ARGS[ parse(Int,i) ]
end

println("=== Тема: $file ===")


a2 = map(s->split(s,"|"), split(open( readall, file),"\n"))
 
ind=0
for animal in a2
    ind=ind+1
    println(animal[1], " = ", ind)
end
println(">>>>>>>>===================")
brosim_kubik(a2) = rand(1:length(a2))


mind = brosim_kubik(a2)

for i in (2:length(a2[mind]) )
    println( a2[mind][i], " ...  ?")
    otv = readline() |> chomp
    if isempty(otv) continue end
    otvd = parse(Int,otv)
    if mind==otvd
	println("Вы выигали! \n !!!!!!!!!!   :-)   !!!!!!!!!!! ")
	break
    else
	println("Неет...")
    end
end
if i==length(a2[mind])
    println("Вы проиграли...\n ---------- \n :( ")
end

end