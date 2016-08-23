#!/home/ira/bin/julia --color=yes


yes() = "
O           
 O     O
  O   O
   O O
    O

"


no() = "
O       O
  O   O
    O
  O   O
O       O

"

r10() = round(Int,rand()*10)
r100() = round(Int,rand()*100)


tasks = Array[ 
 Array[ # level 1:
  [ (x,y)->"$x+$y=?", r10, r10, a->a[1]+a[2] ],
  [ (x,y)->"$x-$y=?", r10, r10, a->a[1]-a[2] ]
 ],
 Array[ # level 2:
  [ (x,y)->"$x*$y=?", r10, r10, a->a[1]*a[2] ]
 ],
 Array[ # level3:
  [ (x,y,z)->"$x+$y-$z=?", r10, r10, r10, a->a[1]+a[2]-a[3] ],
  [ (x,y,z)->"$x-$y+$z=?", r10, r10, r10, a->a[1]-a[2]+a[3] ]
 ],
 Array[ # level 4:
  [ (x,y)->"$x+$y=?", r100, r100, a->a[1]+a[2] ],
  [ (x,y)->"$x-$y=?", r100, r100, a->a[1]-a[2] ]
 ],
 Array[ # level 5:
  [ (x,y)->"$x*$y=?", r100, r10, a->a[1]*a[2] ]
 ],
 
 
]

function task()
 let l = rand(tasks[level]);
    args = [ f() for f in l[2:(end-1)] ];
    #println("$args")
    pr = l[1](args...);
    answ = l[end](args);

    #println("$pr $args $answ")
    println(pr)
    otw=parse(Int, chomp(readline(STDIN)))

    if otw==answ 
	print_with_color(:cyan, yes())
	return 1
    else
	print_with_color(:magenta, no())
	return -2
    end
 end
end


rate = 1
level = 1
for i in 1:10
    rate += (task()*level)
    level = round(Int,rate/3)
    if level<1 level=1 end
    println("""Очки: $rate
	    Уровень: $level
	    =================""")
    if rate < 0
	print_with_color(:red, """------------
	 Вы проиграли
	 --------------
	 """)
	exit()
    end	
    if level>length(tasks)
	print_with_color(:green, """ !!!!!!!!!!!!!!
	Вы выиграли !
	!!!!!!!!!!!!!!!
	""")
	exit()
    end	
end



