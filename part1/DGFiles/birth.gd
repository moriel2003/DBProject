
[General]
Version=1

[Preferences]
Username=
Password=2676
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=WILAMOWS
Name=BIRTH
Count=400

[Record]
Name=BIRTHID
Type=NUMBER
Size=
Data=Sequence(1, [1], [400])
Master=

[Record]
Name=BIRTDATE
Type=DATE
Size=
Data=Random(01/01/2000, 12/12/2000)
Master=

[Record]
Name=NUMBEROFBABIES
Type=NUMBER
Size=
Data=Random(1, 6)
Master=

[Record]
Name=PHONENUM
Type=NUMBER
Size=
Data=Sequence(1000001200, [1], [9999999999])
Master=

