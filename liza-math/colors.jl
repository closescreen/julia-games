#!/home/ira/bin/julia --color=yes

yes() = "
O           
 O     O
  O   O
   O O
    O"


no() = "
O       O
  O   O
    O
  O   O
O       O "

print_with_color(:red, no())
print_with_color(:cyan, yes())