immutable Direct
 to::Int
 Direct(i::Int) = new((i-1)%4+1)
end

todirect_name(d::Direct) = 
  Dict(1=>"на север",2=>"на восток",3=>"на юг",4=>"на запад")[d.to]

type XY
       x::Int
       y::Int
end

import Base.==
==(xy1::XY,xy2::XY) = xy1.x==xy2.x && xy1.y==xy2.y

"""
  newXY(me.xy, Direct(1))
"""
function newXY(xy::XY, d::Direct)
    if d.to==1  XY(xy.x, xy.y+1)
    elseif d.to==2 XY(xy.x+1, xy.y)
    elseif d.to==3 XY(xy.x, xy.y-1)
    elseif d.to==4 XY(xy.x-1, xy.y)
    else error("bad direct $d") end
end


type BProp
 val::Bool
 tdesc::AbstractString
 fdesc::AbstractString
end

Base.string(p::BProp) = p.val ? p.tdesc : p.fdesc

typealias Props Dict{Symbol,BProp}

Base.string(pp::Props) = join(collect(map(string,values(pp))),", ")

type Some
 name::AbstractString
 xy::XY
 props::Props
end

Base.string(s::Some) = s.name*" "*string(s.props)

type Area
 name::AbstractString
 where::AbstractString
 check::Function
end

Base.string(a::Area) = a.name

"""
  findname(game,Some,"Кот Вася")
  findname(game,Area,"комната")
"""
function findname(game,ty,name)
           findfirst(game) do el
                  typeof(el)<:ty && el.name==name
              end |> i->i>0 ? game[i] : nothing
end

findxyAreaName(game,xy) = join(map(a->a.name, findxyArea(game,xy)),", ")
findxyAreaCheck(game,xy) = join(map(a->a.where, findxyArea(game,xy)),", ")

findxyArea(game,xy) = filter(e->typeof(e)<:Area, findxy(game,xy))

findxySomeName(game,xy) = join(findxySome(game,xy), ", ")
findxySome(game,xy) = filter(e->typeof(e)<:Some, findxy(game,xy))

function findxy(game, xy::XY)
           filter(game) do el
               checkxy(el,xy)
           end
       end


checkxy(el::Some,xy::XY) = el.xy == xy
checkxy(el::Area,xy::XY) = el.check(xy)

function allowed_directoins(game,xy::XY)
 dd = map(Direct, [1,2,3,4])
   filter(dd) do d
       newxy = newXY(me.xy, d)
       !isempty(findxyAreaCheck(game,newxy))
   end
end


statearray(game,me) = [
  "$me",
  me.name*" "*findxyAreaCheck(game,me.xy),
  
  
 ]
