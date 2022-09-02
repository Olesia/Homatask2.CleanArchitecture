Á
öC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\InterfaceAdapter\Interfaces\IApplicationDbContext.cs
	namespace 	
InterfaceAdapter
 
. 

Interfaces %
;% &
public 
	interface !
IApplicationDbContext &
{ 
DbSet		 	
<			 

Category		
 
>		 

Categories		 
{		  
get		! $
;		$ %
}		& '
DbSet 	
<	 

Item
 
> 
Items 
{ 
get 
; 
} 
Task 
< 	
int	 
> 
SaveChangesAsync 
( 
CancellationToken 0
cancellationToken1 B
)B C
;C D
} Ë
ïC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\InterfaceAdapter\Publishers\MessagePublisher.cs
	namespace		 	
InterfaceAdapter		
 
.		 

Publishers		 %
;		% &
public 
class 
MessagePublisher 
: 
IMessagePublisher  1
{ 
private 
const 
string 
	CartTopic "
=# $
$str% 0
;0 1
private 
readonly 
ServiceBusClient %
_serviceBusClient& 7
;7 8
private 
ServiceBusSender 
? 
_sender %
;% &
public 

MessagePublisher 
( 
ServiceBusClient ,
serviceBusClient- =
)= >
{ 
_serviceBusClient 
= 
serviceBusClient ,
;, -
} 
public 

async 
Task #
SendMessageToUpdateItem -
(- .
Item. 2
updatedItem3 >
)> ?
{ 
_sender 
= 
_serviceBusClient #
.# $
CreateSender$ 0
(0 1
	CartTopic1 :
): ;
;; <
var 
message 
= 
new 
ServiceBusMessage +
(+ ,
JsonSerializer, :
.: ;
	Serialize; D
(D E
updatedItemE P
)P Q
)Q R
;R S
try 
{ 	
await 
_sender 
. 
SendMessageAsync *
(* +
message+ 2
)2 3
;3 4
} 	
finally   
{!! 	
await"" 
_sender"" 
."" 
DisposeAsync"" &
(""& '
)""' (
;""( )
}## 	
}$$ 
}%% ∆@
ôC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\InterfaceAdapter\Repositories\CategoryRepository.cs
	namespace 	
InterfaceAdapter
 
