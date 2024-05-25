
[General]
Version=1

[Preferences]
Username=
Password=2801
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=WILAMOWS
Name=DELIVERY
Count=400

[Record]
Name=DELIVERYNUM
Type=NUMBER
Size=
Data=Sequence(100, [5], [1234567])
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=20
Data=List('deliverd', 'sent',)
Master=

[Record]
Name=DELIVERYDATE
Type=DATE
Size=
Data=Random(01/01/2000, 01/01/2009)
Master=

[Record]
Name=DELIVERYFINISHEDDATE
Type=DATE
Size=
Data=Random(01/01/2000, 12/12/2009)
Master=

[Record]
Name=PHONENUM
Type=NUMBER
Size=
Data=Sequence(1000000400, [3], [9999999999])
Master=

