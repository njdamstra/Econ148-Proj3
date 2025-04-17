libname master 'c:\Documents and Settings\epb4\Desktop';
option linesize=80;

******************************************************************;
* MALES AND FEMALES POOLED -- PANEL A;
******************************************************************;

data temp;
set master.aerdat4;
if (bog95smp~=1 & bog97smp~=1 & jam93smp~=1) then delete;
if tab3smpl~=1 then delete;;

proc sort;
 by vouch0 sex2;
proc means n mean std;
 var married haschild hoursum working3;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
       & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
       & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
       & vouch0~=. & bog95smp=1 & hoursum~=.;
  by vouch0 sex2;
proc means n mean std;
 var haschild married hoursum working3;
 by vouch0 sex2;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
	& rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
	& prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
	& vouch0=0 & (bog95smp=1 | bog97smp=1 | jam93smp);
proc means n mean std;
 var haschild married hoursum working3;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
       & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
       & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
       & vouch0~=. & bog95smp=1 & hoursum~=.;
  by vouch0;
proc means n mean std;
 var haschild married hoursum working3;
 by vouch0;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
	& rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
	& prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
	& vouch0=0 & (bog95smp=1 | bog97smp=1 | jam93smp);


proc reg;
 model hoursum working3 = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls';
proc reg;
 model married  = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls';
proc reg;
 model haschild = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls';

proc reg;
 model hoursum working3 = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls';
proc reg;
 model married  = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls';
proc reg;
 model haschild = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls';


******************************************************************;
* MALES ONLY -- PANEL B;
******************************************************************;

data temp;
set master.aerdat4;
if (bog95smp~=1 & bog97smp~=1 & jam93smp~=1) then delete;
if tab3smpl~=1 then delete;
if sex2=1;

proc reg;
 model hoursum working3 = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls - Males';
proc reg;
 model married  = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls - Males';
proc reg;
 model haschild = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls - Males';

proc reg;
 model hoursum working3 = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls - Males';
proc reg;
 model married  = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls - Males';
proc reg;
 model haschild = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls - Males';

 

******************************************************************;
* FEMALES ONLY -- PANEL C;
******************************************************************;

data temp;
set master.aerdat4;
if (bog95smp~=1 & bog97smp~=1 & jam93smp~=1) then delete;
if tab3smpl~=1 then delete;
if sex2=0;

proc sort;
 by vouch0 sex2;

proc reg;
 model hoursum working3 = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls - Females';
proc reg;
 model married  = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls - Females';
proc reg;
 model haschild = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 | bog97smp=1 | jam93smp);
 title 'Combined - basic controls - Females';

proc reg;
 model hoursum working3 = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls - Females';
proc reg;
 model married  = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls - Females';
proc reg;
 model haschild = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 sex_miss  /acov;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & (bog95smp=1 );
 title 'Bog95 - basic controls - Females';

run;
 

 ******************************************;
 * PROBITS;
 ******************************************;
 
data temp;
set master.aerdat4;
if (bog95smp~=1 & bog97smp~=1 & jam93smp~=1) then delete;
if tab3smpl~=1 then delete;

proc probit ;
 class working3;
 model working3
      = vouch0 svy hsvisit djamundi phone age strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex2  ;*  /acov;
 output out=prob1 xbeta=index1;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0~=. & bog95smp;
data prob1;
  set prob1;
  phi1=(1/sqrt(2*3.141592))*exp(-index1**2/2);
  keep id phi1 vouch0 bog95smp;
proc means;
  var phi1;
  where bog95smp & vouch0;


proc probit data=temp;
 class working3;
 model working3
      = vouch0 svy hsvisit djamundi phone age strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex2  ;*  /acov;
 output out=prob1 xbeta=index1;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0~=. & bog95smp & sex2=0;
data prob1;
  set prob1;
  phi1=(1/sqrt(2*3.141592))*exp(-index1**2/2);
  keep id phi1 vouch0 bog95smp sex2;
proc means;
  var phi1;
  where bog95smp & vouch0 & sex2=0;
  title 'Bog 95 women';

proc probit data=temp ;
 class working3;
 model working3
      = vouch0 svy hsvisit djamundi phone age strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex2  ;*  /acov;
 output out=prob1  xbeta=index1;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0~=. & bog95smp & sex2=1;
data prob1;
  set prob1;
  phi1=(1/sqrt(2*3.141592))*exp(-index1**2/2);
  keep id phi1 vouch0 bog95smp sex2;
proc means;
  var phi1;
  where bog95smp & vouch0 & sex2=1;
  title 'Bog 95 men';
proc probit data=temp;
 class working3;
 model working3
      = vouch0 svy hsvisit djamundi phone age strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex2  ;*  /acov;
 output out=prob1 xbeta=index1;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0~=. & (bog95smp=1 | jam93smp=1 | bog97smp=1);
data prob1;
  set prob1;
  phi1=(1/sqrt(2*3.141592))*exp(-index1**2/2);
  keep id phi1 vouch0 bog95smp sex2 jam93smp bog97smp;
proc means;
  var phi1;
  where (bog95smp | jam93smp | bog97smp) & vouch0 ;
  title 'All';

proc probit data=temp;
 class working3;
 model working3
      = vouch0 svy hsvisit djamundi phone age strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex2  ;*  /acov;
 output out=prob1 xbeta=index1;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0~=. & (bog95smp=1 | jam93smp=1 | bog97smp=1) & sex2=0;
data prob1;
  set prob1;
  phi1=(1/sqrt(2*3.141592))*exp(-index1**2/2);
  keep id phi1 vouch0 bog95smp sex2 jam93smp bog97smp;
proc means;
  var phi1;
  where (bog95smp | jam93smp | bog97smp) & vouch0 & sex2=0;
  title 'All women';

proc probit data=temp;
 class working3;
 model working3
      = vouch0 svy hsvisit djamundi phone age strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex2  ;*  /acov;
 output out=prob1 xbeta=index1;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0~=. & (bog95smp=1 | jam93smp=1 | bog97smp=1) & sex2=1;
data prob1;
  set prob1;
  phi1=(1/sqrt(2*3.141592))*exp(-index1**2/2);
  keep id phi1 vouch0 bog95smp sex2 jam93smp bog97smp;
proc means;
  var phi1;
  where (bog95smp | jam93smp | bog97smp) & vouch0 & sex2=1;
  title 'All men';
run;
