Ÿ
≠C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Commands\CreateCategory\CreateCategoryCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Commands= E
.E F
CreateCategoriesF V
;V W
public 
record !
CreateCategoryCommand #
:$ %
IRequest& .
<. /
int/ 2
>2 3
{		 
public

 

int

 
Id

 
{

 
get

 
;

 
set

 
;

 
}

 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

string 
? 
Image 
{ 
get 
; 
set  #
;# $
}% &
public 

int 
? 
ParentCategoryId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
!
CreateCategoryCommand  
(  !
string! '
name( ,
,, -
string. 4
?4 5
image6 ;
,; <
int= @
?@ A
parentCategoryIdB R
)R S
{ 
Name 
= 
name 
; 
Image 
= 
image 
; 
ParentCategoryId 
= 
parentCategoryId +
;+ ,
} 
} 
public 
class (
CreateCategoryCommandHandler )
:* +
IRequestHandler, ;
<; <!
CreateCategoryCommand< Q
,Q R
intS V
>V W
{ 
private 
readonly 
IRepository  
<  !
Category! )
>) *
_repository+ 6
;6 7
public 
(
CreateCategoryCommandHandler '
(' (
IRepository( 3
<3 4
Category4 <
>< =

repository> H
)H I
{   
_repository!! 
=!! 

repository!!  
;!!  !
}"" 
public$$ 

async$$ 
Task$$ 
<$$ 
int$$ 
>$$ 
Handle$$ !
($$! "!
CreateCategoryCommand$$" 7
request$$8 ?
,$$? @
CancellationToken$$A R
cancellationToken$$S d
)$$d e
{%% 
var&& 
entity&& 
=&& 
new&& 
Category&& !
{'' 	
Name(( 
=(( 
request(( 
.(( 
Name(( 
,((  
Image)) 
=)) 
request)) 
.)) 
Image)) !
,))! "
ParentCategoryId** 
=** 
request** &
.**& '
ParentCategoryId**' 7
}++ 	
;++	 

await,, 
_repository,, 
.,, 
Insert,,  
(,,  !
entity,,! '
,,,' (
cancellationToken,,) :
),,: ;
;,,; <
return-- 
entity-- 
.-- 
Id-- 
;-- 
}.. 
}// ˜	
∂C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Commands\CreateCategory\CreateCategoryCommandValidator.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Commands= E
.E F
CreateCategoriesF V
;V W
public 
class *
CreateCategoryCommandValidator +
:, -
AbstractValidator. ?
<? @!
CreateCategoryCommand@ U
>U V
{ 
public 
*
CreateCategoryCommandValidator )
() *
)* +
{ 
RuleFor		 
(		 
v		 
=>		 
v		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 #
(

# $
$str

$ 7
)

7 8
. 
MaximumLength 
( 
$num 
) 
. 
WithMessage *
(* +
$str+ Q
)Q R
;R S
} 
} ã
≠C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Commands\DeleteCategory\DeleteCategoryCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Commands= E
.E F
DeleteCategoryF T
;T U
public 
record !
DeleteCategoryCommand #
(# $
int$ '
Id( *
)* +
:, -
IRequest. 6
;6 7
public

 
class

 (
DeleteCategoryCommandHandler

 )
:

* +
IRequestHandler

, ;
<

; <!
DeleteCategoryCommand

< Q
>

Q R
{ 
private 
readonly 
IRepository  
<  !
Category! )
>) *
_repository+ 6
;6 7
public 
(
DeleteCategoryCommandHandler '
(' (
IRepository( 3
<3 4
Category4 <
>< =

repository> H
)H I
{ 
_repository 
= 

repository  
;  !
} 
public 

async 
Task 
< 
Unit 
> 
Handle "
(" #!
DeleteCategoryCommand# 8
request9 @
,@ A
CancellationTokenB S
cancellationTokenT e
)e f
{ 
await 
_repository 
. 
Delete  
(  !
request! (
.( )
Id) +
,+ ,
cancellationToken- >
)> ?
;? @
return 
Unit 
. 
Value 
; 
} 
} ·
≠C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Commands\UpdateCategory\UpdateCategoryCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Commands= E
.E F
UpdateCategoryF T
;T U
public 
record !
UpdateCategoryCommand #
:$ %
IRequest& .
{		 
public

 
!
UpdateCategoryCommand

  
(

  !
)

! "
{ 
Name 
= 
string 
. 
Empty 
; 
} 
public 

int 
Id 
{ 
get 
; 
init 
; 
}  
public 

string 
Name 
{ 
get 
; 
init "
;" #
}$ %
public 

string 
? 
Image 
{ 
get 
; 
init  $
;$ %
}& '
public 

int 
? 
ParentCategoryId  
{! "
get# &
;& '
init( ,
;, -
}. /
} 
public 
class )
UpdateCategorytCommandHandler *
:+ ,
IRequestHandler- <
<< =!
UpdateCategoryCommand= R
>R S
{ 
private 
readonly 
IRepository  
<  !
Category! )
>) *
_repository+ 6
;6 7
public 
)
UpdateCategorytCommandHandler (
(( )
IRepository) 4
<4 5
Category5 =
>= >

repository? I
)I J
{ 
_repository 
= 

repository  
;  !
} 
public!! 

