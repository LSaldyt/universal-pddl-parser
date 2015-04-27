( DEFINE ( PROBLEM LOGISTICS-4-0 )
( :DOMAIN LOGISTICS )
( :OBJECTS
	TRU2 TRU1 - TRUCK
	APN1 - AIRPLANE
	OBJ23 OBJ22 OBJ21 OBJ13 OBJ12 OBJ11 - PACKAGE
	APT1 APT2 - AIRPORT
	POS2 POS1 - LOCATION
	CIT2 CIT1 - CITY
)
( :INIT
	( AT APN1 APT2 )
	( AT TRU1 POS1 )
	( AT OBJ11 POS1 )
	( AT OBJ12 POS1 )
	( AT OBJ13 POS1 )
	( AT TRU2 POS2 )
	( AT OBJ21 POS2 )
	( AT OBJ22 POS2 )
	( AT OBJ23 POS2 )
	( IN-CITY POS1 CIT1 )
	( IN-CITY APT1 CIT1 )
	( IN-CITY POS2 CIT2 )
	( IN-CITY APT2 CIT2 )
)
( :GOAL
	( AND
		( AT OBJ11 APT1 )
		( AT OBJ23 POS1 )
		( AT OBJ13 APT1 )
		( AT OBJ21 POS1 )
	)
)
)