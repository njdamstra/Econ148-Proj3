libname master 'c:\documents and settings\epb4\desktop';

data temp;
 set master.aerdat4;
 keep age sex mom_sch dad_sch mom_mw dad_mw age2 vouch0 hsvisit scyfnsh 
    dbogota djamundi d1993 d1995 d1997 bog97smp mom_age dad_age
	bog95smp jam93smp phone svy dmonth1-dmonth12 strata1-strata6
	stratams darea1-darea19 id bog95asd bog95 bog97 sex_name
        jam93asd  bog97asd sex2 test_tak;
 
proc means n mean std;
  var phone sex_name  age2;
  where  9<=age2<=25 & vouch0=0 & (dbogota | djamundi);
proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25 &  vouch0=0 &
	( bog95asd | jam93asd | bog97asd);
proc means n mean std; 
 var phone age2 age sex2  mom_sch dad_sch mom_mw dad_mw
       mom_age dad_age;
    where  vouch0=0 & (bog95smp | bog97smp | jam93smp);

proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25 & vouch0=0 &  id<=4044;
proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25 & vouch0=0 & bog95asd;
proc means n mean std; 
 var phone age2 age sex2  mom_sch dad_sch mom_mw dad_mw
       mom_age dad_age;
    where  vouch0=0 &  bog95smp;

proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25 & vouch0=0 &  dbogota & d1997;
proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25 & vouch0=0 & bog97asd;
proc means n mean std; 
 var phone age2 age sex2  mom_sch dad_sch mom_mw dad_mw
       mom_age dad_age;
    where  vouch0=0 &  bog97smp;

proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25  & vouch0=0 &  djamundi;
proc means n mean std;
  var phone sex_name age2;
  where  9<=age2<=25 & vouch0=0 & jam93asd;
proc means n mean std; 
 var phone age2 age sex2  mom_sch dad_sch mom_mw dad_mw
       mom_age dad_age;
    where vouch0=0 &  jam93smp;

proc reg;
 model phone =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & (dbogota | djamundi);
 title 'Application-combined sample';

proc reg;
 model age2 =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 &  (djamundi | dbogota);

proc reg;
 model sex_name=vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & (djamundi | dbogota);

proc reg;
 model phone =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & (bog95asd | bog97asd | jam93asd) ;
 title 'attempted-- combined sample';

proc reg;
 model age2 =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & (bog95asd | bog97asd | jam93asd) ;

proc reg;
 model sex_name=vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & (bog95asd | bog97asd | jam93asd) ;


* Combined sample Panel C;
proc reg;
 model phone   = vouch0 svy hsvisit djamundi
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 title 'Panel C';
 where  (bog95smp | bog97smp | jam93smp);

proc reg;
 model age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C';
 where  (bog95smp | bog97smp | jam93smp) ;

proc reg;
 model sex2= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C combined sample';
 where  (bog95smp | bog97smp | jam93smp) ;

proc reg;
 model mom_sch= vouch0 svy hsvisit djamundi
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C combined sample';
 where  (bog95smp | bog97smp | jam93smp) ;

proc reg;
 model dad_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where  (bog95smp | bog97smp | jam93smp) ;

proc reg;
 model mom_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  (bog95smp | bog97smp | jam93smp) ;

proc reg;
 model dad_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where (bog95smp | bog97smp | jam93smp) ;

proc reg;
 model dad_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where (bog95smp | bog97smp | jam93smp) ;

**BOGOTA 95**;
proc reg; 
 model phone= vouch0 djamundi dbogota d1993 d1995 d1997 /acov;
 where  9<=age2<=25  & id<=4044 ;
 title 'BOGOTA 95 PACES app.';

proc reg;
model age2= vouch0 djamundi dbogota d1993 d1995 d1997  /acov;
where  9<=age2<=25 & id<=4044 ;

proc reg;
model sex_name= vouch0 djamundi dbogota d1993 d1995 d1997  /acov;
 where  9<=age2<=25  & id<=4044;

