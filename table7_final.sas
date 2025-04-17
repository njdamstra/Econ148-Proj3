
libname master 'c:\Documents and Settings\epb4\Desktop';

option linesize=80;

data temp;
set master.tab7;

proc syslin 2sls out=test1 data=temp;
 endogenous usesch scyfnsh;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model scyfnsh = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;


proc syslin data=temp 2sls first out=test1;
 endogenous usesch inschl;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model inschl = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;

proc syslin data=temp 2sls first out=test1;
 endogenous usesch nrept;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model nrept = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;

proc syslin data=temp 2sls first out=test1;
 endogenous usesch finish8;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model finish8 = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;

proc syslin data=temp 2sls first out=test1;
 endogenous usesch married;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model married = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;


proc reg data=temp;
model scyfnsh nrept inschl = usesch svy hsvisit djamundi phone age sex2 
strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss / acov ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;
**COLUMN 2;

proc reg data=temp;
model finish8 = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss / acov ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;

proc reg data=temp;
  model married = usesch svy hsvisit djamundi phone age sex2 
	strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss /acov;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;
***COLUMNS 5;
proc syslin 2sls out=test1 data=temp;
 endogenous usesch scyfnsh;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model scyfnsh = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);


proc syslin data=temp 2sls first out=test1;
 endogenous usesch inschl;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model inschl = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);

proc syslin data=temp7 2sls first out=test1;
 endogenous usesch nrept;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model nrept = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);

proc syslin data=temp 2sls first out=test1;
 endogenous usesch finish8;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model finish8 = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);

proc syslin data=temp 2sls first out=test1;
 endogenous usesch married;
 instruments vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss;
 model married = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);


proc reg data=temp;
model scyfnsh nrept inschl = usesch svy hsvisit djamundi phone age sex2 
strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss / acov ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);
**COLUMN 4;

proc reg data=temp;
model finish8 = usesch svy hsvisit djamundi phone age sex2 strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss / acov ;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);

proc reg data=temp;
  model married = usesch svy hsvisit djamundi phone age sex2 
	strata1-strata6 
	stratams dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss /acov;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp=1);
*COLUMN 1;
proc means n mean std;
	var scyfnsh inschl nrept finish8 married;
where  scyfnsh~=. & finish6~=. & prscha_1~=. & rept6~=. & nrept~=.
& svy~=. &  inschl~=. & finish7~=. & vouch0=0
        & prsch_c~=.  & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & bog95smp=1;

data temp;
 set master.tab7test;
  
proc sort;
 by sex;

proc means n mean std;
 var totalpts;
 where t_site>0 & t_site~=. & vouch0=0;

proc reg ;
 model totalpts
      = usesch tsite1-tsite3 svy hsvisit age sex mom_sch strata1-strata6
	dad_sch mom_miss dad_miss   /acov;
 title 'Table3 column 2';
 where t_site>0 & t_site~=.;

proc syslin 2sls first out=test1;
 endogenous usesch totalpts;
 instruments vouch0 tsite1-tsite3 svy hsvisit age sex mom_sch strata1-strata6
	dad_sch mom_miss dad_miss  ;
 model totalpts = usesch tsite1-tsite3 svy hsvisit age sex mom_sch 
	strata1-strata6 dad_sch mom_miss dad_miss  ;
where t_site>0 & t_site~=.;
run;		



