#!/usr/bin/env julia

yes() = "
O           
 O     O
  O   O
   O O
    O" |> println


no() = "
O       O
  O   O
    O
  O   O
O       O " |> println


r10() = round(Int,rand()*10)


tasks = Array[
 [ (x,y)->"$x+$y=?", r10, r10, a->a[1]+a[2] ],
 [ (x,y)->"$x-$y=?", r10, r10, a->a[1]-a[2] ]
]

function task()
 let l = rand(tasks);
    args = [ f() for f in l[2:(end-1)] ];
    #println("$args")
    pr = l[1](args...);
    answ = l[end](args);

    #println("$pr $args $answ")
    println(pr)
    otw=parse(chomp(readline(STDIN)))

    otw==answ ? yes() : no()
end
end


for i in 1:3 task() end



