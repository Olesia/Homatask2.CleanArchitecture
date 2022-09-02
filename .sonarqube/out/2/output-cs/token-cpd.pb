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
} ¸
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
private 
static 
ServiceBusSender #
?# $
_sender% ,
;, -
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
}%% •1
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
Task!! 
Insert!! 
(!! 
Category!! %
entity!!& ,
,!!, -
CancellationToken!!. ?
cancellationToken!!@ Q
)!!Q R
{"" 

_dbContext## 
.## 

Categories## 
.## 
Add## !
(##! "
entity##" (
)##( )
;##) *
await$$ 

_dbContext$$ 
.$$ 
SaveChangesAsync$$ )
($$) *
cancellationToken$$* ;
)$$; <
;$$< =
}%% 
public'' 

async'' 
Task'' 
Update'' 
('' 
Category'' %
category''& .
,''. /
CancellationToken''0 A
cancellationToken''B S
)''S T
{(( 
var)) 
entity)) 
=)) 
await)) 

_dbContext)) %
.))% &

Categories))& 0
.))0 1 
SingleOrDefaultAsync))1 E
())E F
c))F G
=>))H J
c))K L
.))L M
Id))M O
==))P R
category))S [
.))[ \
Id))\ ^
,))^ _
cancellationToken))` q
)))q r
;))r s
if++ 

(++ 
entity++ 
==++ 
null++ 
)++ 
{,, 	
throw-- 
new-- #
NotFoundEntityException-- -
(--- .
category--. 6
.--6 7
Name--7 ;
,--; <
category--= E
.--E F
Id--F H
)--H I
;--I J
}.. 	
entity00 
.00 
Name00 
=00 
category00 
.00 
Name00 #
;00# $
entity11 
.11 
Image11 
=11 
category11 
.11  
Image11  %
;11% &
entity22 
.22 
ParentCategoryId22 
=22  !
category22" *
.22* +
ParentCategoryId22+ ;
;22; <
await33 

_dbContext33 
.33 
SaveChangesAsync33 )
(33) *
cancellationToken33* ;
)33; <
;33< =
}44 
public66 

async66 
Task66 
Delete66 
(66 
int66  
id66! #
,66# $
CancellationToken66% 6
cancellationToken667 H
)66H I
{77 
var88 
entity88 
=88 

_dbContext88 
.88  

Categories88  *
.88* +
Find88+ /
(88/ 0
id880 2
)882 3
;883 4
if99 

(99 
entity99 
==99 
null99 
)99 
{:: 	
throw;; 
new;; #
NotFoundEntityException;; -
(;;- .
$str;;. H
,;;H I
id;;J L
);;L M
;;;M N
}<< 	

_dbContext>> 
.>> 

Categories>> 
.>> 
Remove>> $
(>>$ %
entity>>% +
)>>+ ,
;>>, -
await?? 

_dbContext?? 
.?? 
SaveChangesAsync?? )
(??) *
cancellationToken??* ;
)??; <
;??< =
}@@ 
publicBB 

TaskBB 
<BB 
IEnumerableBB 
<BB 
CategoryBB $
>BB$ %
>BB% &
ListBB' +
(BB+ ,

ExpressionBB, 6
<BB6 7
FuncBB7 ;
<BB; <
ItemBB< @
,BB@ A
boolBBB F
>BBF G
>BBG H
?BBH I
	predicateBBJ S
,BBS T
intBBU X
?BBX Y

pageNumberBBZ d
,BBd e
intBBf i
?BBi j
pageSizeBBk s
,BBs t
CancellationToken	BBu Ü
cancellationToken
BBá ò
)
BBò ô
{CC 
throwDD 
newDD #
NotImplementedExceptionDD )
(DD) *
)DD* +
;DD+ ,
}EE 
}FF ÒB
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