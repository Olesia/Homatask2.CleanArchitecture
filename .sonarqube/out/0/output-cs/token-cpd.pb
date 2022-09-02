≥
ÅC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\Common\BaseEntity.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Domain& ,
., -
Common- 3
;3 4
public 
abstract 
class 

BaseEntity  
{ 
public 

int 
Id 
{ 
get 
; 
set 
; 
} 
} æ
ÅC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\Entities\Category.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Domain& ,
., -
Entities- 5
;5 6
public 
class 
Category 
: 

BaseEntity "
{ 
[ 
	MaxLength 
( 
$num 
) 
] 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public

 

string

 
?

 
Image

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 

Category 
? 
ParentCategory #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
public 

int 
? 
ParentCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

Category 
( 
) 
{ 
Name 
= 
Guid 
. 
NewGuid 
( 
) 
. 
ToString &
(& '
)' (
;( )
Image 
= 
null 
; 
} 
} º

äC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\Entities\HateoasLinks\Link.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Domain& ,
., -
Entities- 5
.5 6
HateoasLinks6 B
;B C
public 
class 
Link 
{ 
public 

string 
Href 
{ 
get 
; 
set !
;! "
}# $
public 

string 
Rel 
{ 
get 
; 
set  
;  !
}" #
public 

string 
Method 
{ 
get 
; 
set  #
;# $
}% &
public		 

Link		 
(		 
string		 
href		 
,		 
string		 #
rel		$ '
,		' (
string		) /
method		0 6
)		6 7
{

 
Href 
= 
href 
; 
Rel 
= 
rel 
; 
Method 
= 
method 
; 
} 
} º
ñC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\Entities\HateoasLinks\LinkResourceBase.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Domain& ,
., -
Entities- 5
.5 6
HateoasLinks6 B
;B C
public 
abstract 
class 
LinkResourceBase &
{ 
public 

List 
< 
Link 
> 
Links 
{ 
get !
;! "
set# &
;& '
}( )
=* +
new, /
List0 4
<4 5
Link5 9
>9 :
(: ;
); <
;< =
} ©
ëC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\Entities\HateoasLinks\LinkWrapper.cs
public 
class 
LinkWrapper 
< 
T 
> 
: 
LinkResourceBase .
{ 
public 

T 
Value 
{ 
get 
; 
set 
; 
}  
public 

LinkWrapper 
( 
T 
value 
) 
{ 
Value		 
=		 
value		 
;		 
}

 
} º
}C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\Entities\Item.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Domain& ,
., -
Entities- 5
;5 6
public 
class 
Item 
: 

BaseEntity 
{ 
[ 
	MaxLength 
( 
$num 
) 
] 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public		 

string		 
?		 
Description		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 

string

 
?

 
Image

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
public 

uint 
Amount 
{ 
get 
; 
set !
;! "
}# $
public 

int 

CategoryId 
{ 
get 
;  
set! $
;$ %
}& '
public 

Category 
Category 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 

Item 
( 
) 
{ 
Name 
= 
String 
. 
Empty 
; 
Category 
= 
new 
Category 
(  
)  !
;! "
} 
} ~
|C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Domain\GlobalUsings.cs