. 
Repositories '
;' (
public 
class 
CategoryRepository 
:  !
IRepository" -
<- .
Category. 6
>6 7
{ 
private 
readonly !
IApplicationDbContext *

_dbContext+ 5
;5 6
public 

CategoryRepository 
( !
IApplicationDbContext 3
	dbContext4 =
)= >
{ 

_dbContext 
= 
	dbContext 
; 
} 
public 

async 
Task 
< 
Category 
> 
GetById  '
(' (
int( +
id, .
,. /
CancellationToken0 A
cancellationTokenB S
)S T
{ 
var 
result 
= 
await 

_dbContext %
.% &

Categories& 0
.0 1 
SingleOrDefaultAsync1 E
(E F
cF G
=>H J
cK L
.L M
IdM O
==P R
idS U
,U V
cancellationTokenW h
)h i
;i j
return 
result 
?? 
throw 
new "#
NotFoundEntityException# :
(: ;
$str; S
,S T
idU W
)W X
;X Y
} 
public 

async 
Task 
< 
IEnumerable !
<! "
Category" *
>* +
>+ ,
List- 1
(1 2
CancellationToken2 C
cancellationTokenD U
)U V
{ 
return 
await 

_dbContext 
.  

Categories  *
.* +
ToListAsync+ 6
(6 7
cancellationToken7 H
)H I
;I J
} 
public!! 

async!! 
Task!! 
<!! 
IEnumerable!! !
<!!! "
Category!!" *
>!!* +
>!!+ ,
List!!- 1
(!!1 2

Expression!!2 <
<!!< =
Func!!= A
<!!A B
Category!!B J
,!!J K
bool!!L P
>!!P Q
>!!Q R
?!!R S
	predicate!!T ]
,!!] ^
int!!_ b
?!!b c

pageNumber!!d n
,!!n o
int!!p s
?!!s t
pageSize!!u }
,!!} ~
CancellationToken	!! ê
cancellationToken
!!ë ¢
)
!!¢ £
{"" 

IQueryable## 
<## 
Category## 
>## 
result## #
;### $
if$$ 

($$ 

pageNumber$$ 
!=$$ 
null$$ 
&&$$ !
pageSize$$" *
!=$$+ -
null$$. 2
)$$2 3
{%% 	
result&& 
=&& 
(&& 
	predicate&& 
==&&  "
null&&# '
)&&' (
?&&) *

_dbContext'' 
.'' 

Categories'' %
.''% &
Skip''& *
(''* +
(''+ ,

pageNumber'', 6
.''6 7
Value''7 <
-''= >
$num''? @
)''@ A
*''B C
pageSize''D L
.''L M
Value''M R
)''R S
.''S T
Take''T X
(''X Y
pageSize''Y a
.''a b
Value''b g
)''g h
:''i j

_dbContext(( 
.(( 

Categories(( %
.((% &
Where((& +
(((+ ,
	predicate((, 5
)((5 6
.((6 7
Skip((7 ;
(((; <
(((< =

pageNumber((= G
.((G H
Value((H M
-((N O
$num((P Q
)((Q R
*((S T
pageSize((U ]
.((] ^
Value((^ c
)((c d
.((d e
Take((e i
(((i j
pageSize((j r
.((r s
Value((s x
)((x y
;((y z
})) 	
else** 
{++ 	
result,, 
=,, 
(,, 
	predicate,, 
==,,  "
null,,# '
),,' (
?,,) *

_dbContext-- 
.-- 

Categories-- %
:--& '

_dbContext.. 
... 

Categories.. %
...% &
Where..& +
(..+ ,
	predicate.., 5
)..5 6
;..6 7
}// 	
return00 
await00 
result00 
.00 
ToListAsync00 '
(00' (
cancellationToken00( 9
)009 :
;00: ;
}11 
public33 

async33 
Task33 
Insert33 
(33 
Category33 %
entity33& ,
,33, -
CancellationToken33. ?
cancellationToken33@ Q
)33Q R
{44 

_dbContext55 
.55 

Categories55 
.55 
Add55 !
(55! "
entity55" (
)55( )
;55) *
await66 

_dbContext66 
.66 
SaveChangesAsync66 )
(66) *
cancellationToken66* ;
)66; <
;66< =
}77 
public99 

async99 
Task99 
Update99 
(99 
Category99 %
category99& .
,99. /
CancellationToken990 A
cancellationToken99B S
)99S T
{:: 
var;; 
entity;; 
=;; 
await;; 

_dbContext;; %
.;;% &

Categories;;& 0
.;;0 1 
SingleOrDefaultAsync;;1 E
(;;E F
c;;F G
=>;;H J
c;;K L
.;;L M
Id;;M O
==;;P R
category;;S [
.;;[ \
Id;;\ ^
,;;^ _
cancellationToken;;` q
);;q r
;;;r s
if== 

(== 
entity== 
==== 
null== 
)== 
{>> 	
throw?? 
new?? #
NotFoundEntityException?? -
(??- .
category??. 6
.??6 7
Name??7 ;
,??; <
category??= E
.??E F
Id??F H
)??H I
;??I J
}@@ 	
entityBB 
.BB 
NameBB 
=BB 
categoryBB 
.BB 
NameBB #
;BB# $
entityCC 
.CC 
ImageCC 
=CC 
categoryCC 
.CC  
ImageCC  %
;CC% &
entityDD 
.DD 
ParentCategoryIdDD 
=DD  !
categoryDD" *
.DD* +
ParentCategoryIdDD+ ;
;DD; <
awaitEE 

_dbContextEE 
.EE 
SaveChangesAsyncEE )
(EE) *
cancellationTokenEE* ;
)EE; <
;EE< =
}FF 
publicHH 

asyncHH 
TaskHH 
DeleteHH 
(HH 
intHH  
idHH! #
,HH# $
CancellationTokenHH% 6
cancellationTokenHH7 H
)HHH I
{II 
varJJ 
entityJJ 
=JJ 

_dbContextJJ 
.JJ  

CategoriesJJ  *
.JJ* +
FindJJ+ /
(JJ/ 0
idJJ0 2
)JJ2 3
;JJ3 4
ifKK 

(KK 
entityKK 
==KK 
nullKK 
)KK 
{LL 	
throwMM 
newMM #
NotFoundEntityExceptionMM -
(MM- .
$strMM. H
,MMH I
idMMJ L
)MML M
;MMM N
}NN 	

_dbContextPP 
.PP 

CategoriesPP 
.PP 
RemovePP $
(PP$ %
entityPP% +
)PP+ ,
;PP, -
awaitQQ 

_dbContextQQ 
.QQ 
SaveChangesAsyncQQ )
(QQ) *
cancellationTokenQQ* ;
)QQ; <
;QQ< =
}RR 
}SS ÒB
ïC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\InterfaceAdapter\Repositories\ItemRepository.cs
	namespace 	
InterfaceAdapter
 
. 
Repositories '
;' (
public 
class 
ItemRepository 
: 
IRepository )
<) *
Item* .
>. /
{ 
private 
readonly !
IApplicationDbContext *

_dbContext+ 5
;5 6
public 

ItemRepository 
( !
IApplicationDbContext /
	dbContext0 9
)9 :
{ 

_dbContext 
= 
	dbContext 
; 
} 
public 

async 
Task 
< 
Item 
> 
GetById #
(# $
int$ '
id( *
,* +
CancellationToken, =
cancellationToken> O
)O P
{ 
var 
result 
= 
await 

_dbContext %
.% &
Items& +
.+ , 
SingleOrDefaultAsync, @
(@ A
cA B
=>C E
cF G
.G H
IdH J
==K M
idN P
,P Q
cancellationTokenR c
)c d
;d e
return 
result 
?? 
throw 
new "#
NotFoundEntityException# :
(: ;
$str; O
,O P
idQ S
)S T
;T U
} 
public 

async 
Task 
< 
IEnumerable !
<! "
Item" &
>& '
>' (
List) -
(- .
CancellationToken. ?
cancellationToken@ Q
)Q R
{   
return!! 
await!! 

_dbContext!! 
.!!  
Items!!  %
.!!% &
ToListAsync!!& 1
(!!1 2
cancellationToken!!2 C
)!!C D
;!!D E
}"" 
public$$ 

async$$ 
Task$$ 
<$$ 
IEnumerable$$ !
<$$! "
Item$$" &
>$$& '
>$$' (
List$$) -
($$- .

Expression$$. 8
<$$8 9
Func$$9 =
<$$= >
Item$$> B
,$$B C
bool$$D H
>$$H I
>$$I J
?$$J K
	predicate$$L U
,$$U V
int$$W Z
?$$Z [

pageNumber$$\ f
,$$f g
int$$h k
?$$k l
pageSize$$m u
,$$u v
CancellationToken	$$w à
cancellationToken
$$â ö
)
$$ö õ
{%% 

IQueryable&& 
<&& 
Item&& 
>&& 
result&& 
;&&  
if'' 

('' 

pageNumber'' 
!='' 
null'' 
&&'' !
pageSize''" *
!=''+ -
null''. 2
)''2 3
{(( 	
result)) 
=)) 
()) 
	predicate)) 
==))  "
null))# '
)))' (
?))) *

_dbContext** 
.** 
Items**  
.**  !
Skip**! %
(**% &
(**& '

pageNumber**' 1
.**1 2
Value**2 7
-**8 9
$num**: ;
)**; <
***= >
pageSize**? G
.**G H
Value**H M
)**M N
.**N O
Take**O S
(**S T
pageSize**T \
.**\ ]
Value**] b
)**b c
:**d e

_dbContext++ 
.++ 
Items++  
.++  !
Where++! &
(++& '
	predicate++' 0
)++0 1
.++1 2
Skip++2 6
(++6 7
(++7 8

pageNumber++8 B
.++B C
Value++C H
-++I J
$num++K L
)++L M
*++N O
pageSize++P X
.++X Y
Value++Y ^
)++^ _
.++_ `
Take++` d
(++d e
pageSize++e m
.++m n
Value++n s
)++s t
;++t u
},, 	
else-- 
{.. 	
result// 
=// 
(// 
	predicate// 
==//  "
null//# '
)//' (
?//) *

_dbContext00 
.00 
Items00  
:00! "

_dbContext11 
.11 
Items11  
.11  !
Where11! &
(11& '
	predicate11' 0
)110 1
;111 2
}22 	
return33 
await33 
result33 
.33 
ToListAsync33 '
(33' (
cancellationToken33( 9
)339 :
;33: ;
}44 
public66 

async66 
Task66 
Insert66 
(66 
Item66 !
entity66" (
,66( )
CancellationToken66* ;
cancellationToken66< M
)66M N
{77 

_dbContext88 
.88 
Items88 
.88 
Add88 
(88 
entity88 #
)88# $
;88$ %
await99 

_dbContext99 
.99 
SaveChangesAsync99 )
(99) *
cancellationToken99* ;
)99; <
;99< =
}:: 
public<< 

async<< 
Task<< 
Update<< 
(<< 
Item<< !
entity<<" (
,<<( )
CancellationToken<<* ;
cancellationToken<<< M
)<<M N
{== 
var>> 
itemToUpdate>> 
=>> 
await>>  

_dbContext>>! +
.>>+ ,
Items>>, 1
.>>1 2 
SingleOrDefaultAsync>>2 F
(>>F G
c>>G H
=>>>I K
c>>L M
.>>M N
Id>>N P
==>>Q S
entity>>T Z
.>>Z [
Id>>[ ]
,>>] ^
cancellationToken>>_ p
)>>p q
;>>q r
if@@ 

(@@ 
itemToUpdate@@ 
==@@ 
null@@  
)@@  !
{AA 	
throwBB 
newBB #
NotFoundEntityExceptionBB -
(BB- .
$"BB. 0
$strBB0 ?
{BB? @
entityBB@ F
.BBF G
NameBBG K
}BBK L
$strBBL Z
"BBZ [
,BB[ \
entityBB] c
.BBc d
IdBBd f
)BBf g
;BBg h
}CC 	
itemToUpdateEE 
.EE 
NameEE 
=EE 
entityEE "
.EE" #
NameEE# '
;EE' (
itemToUpdateFF 
.FF 
DescriptionFF  
=FF! "
entityFF# )
.FF) *
DescriptionFF* 5
;FF5 6
itemToUpdateGG 
.GG 
ImageGG 
=GG 
entityGG #
.GG# $
ImageGG$ )
;GG) *
itemToUpdateHH 
.HH 
PriceHH 
=HH 
entityHH #
.HH# $
PriceHH$ )
;HH) *
itemToUpdateII 
.II 
AmountII 
=II 
entityII $
.II$ %
AmountII% +
;II+ ,
awaitKK 

_dbContextKK 
.KK 
SaveChangesAsyncKK )
(KK) *
cancellationTokenKK* ;
)KK; <
;KK< =
}LL 
publicNN 

asyncNN 
TaskNN 
DeleteNN 
(NN 
intNN  
idNN! #
,NN# $
CancellationTokenNN% 6
cancellationTokenNN7 H
)NNH I
{OO 
varPP 
entityPP 
=PP 

_dbContextPP 
.PP  
ItemsPP  %
.PP% &
FindPP& *
(PP* +
idPP+ -
)PP- .
;PP. /
ifQQ 

(QQ 
entityQQ 
==QQ 
nullQQ 
)QQ 
{RR 	
throwSS 
newSS #
NotFoundEntityExceptionSS -
(SS- .
$strSS. H
,SSH I
idSSJ L
)SSL M
;SSM N
}TT 	

_dbContextVV 
.VV 
ItemsVV 
.VV 
RemoveVV 
(VV  
entityVV  &
)VV& '
;VV' (
awaitWW 

_dbContextWW 
.WW 
SaveChangesAsyncWW )
(WW) *
cancellationTokenWW* ;
)WW; <
;WW< =
}XX 
}YY 