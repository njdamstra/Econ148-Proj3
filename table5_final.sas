* libname master 'c:\Documents and Settings\epb4\Desktop';
* libname test 'c:\Documents and Settings\epb4\Desktop';

libname master '/bbkinghome/sschaner/Angrist Work/Web Papers/Angristetal_2002/Bettinger/to simone/';
libname test '/bbkinghome/sschaner/Angrist Work/Web Papers/Angristetal_2002/Bettinger/to simone/';

data temp ; 
 set master.tab5v1;
 
proc means data=temp;
 var totalpts math reading writing compos t_site vouch0 id;
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model totalpts=vouch0 tsite1-tsite3 /acov;
 title 'Table 3 column 1';
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model math=vouch0 tsite1-tsite3 /acov;
 where t_site>0 & t_site~=.;


proc reg data=temp; 
 model  reading = vouch0 tsite1-tsite3 /acov;
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model  writing = vouch0 tsite1-tsite3 /acov;
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model totalpts
      = vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch strata1-strata6
	dad_sch mom_miss dad_miss   /acov;
 title 'Table3 column 2';
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model math
      =vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch strata1-strata6
	dad_sch mom_miss dad_miss   /acov;
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model reading
       = vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch strata1-strata6
	dad_sch mom_miss dad_miss   /acov;  
 where t_site>0 & t_site~=.;


proc reg data=temp;
 model writing
       =vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch strata1-strata6 
        dad_sch mom_miss dad_miss /acov; 
 where t_site>0 & t_site~=.;

data temp3 temp4 temp5;;
  set temp;
  if math=. then delete;

  
data temp3 ;
  set temp3;
  testscor=math;
  subject=1;
  drop math reading writing totalpts compos;
data temp4;
  set temp4;
  testscor=reading;
  subject=2;
  drop math reading writing totalpts compos;
data temp5 ;
  set temp5;
  testscor=writing;
  subject=3;
  drop math reading writing totalpts compos;
data merge1;
  set temp3 temp4 temp5;

proc sort;
 by sex;

proc mixed data=merge1;
 class id;
  model testscor
      =vouch0 tsite1-tsite3 /solution;
  random id;
  where t_site>0 & t_site~=. & subject~=3;
  title 'Table3 Column 3 math and reading';


proc mixed data=merge1;
 class id;
 model testscor
      =vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch
       dad_sch mom_miss dad_miss/solution;
  random id;
  where t_site>0 & t_site~=. & subject~=3;
  title 'Table3 Column 4 math and reading';

proc mixed data=merge1;
 class id;
  model testscor
      =vouch0 tsite1-tsite3 /solution;
  random id;
  where t_site>0 & t_site~=. ;
  title 'Table3 Column 3 pooled';


proc mixed data=merge1;
 class id;
 model testscor
      =vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch
       dad_sch mom_miss dad_miss/solution;
  random id;
  where t_site>0 & t_site~=. ;
  title 'Table3 Column 4 pooled';

  proc mixed data=merge1;
 class id;
 model testscor
      =vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch
       dad_sch mom_miss dad_miss/solution;
  random id;
  where t_site>0 & t_site~=. & sex=0 & subject~=3;
  title 'Table3 Column 4 pooled';

  proc mixed data=merge1;
 class id;
 model testscor
      =vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch
       dad_sch mom_miss dad_miss/solution;
  random id;
  where t_site>0 & t_site~=. & sex=1 & subject~=3;
  title 'Table3 Column 4 pooled';

run;
