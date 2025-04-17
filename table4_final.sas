libname master 'c:\documents and settings\epb4\desktop';

data temp;
	set master.aerdat4;
	if (bog95smp~=1 & bog97smp~=1 & jam93smp~=1) then delete;
	if tab3smpl~=1 then delete;
	keep id vouch0 bog95smp bog97smp jam93smp age2
	scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs usngsch
	svy hsvisit djamundi phone age sex2
    dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	darea1-darea19  sex_miss;

proc sort;
 by sex2;
proc means n mean std;
 var   prscha_1 prscha_2 prsch_c scyfnsh inschl finish6 finish7 finish8 rept6 rept nrept totscyrs;
 by sex2;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0=0 & (bog95smp=1);
 title 'Bogota 95 Losers - tab 4 col 1 & 3';
proc reg ;
 model scyfnsh inschl finish6 
	prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs
      = vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12  sex_miss  /acov;
by sex2;
where (bog95smp=1 | bog97smp=1 | jam93smp);
title 'Combined--basic controls - col 5 & 6';
proc reg ;
 model finish7 finish8
      = vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss   /acov;
by sex2;
where bog95smp=1 | jam93smp;

proc reg ;
 model scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
        prsch_c rept6 rept nrept totscyrs 
      = vouch0 svy hsvisit djamundi phone age  sex2 sex_miss
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
         /acov;
by sex2;
where bog95smp=1 ;
title 'BOG95--basic controls - Tab 4 col 2 & 4';

run;