proc reg;
 model phone =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 &  bog95asd;
 title 'BOG attempted contacts';

proc reg;
 model age2 =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & bog95asd;
proc reg;
 model age2 =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & bog95asd & checkid;
proc reg;
 model sex_name=vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & bog95asd;

proc reg;
 model phone = vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 title 'Panel C';
 where  bog95smp ;


proc reg;
 model age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C';
 where  bog95smp;

proc reg;
 model sex2= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C combined sample';
 where  bog95smp;

proc reg;
 model mom_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C combined sample';
 where bog95smp;

proc reg;
 model dad_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where  bog95smp;

proc reg;
 model mom_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog95smp;

proc reg;
 model dad_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog95smp;

proc reg;
 model mom_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog95smp;

proc reg;
 model dad_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where  bog95smp;


proc reg; 
 model phone= vouch0 djamundi dbogota d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & dbogota=1 & d1997=1 ;
 title 'BOGOTA 97 PACES app.';

proc reg;
model age2= vouch0 djamundi dbogota d1993 d1995 d1997  /acov;
  where  9<=age2<=25 & dbogota=1 & d1997=1 ;

proc reg;
model sex_name= vouch0 djamundi dbogota d1993 d1995 d1997  /acov;
 where  9<=age2<=25 & dbogota=1 & d1997=1;

proc reg;
 model phone =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 &  bog97asd ;
 title 'Bog 97 attempted contacts';

proc reg;
 model age2 =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & bog97asd;

proc reg;
 model sex_name=vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & bog97asd;

proc reg;
 model phone = vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 title 'Panel C';
 where  bog97smp ;

proc reg;
 model age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C';
 where bog97smp;

proc reg;
 model sex2= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog97smp;

proc reg;
 model mom_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C ';
 where bog97smp;

proc reg;
 model dad_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where  bog97smp;

proc reg;
 model mom_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog97smp;

proc reg;
 model dad_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog97smp;

proc reg;
 model mom_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  bog97smp;

proc reg;
 model dad_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where bog97smp;

****************************************************;
proc reg; 
 model phone= vouch0 djamundi dbogota d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & djamundi;
 title 'JAMUNDI 93 PACES app.';

proc reg;
model age2= vouch0 djamundi dbogota d1993 d1995 d1997  /acov;
  where  9<=age2<=25 & djamundi ;

proc reg;
model sex_name= vouch0 djamundi dbogota d1993 d1995 d1997  /acov;
 where  9<=age2<=25 & djamundi;

proc reg;
 model phone =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 &  jam93asd;
 title 'Jamundi 93 attempted contacts';

proc reg;
 model age2 =vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & jam93asd;

proc reg;
 model sex_name=vouch0 dbogota djamundi d1993 d1995 d1997 /acov;
 where  9<=age2<=25 & jam93asd;

proc reg;
 model phone = vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 title 'Panel C';
 where  jam93smp ;

proc reg;
 model age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C';
 where  jam93smp;

proc reg;
 model sex2= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
  where  jam93smp;

proc reg;
 model mom_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
  where  jam93smp;

proc reg;
 model dad_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where  jam93smp;

proc reg;
 model mom_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where  jam93smp;

proc reg;
 model dad_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where jam93smp;

proc reg;
 model mom_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 where jam93smp;

proc reg;
 model dad_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where jam93smp;
*****TESTING SAMPLE***;

data temp;
	set master.tab5v1;
	
proc reg;
 model age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 title 'Panel C & test sample';
 
proc reg;
 model sex2= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
proc reg;
 model mom_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 

proc reg;
 model dad_sch= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 where  bog95smp;
proc reg;
 model mom_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 
proc reg;
 model dad_age= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov; 
 
proc reg;
 model dad_mw= vouch0 svy hsvisit djamundi 
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 darea1-darea19  /acov;
 
proc means n mean std;
  var age sex mom_sch dad_sch mom_age dad_age dad_mw sex_name age2;
  where vouch0=0;
run;

