(mod3 Z Z)
(mod3 (S Z) (S Z))
(mod3 (S (S Z)) (S (S Z)))
(mod3 (S (S (S Z))) Z)
(mod3 (S (S (S (S Z)))) (S Z))
(mod3 (S (S (S (S (S Z))))) (S (S Z)))
(mod3 (S (S (S (S (S (S Z)))))) Z)
(mod3 (S (S (S (S (S (S (S Z))))))) (S Z))
(mod3 (S (S (S (S (S (S (S (S Z)))))))) (S (S Z)))
(mod3 (S (S (S (S (S (S (S (S (S Z))))))))) Z)
(mod3 (S (S (S (S (S (S (S (S (S (S Z)))))))))) (S Z))
(mod3 (S (S (S (S (S (S (S (S (S (S (S Z))))))))))) (S (S Z)))
(mod3 (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))) Z)
(mod3 (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))) (S Z))
(mod3 (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))))) (S (S Z)))
(mod3 ((S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))) Z)

(mod5 Z Z)
(mod5 (S Z) (S Z))
(mod5 (S (S Z)) (S (S Z)))
(mod5 (S (S (S Z))) (S (S (S Z))))
(mod5 (S (S (S (S Z)))) (S (S (S (S Z)))))
(mod5 (S (S (S (S (S Z))))) Z)
(mod5 (S (S (S (S (S (S Z)))))) (S Z))
(mod5 (S (S (S (S (S (S (S Z))))))) (S (S Z)))
(mod5 (S (S (S (S (S (S (S (S Z)))))))) (S (S (S Z))))
(mod5 (S (S (S (S (S (S (S (S (S Z))))))))) (S (S (S (S Z)))))
(mod5 (S (S (S (S (S (S (S (S (S (S Z)))))))))) Z)
(mod5 (S (S (S (S (S (S (S (S (S (S (S Z))))))))))) (S Z))
(mod5 (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))) (S (S Z)))
(mod5 (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))) (S (S (S Z))))
(mod5 (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))))) (S (S (S (S Z)))))
(mod5 ((S (S (S (S (S (S (S (S (S (S (S (S (S (S Z))))))))))))))) Z)


;; FizzBuzz
(exec 1 
    (, (state $ts (number $n)) (mod3 $n Z) (mod5 $n Z)) 
    (, (fizzbuzz $n FizzBuzz))
)

;; Fizz
(exec 1 
    (, (state $ts (number $n)) (mod3 $n Z) (mod5 $n (S $r)))
    (, (fizzbuzz $n Fizz))
)

;; Buzz
(exec 1 
    (, (state $ts (number $n)) (mod5 $n Z) (mod3 $n (S $r)))
    (, (fizzbuzz $n Buzz))
)

;; Default
(exec 1 
    (, (state $ts (number $n)) (mod3 $n (S $r3)) (mod5 $n (S $r5)))
    (, (fizzbuzz $n $n))
)


(state Z (number (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S Z)))))))))))))))))

((step DOWN $ts)
    (, (state $ts (number (S $n))))
    (, (state (S $ts) (number $n)))
)

((step STOP $ts)
    (, (state $ts (number Z)))
    (, (HALTED $ts))
)

(exec (clocked Z)
    (, (exec (clocked $ts) $p1 $t1)
       (state $ts (number (S $any)))
       ((step DOWN $ts) $p0 $t0))
    (, (exec (DOWN $ts) $p0 $t0)
       (exec (clocked (S $ts)) $p1 $t1))
)