async!! 
Task!! 
<!! 
Unit!! 
>!! 
Handle!! "
(!!" #!
UpdateCategoryCommand!!# 8
request!!9 @
,!!@ A
CancellationToken!!B S
cancellationToken!!T e
)!!e f
{"" 
var## 
entity## 
=## 
await## 
_repository## &
.##& '
GetById##' .
(##. /
request##/ 6
.##6 7
Id##7 9
,##9 :
cancellationToken##; L
)##L M
;##M N
entity$$ 
.$$ 
Name$$ 
=$$ 
request$$ 
.$$ 
Name$$ "
;$$" #
entity%% 
.%% 
Image%% 
=%% 
request%% 
.%% 
Image%% $
;%%$ %
entity&& 
.&& 
ParentCategoryId&& 
=&&  !
request&&" )
.&&) *
ParentCategoryId&&* :
;&&: ;
await(( 
_repository(( 
.(( 
Update((  
(((  !
entity((! '
,((' (
cancellationToken(() :
)((: ;
;((; <
return** 
Unit** 
.** 
Value** 
;** 
}++ 
},, ı	
∂C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Commands\UpdateCategory\UpdateCategoryCommandValidator.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Commands= E
.E F
UpdateCategoryF T
;T U
public 
class *
UpdateCategoryCommandValidator +
:, -
AbstractValidator. ?
<? @!
UpdateCategoryCommand@ U
>U V
{ 
public 
*
UpdateCategoryCommandValidator )
() *
)* +
{ 
RuleFor		 
(		 
v		 
=>		 
v		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 #
(

# $
$str

$ 7
)

7 8
. 
MaximumLength 
( 
$num 
) 
. 
WithMessage *
(* +
$str+ Q
)Q R
;R S
} 
} Ω
ìC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Queries\CategoryDto.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Queries= D
;D E
public 
class 
CategoryDto 
: 
IMapFrom #
<# $
Category$ ,
>, -
{ 
public 

int 
Id 
{ 
get 
; 
set 
; 
} 
public

 

string

 
Name

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 

string 
? 
Image 
{ 
get 
; 
set  #
;# $
}% &
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
public 

Category 
? 
ParentCategory #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
public 

CategoryDto 
( 
) 
{ 
Name 
= 
string 
. 
Empty 
; 
} 
} º
®C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Queries\GetCategories\GetCategoriesQuery.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Queries= D
.D E
GetCategoriesE R
;R S
public

 
record

 
GetCategoriesQuery

  
:

! "
IRequest

# +
<

+ ,
IEnumerable

, 7
<

7 8
CategoryDto

8 C
>

C D
>

D E
;

E F
public 
class %
GetCategoriesQueryHandler &
:' (
IRequestHandler) 8
<8 9
GetCategoriesQuery9 K
,K L
IEnumerableM X
<X Y
CategoryDtoY d
>d e
>e f
{ 
private 
readonly 
IRepository  
<  !
Category! )
>) *
_repository+ 6
;6 7
private 
readonly 
IMapper 
_mapper $
;$ %
public 
%
GetCategoriesQueryHandler $
($ %
IRepository% 0
<0 1
Category1 9
>9 :

repository; E
,E F
IMapperG N
mapperO U
)U V
{ 
_repository 
= 

repository  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
IEnumerable !
<! "
CategoryDto" -
>- .
>. /
Handle0 6
(6 7
GetCategoriesQuery7 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 
var 

categories 
= 
await 
_repository *
.* +
List+ /
(/ 0
cancellationToken0 A
)A B
;B C
return 
_mapper 
. 
Map 
< 
IEnumerable &
<& '
CategoryDto' 2
>2 3
>3 4
(4 5

categories5 ?
)? @
;@ A
} 
} Õ
§C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Categories\Queries\GetCategory\GetCategoryQuery.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2

Categories2 <
.< =
Queries= D
.D E
GetCategoryE P
;P Q
public		 
record		 
GetCategoryQuery		 
(		 
int		 "
Id		# %
)		% &
:		' (
IRequest		) 1
<		1 2
CategoryDto		2 =
>		= >
;		> ?
public 
class #
GetCategoryQueryHandler $
:% &
IRequestHandler' 6
<6 7
GetCategoryQuery7 G
,G H
CategoryDtoI T
>T U
{ 
private 
readonly 
IRepository  
<  !
Category! )
>) *
_repository+ 6
;6 7
private 
readonly 
IMapper 
_mapper $
;$ %
public 
#
GetCategoryQueryHandler "
(" #
IRepository# .
<. /
Category/ 7
>7 8

repository9 C
,C D
IMapperE L
mapperM S
)S T
{ 
_repository 
= 

repository  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
CategoryDto !
>! "
Handle# )
() *
GetCategoryQuery* :
request; B
,B C
CancellationTokenD U
cancellationTokenV g
)g h
{ 
var 
result 
= 
await 
_repository &
.& '
GetById' .
(. /
request/ 6
.6 7
Id7 9
,9 :
cancellationToken; L
)L M
;M N
return 
_mapper 
. 
Map 
< 
CategoryDto &
>& '
(' (
result( .
). /
;/ 0
} 
} ≠
öC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Behaviours\ValidationBehaviour.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9

Behaviours9 C
;C D
public		 
class		 
ValidationBehaviour		  
<		  !
TRequest		! )
,		) *
	TResponse		+ 4
>		4 5
:		6 7
IPipelineBehavior		8 I
<		I J
TRequest		J R
,		R S
	TResponse		T ]
>		] ^
where

 

TRequest

 
:

 
notnull

 
{ 
private 
readonly 
IEnumerable  
<  !

IValidator! +
<+ ,
TRequest, 4
>4 5
>5 6
_validators7 B
;B C
public 

ValidationBehaviour 
( 
IEnumerable *
<* +

IValidator+ 5
<5 6
TRequest6 >
>> ?
>? @

validatorsA K
)K L
{ 
_validators 
= 

validators  
;  !
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest( 0
request1 8
,8 9
CancellationToken: K
cancellationTokenL ]
,] ^"
RequestHandlerDelegate_ u
<u v
	TResponsev 
>	 Ä
next
Å Ö
)
Ö Ü
{ 
if 

( 
_validators 
. 
Any 
( 
) 
) 
{ 	
var 
context 
= 
new 
ValidationContext /
</ 0
TRequest0 8
>8 9
(9 :
request: A
)A B
;B C
var 
validationResults !
=" #
await$ )
Task* .
.. /
WhenAll/ 6
(6 7
_validators 
. 
Select "
(" #
v# $
=>% '
v 
. 
ValidateAsync #
(# $
context$ +
,+ ,
cancellationToken- >
)> ?
)? @
)@ A
;A B
var 
failures 
= 
validationResults ,
. 
Where 
( 
r 
=> 
r 
. 
Errors $
.$ %
Any% (
(( )
)) *
)* +
. 

SelectMany 
( 
r 
=>  
r! "
." #
Errors# )
)) *
.   
ToList   
(   
)   
;   
if"" 
("" 
failures"" 
."" 
Any"" 
("" 
)"" 
)"" 
throw## 
new## 
ValidationException## -
(##- .
failures##. 6
)##6 7
;##7 8
}$$ 	
return%% 
await%% 
next%% 
(%% 
)%% 
;%% 
}&& 
}'' Õ
ûC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Exceptions\NotFoundEntityException.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9

Exceptions9 C
;C D
public 
class #
NotFoundEntityException $
:% &
	Exception' 0
{ 
public 
#
NotFoundEntityException "
(" #
)# $
: 	
base
 
( 
) 
{ 
} 
public

 
#
NotFoundEntityException

 "
(

" #
string

# )
message

* 1
)

1 2
: 	
base
 
( 
message 
) 
{ 
} 
public 
#
NotFoundEntityException "
(" #
string# )
message* 1
,1 2
	Exception3 <
innerException= K
)K L
: 	
base
 
( 
message 
, 
innerException &
)& '
{ 
} 
public 
#
NotFoundEntityException "
(" #
string# )
name* .
,. /
object0 6
key7 :
): ;
: 	
base
 
( 
$" 
$str 
{ 
name 
}  
$str  $
{$ %
key% (
}( )
$str) 9
"9 :
): ;
{ 
} 
} ¡
öC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Exceptions\ValidationException.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9

Exceptions9 C
;C D
public 
class 
ValidationException  
:! "
	Exception# ,
{ 
public 

ValidationException 
( 
)  
: 	
base
 
( 
$str ?
)? @
{ 
Errors		 
=		 
new		 

Dictionary		 
<		  
string		  &
,		& '
string		( .
[		. /
]		/ 0
>		0 1
(		1 2
)		2 3
;		3 4
}

 
public 

ValidationException 
( 
IEnumerable *
<* +
ValidationFailure+ <
>< =
failures> F
)F G
: 	
this
 
( 
) 
{ 
Errors 
= 
failures 
. 
GroupBy 
( 
e 
=> 
e 
. 
PropertyName (
,( )
e* +
=>, .
e/ 0
.0 1
ErrorMessage1 =
)= >
. 
ToDictionary 
( 
failureGroup &
=>' )
failureGroup* 6
.6 7
Key7 :
,: ;
failureGroup< H
=>I K
failureGroupL X
.X Y
ToArrayY `
(` a
)a b
)b c
;c d
} 
public 

IDictionary 
< 
string 
, 
string %
[% &
]& '
>' (
Errors) /
{0 1
get2 5
;5 6
}7 8
} Á
òC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Interfaces\IMessagePublisher.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9

Interfaces9 C
;C D
public 
	interface 
IMessagePublisher "
{ 
Task #
SendMessageToUpdateItem	  
(  !
Item! %
updatedItem& 1
)1 2
;2 3
} Ω
íC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Interfaces\IRepository.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9

Interfaces9 C
;C D
public 
	interface 
IRepository 
< 
T 
> 
where  %
T& '
:( )

BaseEntity* 4
{		 
Task

 
<

 	
IEnumerable

	 
<

 
T

 
>

 
>

 
List

 
(

 
CancellationToken

 /
cancellationToken

0 A
)

A B
;

B C
Task 
< 	
IEnumerable	 
< 
T 
> 
> 
List 
( 

Expression (
<( )
Func) -
<- .
Item. 2
,2 3
bool4 8
>8 9
>9 :
?: ;
	predicate< E
,E F
intG J
?J K

pageNumberL V
,V W
intX [
?[ \
pageSize] e
,e f
CancellationTokeng x
cancellationToken	y ä
)
ä ã
;
ã å
Task 
< 	
T	 

>
 
GetById 
( 
int 
id 
, 
CancellationToken -
cancellationToken. ?
)? @
;@ A
Task 
Insert	 
( 
T 
entity 
, 
CancellationToken +
cancellationToken, =
)= >
;> ?
Task 
Update	 
( 
T 
entity 
, 
CancellationToken +
cancellationToken, =
)= >
;> ?
Task 
Delete	 
( 
int 
id 
, 
CancellationToken )
cancellationToken* ;
); <
;< =
} Ÿ
çC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Mappings\IMapFrom.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9
Mappings9 A
;A B
public 
	interface 
IMapFrom 
< 
T 
> 
{ 
void 
Mapping	 
( 
Profile 
profile  
)  !
=>" $
profile% ,
., -
	CreateMap- 6
(6 7
typeof7 =
(= >
T> ?
)? @
,@ A
GetTypeB I
(I J
)J K
)K L
;L M
} ı#
ìC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Common\Mappings\MappingProfile.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Common2 8
.8 9
Mappings9 A
;A B
public 
class 
MappingProfile 
: 
Profile %
{ 
public		 

MappingProfile		 
(		 
)		 
{

 %
ApplyMappingsFromAssembly !
(! "
Assembly" *
.* + 
GetExecutingAssembly+ ?
(? @
)@ A
)A B
;B C
} 
private 
void %
ApplyMappingsFromAssembly *
(* +
Assembly+ 3
assembly4 <
)< =
{ 
var 
mapFromType 
= 
typeof  
(  !
IMapFrom! )
<) *
>* +
)+ ,
;, -
var 
mappingMethodName 
= 
nameof  &
(& '
IMapFrom' /
</ 0
object0 6
>6 7
.7 8
Mapping8 ?
)? @
;@ A
bool 
HasInterface 
( 
Type 
t  
)  !
=>" $
t% &
.& '
IsGenericType' 4
&&5 7
t8 9
.9 :$
GetGenericTypeDefinition: R
(R S
)S T
==U W
mapFromTypeX c
;c d
var 
types 
= 
assembly 
. 
GetExportedTypes -
(- .
). /
./ 0
Where0 5
(5 6
t6 7
=>8 :
t; <
.< =
GetInterfaces= J
(J K
)K L
.L M
AnyM P
(P Q
HasInterfaceQ ]
)] ^
)^ _
._ `
ToList` f
(f g
)g h
;h i
var 
argumentTypes 
= 
new 
Type  $
[$ %
]% &
{' (
typeof) /
(/ 0
Profile0 7
)7 8
}9 :
;: ;
foreach 
( 
var 
type 
in 
types "
)" #
{ 	
var 
instance 
= 
	Activator $
.$ %
CreateInstance% 3
(3 4
type4 8
)8 9
;9 :
var 

methodInfo 
= 
type !
.! "
	GetMethod" +
(+ ,
mappingMethodName, =
)= >
;> ?
if   
(   

methodInfo   
!=   
null   "
)  " #
{!! 

methodInfo"" 
."" 
Invoke"" !
(""! "
instance""" *
,""* +
new"", /
object""0 6
[""6 7
]""7 8
{""9 :
this""; ?
}""@ A
)""A B
;""B C
}## 
else$$ 
{%% 
var&& 

interfaces&& 
=&&  
type&&! %
.&&% &
GetInterfaces&&& 3
(&&3 4
)&&4 5
.&&5 6
Where&&6 ;
(&&; <
HasInterface&&< H
)&&H I
.&&I J
ToList&&J P
(&&P Q
)&&Q R
;&&R S
if(( 
((( 

interfaces(( 
.(( 
Count(( $
>((% &
$num((' (
)((( )
{)) 
foreach** 
(** 
var**  

@interface**! +
in**, .

interfaces**/ 9
)**9 :
{++ 
var,, 
interfaceMethodInfo,, /
=,,0 1

@interface,,2 <
.,,< =
	GetMethod,,= F
(,,F G
mappingMethodName,,G X
,,,X Y
argumentTypes,,Z g
),,g h
;,,h i
interfaceMethodInfo.. +
?..+ ,
..., -
Invoke..- 3
(..3 4
instance..4 <
,..< =
new..> A
object..B H
[..H I
]..I J
{..K L
this..M Q
}..R S
)..S T
;..T U
}// 
}00 
}11 
}22 	
}33 
}44 Æ
ÜC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\ConfigureServices.cs
	namespace		 	
	Microsoft		
 
.		 

Extensions		 
.		 
DependencyInjection		 2
;		2 3
public 
static 
class 
ConfigureServices %
{ 
public 

static 
IServiceCollection $"
AddApplicationServices% ;
(; <
this< @
IServiceCollectionA S
servicesT \
)\ ]
{ 
services 
. 
AddAutoMapper 
( 
Assembly '
.' ( 
GetExecutingAssembly( <
(< =
)= >
)> ?
;? @
services 
. %
AddValidatorsFromAssembly *
(* +
Assembly+ 3
.3 4 
GetExecutingAssembly4 H
(H I
)I J
)J K
;K L
services 
. 

AddMediatR 
( 
Assembly $
.$ % 
GetExecutingAssembly% 9
(9 :
): ;
); <
;< =
services 
. 
AddTransient 
( 
typeof $
($ %
IPipelineBehavior% 6
<6 7
,7 8
>8 9
)9 :
,: ;
typeof< B
(B C
ValidationBehaviourC V
<V W
,W X
>X Y
)Y Z
)Z [
;[ \
return 
services 
; 
} 
} î
†C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Commands\CreateItem\CreateItemCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Commands8 @
.@ A

CreateItemA K
;K L
public 
record 
CreateItemCommand 
:  !
IRequest" *
<* +
int+ .
>. /
{		 
public

 

string

 
Name

 
{

 
get

 
;

 
init

 "
;

" #
}

$ %
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
Image 
{ 
get 
; 
set "
;" #
}$ %
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
public 

uint 
Amount 
{ 
get 
; 
set !
;! "
}# $
public 

int 

CategoryId 
{ 
get 
;  
set! $
;$ %
}& '
public 

CreateItemCommand 
( 
) 
{ 
Name 
= 
string 
. 
Empty 
; 
Description 
= 
string 
. 
Empty "
;" #
Image 
= 
string 
. 
Empty 
; 
} 
} 
public 
class $
CreateItemCommandHandler %
:& '
IRequestHandler( 7
<7 8
CreateItemCommand8 I
,I J
intK N
>N O
{ 
private 
readonly 
IRepository  
<  !
Item! %
>% &
_repository' 2
;2 3
public 
$
CreateItemCommandHandler #
(# $
IRepository$ /
</ 0
Item0 4
>4 5

repository6 @
)@ A
{ 
_repository 
= 

repository  
;  !
}   
public"" 

async"" 
Task"" 
<"" 
int"" 
>"" 
Handle"" !
(""! "
CreateItemCommand""" 3
request""4 ;
,""; <
CancellationToken""= N
cancellationToken""O `
)""` a
{## 
var$$ 
entity$$ 
=$$ 
new$$ 
Item$$ 
{%% 	
Name&& 
=&& 
request&& 
.&& 
Name&& 
,&&  
Image'' 
='' 
request'' 
.'' 
Image'' !
,''! "
Description(( 
=(( 
request(( !
.((! "
Description((" -
,((- .
Amount)) 
=)) 
request)) 
.)) 
Amount)) #
,))# $
Price** 
=** 
request** 
.** 
Price** !
,**! "

CategoryId++ 
=++ 
request++  
.++  !

CategoryId++! +
},, 	
;,,	 

await.. 
_repository.. 
... 
Insert..  
(..  !
entity..! '
,..' (
cancellationToken..) :
)..: ;
;..; <
return// 
entity// 
.// 
Id// 
;// 
}00 
}11 ”	
©C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Commands\CreateItem\CreateItemCommandValidator.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Commands8 @
.@ A

CreateItemA K
;K L
public 
class &
CreateItemCommandValidator '
:( )
AbstractValidator* ;
<; <
CreateItemCommand< M
>M N
{ 
public 
&
CreateItemCommandValidator %
(% &
)& '
{ 
RuleFor		 
(		 
v		 
=>		 
v		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 #
(

# $
$str

$ 7
)

7 8
. 
MaximumLength 
( 
$num 
) 
. 
WithMessage *
(* +
$str+ Q
)Q R
;R S
} 
} Ÿ
†C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Commands\DeleteItem\DeleteItemCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Commands8 @
.@ A

DeleteItemA K
;K L
public		 
record		 
DeleteItemCommand		 
(		  
int		  #
Id		$ &
)		& '
:		( )
IRequest		* 2
;		2 3
public 
class $
DeleteItemCommandHandler %
:& '
IRequestHandler( 7
<7 8
DeleteItemCommand8 I
>I J
{ 
private 
readonly 
IRepository  
<  !
Item! %
>% &
_repository' 2
;2 3
public 
$
DeleteItemCommandHandler #
(# $
IRepository$ /
</ 0
Item0 4
>4 5

repository6 @
)@ A
{ 
_repository 
= 

repository  
;  !
} 
public 

async 
Task 
< 
Unit 
> 
Handle "
(" #
DeleteItemCommand# 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
)a b
{ 
await 
_repository 
. 
Delete  
(  !
request! (
.( )
Id) +
,+ ,
cancellationToken- >
)> ?
;? @
return 
Unit 
. 
Value 
; 
} 
} Û%
†C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Commands\UpdateItem\UpdateItemCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Commands8 @
.@ A

UpdateItemA K
;K L
public 
record 
UpdateItemCommand 
:  !
IRequest" *
{		 
public

 

int

 
Id

 
{

 
get

 
;

 
init

 
;

 
}

  
public 

string 
Name 
{ 
get 
; 
init "
;" #
}$ %
public 

string 
Description 
{ 
get  #
;# $
init% )
;) *
}+ ,
public 

string 
Image 
{ 
get 
; 
init #
;# $
}% &
public 

decimal 
Price 
{ 
get 
; 
init  $
;$ %
}& '
public 

uint 
Amount 
{ 
get 
; 
init "
;" #
}$ %
public 

int 

CategoryId 
{ 
get 
;  
init! %
;% &
}' (
public 

UpdateItemCommand 
( 
) 
{ 
Name 
= 
string 
. 
Empty 
; 
Description 
= 
string 
. 
Empty "
;" #
Image 
= 
string 
. 
Empty 
; 
} 
} 
public 
class $
UpdateItemCommandHandler %
:& '
IRequestHandler( 7
<7 8
UpdateItemCommand8 I
>I J
{ 
private 
readonly 
IRepository  
<  !
Item! %
>% &
_repository' 2
;2 3
private 
readonly 
IMessagePublisher &

_publisher' 1
;1 2
public 
$
UpdateItemCommandHandler #
(# $
IRepository$ /
</ 0
Item0 4
>4 5

repository6 @
,@ A
IMessagePublisherB S
	publisherT ]
)] ^
{   
_repository!! 
=!! 

repository!!  
;!!  !

_publisher"" 
="" 
	publisher"" 
;"" 
}## 
public%% 

async%% 
Task%% 
<%% 
Unit%% 
>%% 
Handle%% "
(%%" #
UpdateItemCommand%%# 4
request%%5 <
,%%< =
CancellationToken%%> O
cancellationToken%%P a
)%%a b
{&& 
var'' 
entity'' 
='' 
await'' 
_repository'' &
.''& '
GetById''' .
(''. /
request''/ 6
.''6 7
Id''7 9
,''9 :
cancellationToken''; L
)''L M
;''M N
entity(( 
.(( 
Name(( 
=(( 
request(( 
.(( 
Name(( "
;((" #
entity)) 
.)) 
Image)) 
=)) 
request)) 
.)) 
Image)) $
;))$ %
entity** 
.** 
Amount** 
=** 
request** 
.**  
Amount**  &
;**& '
entity++ 
.++ 
Price++ 
=++ 
request++ 
.++ 
Price++ $
;++$ %
entity,, 
.,, 
Description,, 
=,, 
request,, $
.,,$ %
Description,,% 0
;,,0 1
entity-- 
.-- 

CategoryId-- 
=-- 
request-- #
.--# $

CategoryId--$ .
;--. /
await// 
_repository// 
.// 
Update//  
(//  !
entity//! '
,//' (
cancellationToken//) :
)//: ;
;//; <
await11 

_publisher11 
.11 #
SendMessageToUpdateItem11 0
(110 1
entity111 7
)117 8
;118 9
return33 
Unit33 
.33 
Value33 
;33 
}44 
}55 ”	
©C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Commands\UpdateItem\UpdateItemCommandValidator.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Commands8 @
.@ A

UpdateItemA K
;K L
public 
class &
UpdateItemCommandValidator '
:( )
AbstractValidator* ;
<; <
UpdateItemCommand< M
>M N
{ 
public 
&
UpdateItemCommandValidator %
(% &
)& '
{ 
RuleFor		 
(		 
v		 
=>		 
v		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 #
(

# $
$str

$ 7
)

7 8
. 
MaximumLength 
( 
$num 
) 
. 
WithMessage *
(* +
$str+ Q
)Q R
;R S
} 
} Œ
ôC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Queries\GetItems\GetItemsQuery.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Queries8 ?
.? @
GetItems@ H
;H I
public 
record 
GetItemsQuery 
: 
IRequest &
<& '
IEnumerable' 2
<2 3
ItemDto3 :
>: ;
>; <
{ 
public 

int 
? 

CategoryId 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
;/ 0
public 

int 
? 

PageNumber 
{ 
get  
;  !
init" &
;& '
}( )
public 

int 
? 
PageSize 
{ 
get 
; 
init  $
;$ %
}& '
} 
public 
class  
GetItemsQueryHandler !
:" #
IRequestHandler$ 3
<3 4
GetItemsQuery4 A
,A B
IEnumerableC N
<N O
ItemDtoO V
>V W
>W X
{ 
private 
readonly 
IRepository  
<  !
Item! %
>% &
_repository' 2
;2 3
private 
readonly 
IMapper 
_mapper $
;$ %
public 
 
GetItemsQueryHandler 
(  
IRepository  +
<+ ,
Item, 0
>0 1

repository2 <
,< =
IMapper> E
mapperF L
)L M
{ 
_repository 
= 

repository  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
IEnumerable !
<! "
ItemDto" )
>) *
>* +
Handle, 2
(2 3
GetItemsQuery3 @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{   
if!! 

(!! 
request!! 
==!! 
null!! 
)!! 
{!! 
return!! %

Enumerable!!& 0
.!!0 1
Empty!!1 6
<!!6 7
ItemDto!!7 >
>!!> ?
(!!? @
)!!@ A
;!!A B
}!!C D

Expression## 
<## 
Func## 
<## 
Item## 
,## 
bool## "
>##" #
>### $
?##$ %
categoryFilter##& 4
=##5 6
(##7 8
request##8 ?
.##? @

CategoryId##@ J
!=##K M
null##N R
)##R S
?##T U
e##V W
=>##X Z
e##[ \
.##\ ]

CategoryId##] g
==##h j
request##k r
.##r s

CategoryId##s }
:##~ 
null
##Ä Ñ
;
##Ñ Ö
var$$ 

categories$$ 
=$$ 
await$$ 
_repository$$ *
.$$* +
List$$+ /
($$/ 0
categoryFilter$$0 >
,$$> ?
request$$@ G
.$$G H

PageNumber$$H R
,$$R S
request$$T [
.$$[ \
PageSize$$\ d
,$$d e
cancellationToken$$f w
)$$w x
;$$x y
return%% 
_mapper%% 
.%% 
Map%% 
<%% 
IEnumerable%% &
<%%& '
ItemDto%%' .
>%%. /
>%%/ 0
(%%0 1

categories%%1 ;
)%%; <
;%%< =
}&& 
}'' ï
ôC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Queries\GetItem\GetItemCommand.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Queries8 ?
.? @
GetItem@ G
;G H
public		 
record		 
GetItemQuery		 
(		 
int		 
Id		 !
)		! "
:		# $
IRequest		% -
<		- .
ItemDto		. 5
>		5 6
;		6 7
public 
class #
GetCategoryQueryHandler $
:% &
IRequestHandler' 6
<6 7
GetItemQuery7 C
,C D
ItemDtoE L
>L M
{ 
private 
readonly 
IRepository  
<  !
Item! %
>% &
_repository' 2
;2 3
private 
readonly 
IMapper 
_mapper $
;$ %
public 
#
GetCategoryQueryHandler "
(" #
IRepository# .
<. /
Item/ 3
>3 4

repository5 ?
,? @
IMapperA H
mapperI O
)O P
{ 
_repository 
= 

repository  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
ItemDto 
> 
Handle %
(% &
GetItemQuery& 2
request3 :
,: ;
CancellationToken< M
cancellationTokenN _
)_ `
{ 
var 
result 
= 
await 
_repository &
.& '
GetById' .
(. /
request/ 6
.6 7
Id7 9
,9 :
cancellationToken; L
)L M
;M N
return 
_mapper 
. 
Map 
< 
ItemDto "
>" #
(# $
result$ *
)* +
;+ ,
} 
} €
äC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\Application\Items\Queries\ItemDto.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
Application& 1
.1 2
Items2 7
.7 8
Queries8 ?
;? @
public 
class 
ItemDto 
: 
IMapFrom 
<  
Item  $
>$ %
{ 
public 

int 
Id 
{ 
get 
; 
set 
; 
} 
public

 

string

 
Name

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 

string 
? 
Description 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

string 
? 
Image 
{ 
get 
; 
set  #
;# $
}% &
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
public 

uint 
Amount 
{ 
get 
; 
set !
;! "
}# $
public 

int 

CategoryId 
{ 
get 
;  
set! $
;$ %
}& '
} 