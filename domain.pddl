(define (domain beluga)
  (:requirements :typing :equality :action-costs)
  (:types
		jig - location
		beluga - location
		truck - location
		hanger - location
		production-line - object
		rack - location
		side - object
		num - object
)
  (:constants
		bside - side
		fside - side
		dummy-jig - jig
	)


  (:predicates
		(in ?j - jig ?l - location)
		(empty ?l - location)
		(at-side ?l - location ?s - side) ; location l? accessible from side ?s
		(outgoing ?j - jig ?b - beluga) ; jig ?j has to loaded into beluga ?b
		(to_load ?j1 - jig ?b - beluga)
		(next_load ?j1 - jig ?j2 - jig)
		(in-phase ?b - beluga)
		(to_unload ?j1 - jig ?b - beluga) ; next jig to unload
		(next_unload ?j1 - jig ?j2 - jig) ; successor in unload order
		(to_deliver ?j1 - jig ?pl - production-line)
		(next_deliver ?j1 - jig ?j2 - jig)
		(size ?j - jig ?n - num)
		(empty-size ?j - jig ?n - num)
		(clear ?j - jig ?s - side)
		(free-space ?r - location ?n - num)
		(fit ?n1 - num ?n2 - num ?n3 - num ?r - location)
		(on ?j1 - jig ?j2 - jig ?s - side)
		(next-phase ?b - beluga ?nb - beluga)
	)


  (:functions
		(total-cost )
	)


	(:action load-beluga
		:parameters (?j - jig ?b - beluga ?t - truck ?jn - jig)
		:precondition (and
			(in ?j ?t)
			(empty ?j)
			(at-side ?t bside)
			(outgoing ?j ?b)
			(to_load ?j ?b)
			(next_load ?j ?jn)
			(in-phase ?b)
			(outgoing ?j ?b)
		)
		:effect (and
			(in ?j ?b)
			(not (in ?j ?t))
			(empty ?t)
			(increase (total-cost ) 1)
			(not (to_load ?j ?b))
			(to_load ?jn ?b)
		)
	)





	(:action unload-beluga
		:parameters (?j - jig ?b - beluga ?t - truck ?nj - jig)
		:precondition (and
			(in ?j ?b)
			(empty ?t)
			(at-side ?t bside)
			(to_unload ?j ?b)
			(next_unload ?j ?nj)
			(in-phase ?b)
		)
		:effect (and
			(not (in ?j ?b))
			(in ?j ?t)
			(not (empty ?t))
			(increase (total-cost ) 1)
			(not (to_unload ?j ?b))
			(to_unload ?nj ?b)
		)
	)





	(:action get-from-hanger
		:parameters (?j - jig ?h - hanger ?t - truck)
		:precondition (and
			(in ?j ?h)
			(empty ?t)
			(at-side ?t fside)
		)
		:effect (and
			(not (in ?j ?h))
			(in ?j ?t)
			(not (empty ?t))
			(empty ?h)
			(increase (total-cost ) 1)
		)
	)





	(:action deliver-to-hanger
		:parameters (?j - jig ?h - hanger ?t - truck ?pl - production-line ?jn - jig ?s - num ?es - num)
		:precondition (and
			(in ?j ?t)
			(empty ?h)
			(at-side ?t fside)
			(to_deliver ?j ?pl)
			(next_deliver ?j ?jn)
			(size ?j ?s)
			(empty-size ?j ?es)
		)
		:effect (and
			(empty ?t)
			(empty ?j)
			(increase (total-cost ) 1)
			(not (to_deliver ?j ?pl))
			(to_deliver ?jn ?pl)
			(not (empty ?h))
			(in ?j ?h)
			(not (in ?j ?t))
			(not (size ?j ?s))
			(size ?j ?es)
		)
	)





	(:action put-down-rack
		:parameters (?j - jig ?t - truck ?r - rack ?s - side ?jsize - num ?fspace - num ?nspace - num)
		:precondition (and
			(in ?j ?t)
			(empty ?r)
			(at-side ?t ?s)
			(at-side ?r ?s)
			(size ?j ?jSize)
			(free-space ?r ?fspace)
			(fit ?nspace ?jsize ?fspace ?r)
		)
		:effect (and
			(in ?j ?r)
			(not (in ?j ?t))
			(empty ?t)
			(not (empty ?r))
			(clear ?j bside)
			(clear ?j fside)
			(increase (total-cost ) 1)
			(not (free-space ?r ?fspace))
			(free-space ?r ?nspace)
		)
	)





	(:action stack-rack
		:parameters (?j - jig ?nj - jig ?t - truck ?r - rack ?s - side ?os - side ?jsize - num ?fspace - num ?nspace - num)
		:precondition (and
			(not (= ?s ?os))
			(not (= ?j ?nj))
			(in ?j ?t)
			(in ?nj ?r)
			(at-side ?t ?s)
			(at-side ?r ?s)
			(clear ?nj ?s)
			(size ?j ?jSize)
			(free-space ?r ?fspace)
			(fit ?nspace ?jsize ?fspace ?r)
		)
		:effect (and
			(in ?j ?r)
			(not (in ?j ?t))
			(empty ?t)
			(not (clear ?nj ?s))
			(clear ?j ?s)
			(on ?j ?nj ?s)
			(on ?nj ?j ?os)
			(increase (total-cost ) 1)
			(not (free-space ?r ?fspace))
			(free-space ?r ?nspace)
		)
	)





	(:action pick-up-rack
		:parameters (?j - jig ?t - truck ?r - rack ?s - side ?so - side ?jsize - num ?fspace - num ?nspace - num)
		:precondition (and
			(not (= ?s ?so))
			(empty ?t)
			(in ?j ?r)
			(at-side ?t ?s)
			(at-side ?r ?s)
			(clear ?j bside)
			(clear ?j fside)
			(size ?j ?jSize)
			(free-space ?r ?fspace)
			(fit ?fspace ?jsize ?nspace ?r)
		)
		:effect (and
			(in ?j ?t)
			(not (in ?j ?r))
			(empty ?r)
			(not (empty ?t))
			(not (clear ?j bside))
			(not (clear ?j fside))
			(increase (total-cost ) 1)
			(free-space ?r ?nspace)
			(not (free-space ?r ?fspace))
		)
	)





	(:action unstack-rack
		:parameters (?j - jig ?nj - jig ?t - truck ?r - rack ?s - side ?os - side ?jsize - num ?fspace - num ?nspace - num)
		:precondition (and
			(not (= ?s ?os))
			(not (= ?j ?nj))
			(empty ?t)
			(in ?j ?r)
			(in ?nj ?r)
			(at-side ?t ?s)
			(at-side ?r ?s)
			(clear ?j ?s)
			(on ?j ?nj ?s)
			(on ?nj ?j ?os)
			(size ?j ?jSize)
			(free-space ?r ?fspace)
			(fit ?fspace ?jsize ?nspace ?r)
		)
		:effect (and
			(in ?j ?t)
			(not (in ?j ?r))
			(not (empty ?t))
			(not (on ?j ?nj ?s))
			(not (on ?nj ?j ?os))
			(clear ?nj ?s)
			(increase (total-cost ) 1)
			(free-space ?r ?nspace)
			(not (free-space ?r ?fspace))
		)
	)





	(:action beluga-complete
		:parameters (?b - beluga ?nb - beluga)
		:precondition (and
			(in-phase ?b)
			(next-phase ?b ?nb)
			(to_unload dummy-jig ?b)
			(to_load dummy-jig ?b)
		)
		:effect (and
			(not (in-phase ?b))
			(in-phase ?nb)
			(increase (total-cost ) 1)
		)
	)


)