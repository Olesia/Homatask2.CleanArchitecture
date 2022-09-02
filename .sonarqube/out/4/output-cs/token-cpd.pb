Í
€C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\WebUI\ConfigureServices.cs
	namespace 	
	Microsoft
 
. 

Extensions 
. 
DependencyInjection 2
;2 3
public 
static 
class 
ConfigureServices %
{		 
public

 

static

 
IServiceCollection

 $
AddWebUIServices

% 5
(

5 6
this

6 :
IServiceCollection

; M
services

N V
)

V W
{ 
services 
. 3
'AddDatabaseDeveloperPageExceptionFilter 8
(8 9
)9 :
;: ;
services 
. "
AddHttpContextAccessor '
(' (
)( )
;) *
services 
. 
AddHealthChecks  
(  !
)! "
. 
AddDbContextCheck 
<  
ApplicationDbContext 3
>3 4
(4 5
)5 6
;6 7
services 
. 
AddRazorPages 
( 
)  
;  !
services 
. 
	Configure 
< 
ApiBehaviorOptions -
>- .
(. /
options/ 6
=>7 9
options 
. +
SuppressModelStateInvalidFilter 3
=4 5
true6 :
): ;
;; <
return 
services 
; 
} 
} ÏK
vC:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\WebUI\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. "
AddApplicationServices '
(' (
)( )
;) *
builder 
. 
Services 
. %
AddInfrastructureServices *
(* +
builder+ 2
.2 3
Configuration3 @
)@ A
;A B
builder 
. 
Services 
. 
AddWebUIServices !
(! "
)" #
;# $
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
using 
( 
var 

scope 
= 
app 
. 
Services 
.  
CreateScope  +
(+ ,
), -
)- .
{ 
var 
initialiser 
= 
scope 
. 
ServiceProvider +
.+ ,
GetRequiredService, >
<> ?+
ApplicationDbContextInitialiser? ^
>^ _
(_ `
)` a
;a b
await 	
initialiser
 
. 
InitialiseAsync %
(% &
)& '
;' (
await 	
initialiser
 
. 
	SeedAsync 
(  
)  !
;! "
var   
mediator   
=   
scope   
.   
ServiceProvider   (
.  ( )
GetRequiredService  ) ;
<  ; <
	IMediator  < E
>  E F
(  F G
)  G H
;  H I
Console## 
.## 
	WriteLine## 
(## 
$str## 6
)##6 7
;##7 8
var$$ 

categories$$ 
=$$ 
await$$ 
mediator$$ #
.$$# $
Send$$$ (
($$( )
new$$) ,
GetCategoriesQuery$$- ?
($$? @
)$$@ A
)$$A B
;$$B C
PrintService%% 
.%% 
PrintCategoryList%% "
(%%" #

categories%%# -
)%%- .
;%%. /
Console** 
.** 
	WriteLine** 
(** 
$str** +
)**+ ,
;**, -
var++ 
newCategoryId++ 
=++ 
await++ 
mediator++ &
.++& '
Send++' +
(+++ ,
new++, /!
CreateCategoryCommand++0 E
(++E F
$str++F T
,++T U
null++V Z
,++Z [

categories++\ f
.++f g
First++g l
(++l m
)++m n
.++n o
Id++o q
)++q r
)++r s
;++s t

categories,, 
=,, 
await,, 
mediator,, 
.,,  
Send,,  $
(,,$ %
new,,% (
GetCategoriesQuery,,) ;
(,,; <
),,< =
),,= >
;,,> ?
PrintService-- 
.-- 
PrintCategoryList-- "
(--" #

categories--# -
)--- .
;--. /
Console22 
.22 
	WriteLine22 
(22 
$str22 +
)22+ ,
;22, -
var33 
category33 
=33 
await33 
mediator33 !
.33! "
Send33" &
(33& '
new33' *
GetCategoryQuery33+ ;
(33; <
newCategoryId33< I
)33I J
)33J K
;33K L
PrintService44 
.44 
PrintCategory44 
(44 
category44 '
)44' (
;44( )
Console99 
.99 
	WriteLine99 
(99 
$str99 *
)99* +
;99+ ,
await:: 	
mediator::
 
.:: 
Send:: 
(:: 
new:: !
UpdateCategoryCommand:: 1
{;; 
Id<< 

=<< 
category<< 
.<< 
Id<< 
,<< 
Name== 
=== 
$str== %
,==% &
ParentCategoryId>> 
=>> 
category>> #
.>># $
ParentCategoryId>>$ 4
}?? 
)?? 
;?? 

categories@@ 
=@@ 
await@@ 
mediator@@ 
.@@  
Send@@  $
(@@$ %
new@@% (
GetCategoriesQuery@@) ;
(@@; <
)@@< =
)@@= >
;@@> ?
PrintServiceAA 
.AA 
PrintCategoryListAA "
(AA" #

categoriesAA# -
)AA- .
;AA. /
ConsoleFF 
.FF 
	WriteLineFF 
(FF 
$strFF *
)FF* +
;FF+ ,
awaitGG 	
mediatorGG
 
.GG 
SendGG 
(GG 
newGG !
DeleteCategoryCommandGG 1
(GG1 2
newCategoryIdGG2 ?
)GG? @
)GG@ A
;GGA B

categoriesHH 
=HH 
awaitHH 
mediatorHH 
.HH  
SendHH  $
(HH$ %
newHH% (
GetCategoriesQueryHH) ;
(HH; <
)HH< =
)HH= >
;HH> ?
PrintServiceII 
.II 
PrintCategoryListII "
(II" #

categoriesII# -
)II- .
;II. /
ConsoleOO 
.OO 
	WriteLineOO 
(OO 
$strOO 1
)OO1 2
;OO2 3
varPP 
itemsPP 
=PP 
awaitPP 
mediatorPP 
.PP 
SendPP #
(PP# $
newPP$ '
GetItemsQueryPP( 5
(PP5 6
)PP6 7
)PP7 8
;PP8 9
PrintServiceQQ 
.QQ 
PrintItemListQQ 
(QQ 
itemsQQ $
)QQ$ %
;QQ% &
ConsoleVV 
.VV 
	WriteLineVV 
(VV 
$strVV '
)VV' (
;VV( )
varWW 
	newItemIdWW 
=WW 
awaitWW 
mediatorWW "
.WW" #
SendWW# '
(WW' (
newWW( +
CreateItemCommandWW, =
{WW> ?
NameWW@ D
=WWE F
$strWWG Q
,WWQ R

CategoryIdWWS ]
=WW^ _

categoriesWW` j
.WWj k
FirstWWk p
(WWp q
)WWq r
.WWr s
IdWWs u
,WWu v
AmountWWw }
=WW~ 
$num
WW€ 
,
WW ‚
Price
WWƒ ˆ
=
WW‰ Š
$num
WW‹ 
}
WWŽ 
)
WW 
;
WW ‘
itemsXX 	
=XX
 
awaitXX 
mediatorXX 
.XX 
SendXX 
(XX  
newXX  #
GetItemsQueryXX$ 1
(XX1 2
)XX2 3
)XX3 4
;XX4 5
PrintServiceYY 
.YY 
PrintItemListYY 
(YY 
itemsYY $
)YY$ %
;YY% &
Console^^ 
.^^ 
	WriteLine^^ 
(^^ 
$str^^ '
)^^' (
;^^( )
var__ 
item__ 
=__ 
await__ 
mediator__ 
.__ 
Send__ "
(__" #
new__# &
GetItemQuery__' 3
(__3 4
	newItemId__4 =
)__= >
)__> ?
;__? @
PrintService`` 
.`` 
	PrintItem`` 
(`` 
item`` 
)``  
;``  !
Consoleee 
.ee 
	WriteLineee 
(ee 
$stree *
)ee* +
;ee+ ,
awaitff 	
mediatorff
 
.ff 
Sendff 
(ff 
newff 
UpdateItemCommandff -
{gg 
Idhh 

=hh 
itemhh 
.hh 
Idhh 
,hh 
Nameii 
=ii 
$strii !
,ii! "

CategoryIdjj 
=jj 

categoriesjj 
.jj  
Firstjj  %
(jj% &
)jj& '
.jj' (
Idjj( *
,jj* +
Amountkk 
=kk 
$numkk 
,kk 
Pricell 
=ll 
$numll 
}mm 
)mm 
;mm 
itemsnn 	
=nn
 
awaitnn 
mediatornn 
.nn 
Sendnn 
(nn  
newnn  #
GetItemsQuerynn$ 1
(nn1 2
)nn2 3
)nn3 4
;nn4 5
PrintServiceoo 
.oo 
PrintItemListoo 
(oo 
itemsoo $
)oo$ %
;oo% &
Consolett 
.tt 
	WriteLinett 
(tt 
$strtt *
)tt* +
;tt+ ,
awaituu 	
mediatoruu
 
.uu 
Senduu 
(uu 
newuu 
DeleteItemCommanduu -
(uu- .
	newItemIduu. 7
)uu7 8
)uu8 9
;uu9 :
itemsvv 	
=vv
 
awaitvv 
mediatorvv 
.vv 
Sendvv 
(vv  
newvv  #
GetItemsQueryvv$ 1
(vv1 2
)vv2 3
)vv3 4
;vv4 5
PrintServiceww 
.ww 
PrintItemListww 
(ww 
itemsww $
)ww$ %
;ww% &
}{{ ¼
„C:\Users\Olesia_Skrypchenko\source\repos\Mentoring program 2022\Homatask3.WebApiCleanArchitecture\src\WebUI\Services\PrintService.cs
	namespace 	
	Homatask2
 
. 
CleanArchitecture %
.% &
WebUI& +
.+ ,
Services, 4
;4 5
public 
static 
class 
PrintService  
{ 
public 

static 
void 
PrintCategory $
($ %
CategoryDto% 0
category1 9
)9 :
{		 
Console

 
.

 
	WriteLine

 
(

 
$"

 
$str

 "
{

" #
category

# +
.

+ ,
Name

, 0
}

0 1
"

1 2
)

2 3
;

3 4
} 
public 

static 
void 
PrintCategoryList (
(( )
IEnumerable) 4
<4 5
CategoryDto5 @
>@ A
categoryListB N
)N O
{ 
foreach 
( 
var 
category 
in  
categoryList! -
)- .
{ 	
PrintCategory 
( 
category "
)" #
;# $
} 	
} 
public 

static 
void 
	PrintItem  
(  !
ItemDto! (
item) -
)- .
{ 
Console 
. 
	WriteLine 
( 
$" 
$str "
{" #
item# '
.' (
Name( ,
}, -
$str- <
{< =
item= A
.A B
DescriptionB M
}M N
"N O
)O P
;P Q
} 
public 

static 
void 
PrintItemList $
($ %
IEnumerable% 0
<0 1
ItemDto1 8
>8 9
itemList: B
)B C
{ 
foreach 
( 
var 
item 
in 
itemList %
)% &
{ 	
	PrintItem 
( 
item 
) 
; 
} 	
} 
}   