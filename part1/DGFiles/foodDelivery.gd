
[General]
Version=1

[Preferences]
Username=
Password=2784
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=WILAMOWS
Name=FOODDELIVERY
Count=800

[Record]
Name=MEALDESCRIPTION
Type=VARCHAR2
Size=20
Data=Components.Description
Master=

[Record]
Name=KASHRUS
Type=VARCHAR2
Size=20
Data=Components.Code
Master=

[Record]
Name=TYPEDM
Type=VARCHAR2
Size=1
Data=List('D', 'M')
Master=

[Record]
Name=DELIVERYNUM
Type=NUMBER
Size=
Data=Sequence(500, [1], [1300])
Master=

