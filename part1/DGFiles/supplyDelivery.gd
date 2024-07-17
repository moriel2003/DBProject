
[General]
Version=1

[Preferences]
Username=
Password=2135
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=WILAMOWS
Name=SUPPLYSDELIVERY
Count=400

[Record]
Name=NEEDSCOOLING
Type=VARCHAR2
Size=3
Data=List('Yes', 'No')
Master=

[Record]
Name=PROVIDERPHONENUM
Type=NUMBER
Size=
Data=Sequence(2000000000, [1], [3000000000])
Master=

[Record]
Name=PROVIDERADRESS
Type=VARCHAR2
Size=20
Data=Address1
Master=

[Record]
Name=DELIVERYNUM
Type=NUMBER
Size=
Data=Sequence(100, [1], [400])
Master=

