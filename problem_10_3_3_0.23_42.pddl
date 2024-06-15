(define
	(problem beluga-problem_10_3_3_023_42)
	(:domain beluga)
  (:objects
		; Trucks:
		bt1 - truck
		bt2 - truck
		ft1 - truck
		; Racks:
		rack01 - rack
		rack02 - rack
		rack03 - rack
		; Jigs:
		jig0001 - jig
		jig0002 - jig
		jig0003 - jig
		jig0004 - jig
		jig0005 - jig
		jig0006 - jig
		jig0007 - jig
		jig0008 - jig
		jig0009 - jig
		jig0010 - jig
		; Beluga flights:
		beluga0 - beluga
		beluga1 - beluga
		beluga2 - beluga
		; Hangers:
		hanger1 - hanger
		; Production lines:
		plA - production-line
		; Numbers: {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
		n00 - num
		n01 - num
		n02 - num
		n03 - num
		n04 - num
		n05 - num
		n06 - num
		n07 - num
		n08 - num
		n09 - num
		n10 - num
	)
  (:init
		; Trucks (Beluga side):
		(empty bt1)
		(at-side bt1 bside)
		(empty bt2)
		(at-side bt2 bside)
		; Trucks (Factory side):
		(empty ft1)
		(at-side ft1 fside)
		; Racks 3 (empty, side, free space)
		; Rack:rack01
		(at-side rack01 bside)
		(at-side rack01 fside)
		(free-space rack01 n07)
		(in jig0002 rack01)
		(clear jig0002 bside)
		(clear jig0002 fside)
		; Rack:rack02
		(empty rack02)
		(at-side rack02 bside)
		(at-side rack02 fside)
		(free-space rack02 n10)
		; Rack:rack03
		(at-side rack03 bside)
		(at-side rack03 fside)
		(free-space rack03 n06)
		(in jig0001 rack03)
		(clear jig0001 bside)
		(on jig0001 jig0003 bside)
		(on jig0003 jig0001 fside)
		(in jig0003 rack03)
		(clear jig0003 fside)
		; Jigs (size):
		(size jig0001 n02)
		(empty-size jig0001 n02)
		(empty jig0001)
		(size jig0002 n03)
		(empty-size jig0002 n03)
		(empty jig0002)
		(size jig0003 n02)
		(empty-size jig0003 n02)
		(empty jig0003)
		(size jig0004 n01)
		(empty-size jig0004 n02)
		(size jig0005 n02)
		(empty-size jig0005 n03)
		(size jig0006 n01)
		(empty-size jig0006 n02)
		(size jig0007 n02)
		(empty-size jig0007 n03)
		(size jig0008 n01)
		(empty-size jig0008 n02)
		(size jig0009 n02)
		(empty-size jig0009 n03)
		(size jig0010 n01)
		(empty-size jig0010 n02)
		; Number of flights: 3
		; Incoming jigs unload order:
		; Flight: beluga0
		; 0: jig0005 1: jig0004 2: jig0006
		(to_unload jig0005 beluga0)
		(in jig0005 beluga0)
		(next_unload jig0005 jig0004)
		(in jig0004 beluga0)
		(next_unload jig0004 jig0006)
		(in jig0006 beluga0)
		(next_unload jig0006 dummy-jig)
		; Flight: beluga1
		; 0: jig0008 1: jig0009 2: jig0007
		(to_unload jig0008 beluga1)
		(in jig0008 beluga1)
		(next_unload jig0008 jig0009)
		(in jig0009 beluga1)
		(next_unload jig0009 jig0007)
		(in jig0007 beluga1)
		(next_unload jig0007 dummy-jig)
		; Flight: beluga2
		; 0: jig0010
		(to_unload jig0010 beluga2)
		(in jig0010 beluga2)
		(next_unload jig0010 dummy-jig)
		; Hangers:
		(empty hanger1)
		; Production schedule:
		; 0: jig0005 1: jig0004 2: jig0008 3: jig0006 4: jig0010 5: jig0007
		(to_deliver jig0005 plA)
		(next_deliver jig0005 jig0004)
		(next_deliver jig0004 jig0008)
		(next_deliver jig0008 jig0006)
		(next_deliver jig0006 jig0010)
		(next_deliver jig0010 jig0007)
		(next_deliver jig0007 dummy-jig)
		; Number encoding
		; Sizes fitting rack: rack01
		(fit  n00  n01  n01 rack01)
		(fit  n01  n01  n02 rack01)
		(fit  n00  n02  n02 rack01)
		(fit  n02  n01  n03 rack01)
		(fit  n01  n02  n03 rack01)
		(fit  n00  n03  n03 rack01)
		(fit  n03  n01  n04 rack01)
		(fit  n02  n02  n04 rack01)
		(fit  n01  n03  n04 rack01)
		(fit  n04  n01  n05 rack01)
		(fit  n03  n02  n05 rack01)
		(fit  n02  n03  n05 rack01)
		(fit  n05  n01  n06 rack01)
		(fit  n04  n02  n06 rack01)
		(fit  n03  n03  n06 rack01)
		(fit  n06  n01  n07 rack01)
		(fit  n05  n02  n07 rack01)
		(fit  n04  n03  n07 rack01)
		(fit  n07  n01  n08 rack01)
		(fit  n06  n02  n08 rack01)
		(fit  n05  n03  n08 rack01)
		(fit  n08  n01  n09 rack01)
		(fit  n07  n02  n09 rack01)
		(fit  n06  n03  n09 rack01)
		(fit  n09  n01  n10 rack01)
		(fit  n08  n02  n10 rack01)
		(fit  n07  n03  n10 rack01)
		; Sizes fitting rack: rack02
		(fit  n00  n01  n01 rack02)
		(fit  n01  n01  n02 rack02)
		(fit  n00  n02  n02 rack02)
		(fit  n02  n01  n03 rack02)
		(fit  n01  n02  n03 rack02)
		(fit  n00  n03  n03 rack02)
		(fit  n03  n01  n04 rack02)
		(fit  n02  n02  n04 rack02)
		(fit  n01  n03  n04 rack02)
		(fit  n04  n01  n05 rack02)
		(fit  n03  n02  n05 rack02)
		(fit  n02  n03  n05 rack02)
		(fit  n05  n01  n06 rack02)
		(fit  n04  n02  n06 rack02)
		(fit  n03  n03  n06 rack02)
		(fit  n06  n01  n07 rack02)
		(fit  n05  n02  n07 rack02)
		(fit  n04  n03  n07 rack02)
		(fit  n07  n01  n08 rack02)
		(fit  n06  n02  n08 rack02)
		(fit  n05  n03  n08 rack02)
		(fit  n08  n01  n09 rack02)
		(fit  n07  n02  n09 rack02)
		(fit  n06  n03  n09 rack02)
		(fit  n09  n01  n10 rack02)
		(fit  n08  n02  n10 rack02)
		(fit  n07  n03  n10 rack02)
		; Sizes fitting rack: rack03
		(fit  n00  n01  n01 rack03)
		(fit  n01  n01  n02 rack03)
		(fit  n00  n02  n02 rack03)
		(fit  n02  n01  n03 rack03)
		(fit  n01  n02  n03 rack03)
		(fit  n00  n03  n03 rack03)
		(fit  n03  n01  n04 rack03)
		(fit  n02  n02  n04 rack03)
		(fit  n01  n03  n04 rack03)
		(fit  n04  n01  n05 rack03)
		(fit  n03  n02  n05 rack03)
		(fit  n02  n03  n05 rack03)
		(fit  n05  n01  n06 rack03)
		(fit  n04  n02  n06 rack03)
		(fit  n03  n03  n06 rack03)
		(fit  n06  n01  n07 rack03)
		(fit  n05  n02  n07 rack03)
		(fit  n04  n03  n07 rack03)
		(fit  n07  n01  n08 rack03)
		(fit  n06  n02  n08 rack03)
		(fit  n05  n03  n08 rack03)
		(fit  n08  n01  n09 rack03)
		(fit  n07  n02  n09 rack03)
		(fit  n06  n03  n09 rack03)
		(fit  n09  n01  n10 rack03)
		(fit  n08  n02  n10 rack03)
		(fit  n07  n03  n10 rack03)
		; Flight schedule initial phase:
		(in-phase beluga0)
		; Flight order:
		(next-phase beluga0 beluga1)
		(next-phase beluga1 beluga2)
		; Outgoing jigs load order:
		; 0: jig0002
		(outgoing jig0002 beluga0)
		(to_load jig0002 beluga0)
		(next_load jig0002 dummy-jig)
		; 0: jig0003 1: jig0005
		(outgoing jig0003 beluga1)
		(outgoing jig0005 beluga1)
		(to_load jig0003 beluga1)
		(next_load jig0003 jig0005)
		(next_load jig0005 dummy-jig)
		; 0: jig0004 1: jig0006
		(outgoing jig0004 beluga2)
		(outgoing jig0006 beluga2)
		(to_load jig0004 beluga2)
		(next_load jig0004 jig0006)
		(next_load jig0006 dummy-jig)
		; Action cost:
		(= (total-cost) 0)
	)
  (:goal (and
		; All jigs empty (order defined by production schedule)
		(empty jig0005)
		(empty jig0004)
		(empty jig0008)
		(empty jig0006)
		(empty jig0010)
		(empty jig0007)
		; Outgoing jigs in correct Beluga:
		(in jig0002 beluga0)
		(in jig0003 beluga1)
		(in jig0005 beluga1)
		(in jig0004 beluga2)
		(in jig0006 beluga2)
	))
  (:metric minimize (total-cost))
)