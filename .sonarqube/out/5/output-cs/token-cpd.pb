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
} ’O
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
intWW 

categoryIdWW 
=WW 

categoriesWW 
!=WW  "
nullWW# '
?WW( )

categoriesWW* 4
.WW4 5
FirstOrDefaultWW5 C
(WWC D
)WWD E
.WWE F
IdWWF H
:WWI J
$numWWK L
;WWL M
varXX 
	newItemIdXX 
=XX 
awaitXX 
mediatorXX "
.XX" #
SendXX# '
(XX' (
newXX( +
CreateItemCommandXX, =
{XX> ?
NameXX@ D
=XXE F
$strXXG Q
,XXQ R

CategoryIdXXS ]
=XX^ _

categoriesXX` j
.XXj k
FirstOrDefaultXXk y
(XXy z
)XXz {
.XX{ |
IdXX| ~
,XX~ 
Amount
XX€ †
=
XX‡ ˆ
$num
XX‰ Š
,
XXŠ ‹
Price
XXŒ ‘
=
XX’ “
$num
XX” –
}
XX— ˜
)
XX˜ ™
;
XX™ š
itemsYY 	
=YY
 
awaitYY 
mediatorYY 
.YY 
SendYY 
(YY  
newYY  #
GetItemsQueryYY$ 1
(YY1 2
)YY2 3
)YY3 4
;YY4 5
PrintServiceZZ 
.ZZ 
PrintItemListZZ 
(ZZ 
itemsZZ $
)ZZ$ %
;ZZ% &
Console__ 
.__ 
	WriteLine__ 
(__ 
$str__ '
)__' (
;__( )
var`` 
item`` 
=`` 
await`` 
mediator`` 
.`` 
Send`` "
(``" #
new``# &
GetItemQuery``' 3
(``3 4
	newItemId``4 =
)``= >
)``> ?
;``? @
PrintServiceaa 
.aa 
	PrintItemaa 
(aa 
itemaa 
)aa  
;aa  !
Consoleff 
.ff 
	WriteLineff 
(ff 
$strff *
)ff* +
;ff+ ,
awaitgg 	
mediatorgg
 
.gg 
Sendgg 
(gg 
newgg 
UpdateItemCommandgg -
{hh 
Idii 

=ii 
itemii 
.ii 
Idii 
,ii 
Namejj 
=jj 
$strjj !
,jj! "

CategoryIdkk 
=kk 

categorieskk 
.kk  
FirstOrDefaultkk  .
(kk. /
)kk/ 0
.kk0 1
Idkk1 3
,kk3 4
Amountll 
=ll 
$numll 
,ll 
Pricemm 
=mm 
$nummm 
}nn 
)nn 
;nn 
;nn 	
itemsoo 	
=oo
 
awaitoo 
mediatoroo 
.oo 
Sendoo 
(oo  
newoo  #
GetItemsQueryoo$ 1
(oo1 2
)oo2 3
)oo3 4
;oo4 5
PrintServicepp 
.pp 
PrintItemListpp 
(pp 
itemspp $
)pp$ %
;pp% &
Consoleuu 
.uu 
	WriteLineuu 
(uu 
$struu *
)uu* +
;uu+ ,
awaitvv 	
mediatorvv
 
.vv 
Sendvv 
(vv 
newvv 
DeleteItemCommandvv -
(vv- .
	newItemIdvv. 7
)vv7 8
)vv8 9
;vv9 :
itemsww 	
=ww
 
awaitww 
mediatorww 
.ww 
Sendww 
(ww  
newww  #
GetItemsQueryww$ 1
(ww1 2
)ww2 3
)ww3 4
;ww4 5
PrintServicexx 
.xx 
PrintItemListxx 
(xx 
itemsxx $
)xx$ %
;xx% &
}|| 
public 
partial 
class 
Program 
{€€ 
}‚‚ ¼
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