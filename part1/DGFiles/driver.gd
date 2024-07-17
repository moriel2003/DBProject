
[General]
Version=1

[Preferences]
Username=
Password=2653
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=WILAMOWS
Name=DRIVER
Count=1200

[Record]
Name=VEHICLE
Type=VARCHAR2
Size=20
Data=List('car', 'bicycle', 'elrctric bicycle', 'scooter', 'truck' )
Master=

[Record]
Name=ISAVAILABLE
Type=VARCHAR2
Size=3
Data=List('Yes', 'No')
Master=

[Record]
Name=PHONENUM
Type=NUMBER
Size=
Data=Sequence(1000000000, [1], [9999999999])
Master=

