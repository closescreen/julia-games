# Кот дома

type XY
       x::Int
       y::Int
end

type Prop{T}
 desc::AbstractString
 val::T
end

typealias Props Dict{Symbol,Prop}

type Sm
 name::AbstractString
 xy::XY
 props::Props
end

#type Plate

me = Sm("Человек", XY(1,1), Props(:sleepy=>Prop("спит",false)))


game = Any[
 Sm("Кот Вася", XY(3,3), Props(
	:friendly=>Prop("дружит с вами",true), 
	:silent=>Prop("спокоен",false)))

]