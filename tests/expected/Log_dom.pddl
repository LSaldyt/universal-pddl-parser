( DEFINE ( DOMAIN LOGISTICS )
( :REQUIREMENTS :STRIPS :TYPING )
( :TYPES
	VEHICLE - PHYSOBJ
	TRUCK - VEHICLE
	AIRPLANE - VEHICLE
	PHYSOBJ - OBJECT
	PACKAGE - PHYSOBJ
	PLACE - OBJECT
	AIRPORT - PLACE
	LOCATION - PLACE
	CITY - OBJECT
)
( :PREDICATES
	( IN-CITY ?PLACE0 - PLACE ?CITY1 - CITY )
	( AT ?PHYSOBJ0 - PHYSOBJ ?PLACE1 - PLACE )
	( IN ?PACKAGE0 - PACKAGE ?VEHICLE1 - VEHICLE )
)
( :ACTION LOAD-TRUCK
  :PARAMETERS ( ?PACKAGE0 - PACKAGE ?TRUCK1 - TRUCK ?PLACE2 - PLACE )
  :PRECONDITION
	( AND
		( AT ?TRUCK1 ?PLACE2 )
		( AT ?PACKAGE0 ?PLACE2 )
	)
  :EFFECT
	( AND
		( NOT ( AT ?PACKAGE0 ?PLACE2 ) )
		( IN ?PACKAGE0 ?TRUCK1 )
	)
)
( :ACTION LOAD-AIRPLANE
  :PARAMETERS ( ?PACKAGE0 - PACKAGE ?AIRPLANE1 - AIRPLANE ?PLACE2 - PLACE )
  :PRECONDITION
	( AND
		( AT ?PACKAGE0 ?PLACE2 )
		( AT ?AIRPLANE1 ?PLACE2 )
	)
  :EFFECT
	( AND
		( NOT ( AT ?PACKAGE0 ?PLACE2 ) )
		( IN ?PACKAGE0 ?AIRPLANE1 )
	)
)
( :ACTION UNLOAD-TRUCK
  :PARAMETERS ( ?PACKAGE0 - PACKAGE ?TRUCK1 - TRUCK ?PLACE2 - PLACE )
  :PRECONDITION
	( AND
		( AT ?TRUCK1 ?PLACE2 )
		( IN ?PACKAGE0 ?TRUCK1 )
	)
  :EFFECT
	( AND
		( NOT ( IN ?PACKAGE0 ?TRUCK1 ) )
		( AT ?PACKAGE0 ?PLACE2 )
	)
)
( :ACTION UNLOAD-AIRPLANE
  :PARAMETERS ( ?PACKAGE0 - PACKAGE ?AIRPLANE1 - AIRPLANE ?PLACE2 - PLACE )
  :PRECONDITION
	( AND
		( IN ?PACKAGE0 ?AIRPLANE1 )
		( AT ?AIRPLANE1 ?PLACE2 )
	)
  :EFFECT
	( AND
		( NOT ( IN ?PACKAGE0 ?AIRPLANE1 ) )
		( AT ?PACKAGE0 ?PLACE2 )
	)
)
( :ACTION DRIVE-TRUCK
  :PARAMETERS ( ?TRUCK0 - TRUCK ?PLACE1 - PLACE ?PLACE2 - PLACE ?CITY3 - CITY )
  :PRECONDITION
	( AND
		( AT ?TRUCK0 ?PLACE1 )
		( IN-CITY ?PLACE1 ?CITY3 )
		( IN-CITY ?PLACE2 ?CITY3 )
	)
  :EFFECT
	( AND
		( NOT ( AT ?TRUCK0 ?PLACE1 ) )
		( AT ?TRUCK0 ?PLACE2 )
	)
)
( :ACTION FLY-AIRPLANE
  :PARAMETERS ( ?AIRPLANE0 - AIRPLANE ?AIRPORT1 - AIRPORT ?AIRPORT2 - AIRPORT )
  :PRECONDITION
	( AT ?AIRPLANE0 ?AIRPORT1 )
  :EFFECT
	( AND
		( NOT ( AT ?AIRPLANE0 ?AIRPORT1 ) )
		( AT ?AIRPLANE0 ?AIRPORT2 )
	)
)
)
