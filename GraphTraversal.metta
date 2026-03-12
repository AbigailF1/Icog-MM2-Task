;A graph traversal in MM2/MeTTa using a stateful, step-by-step recursion style.
;explores one step from the start node.

;edges between nodes 
(edge a b)
(edge b c)
(edge a d)
(edge d e)
(edge e c)
(edge c f)
(edge f g)

(exec 1
    (, (edge $x $y))
    (, (reachable $x $y))
)
(exec 2
    (, (reachable $x $z) (edge $z $y))
    (, (reachable $x $y))
)

(exec 3
    (, (edge $x $y))
    (, (path $x $y ($x $y)))
)
(exec 4
    (, (path $x $z $p) (edge $z $y))
    (, (path $x $y ($p $y)))
)
