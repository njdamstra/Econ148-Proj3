libname master 'c:\documents and settings\epb4\desktop';

*****TABLE3_FINAL.SAS
** RECREATES ALL OUTCOMES FROM TABLE 3 EXCEPT "EVER USED"
** EVER USED IS RECREATED IN TABLE 7'S PROGRAM;


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
 by vouch0;

proc means n mean std;
 var scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs strata1-strata6 stratams
        vouch0 usngsch ;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
	& rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
	& prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
	& vouch0=0 & (bog95smp=1 | bog97smp=1 | jam93smp);
proc means n mean std;
 var scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
        prsch_c rept6 rept nrept totscyrs strata1-strata6 stratams
        vouch0 usngsch ;
 where  scyfnsh~=. & finish6~=. & prscha_1~=.
        & rept6~=. & nrept~=. & inschl~=. & finish7~=. & vouch0~=.
        & prsch_c~=. & finish8~=. & prscha_2~=. & totscyrs~=. & rept~=.
        & vouch0=0 & bog95smp=1;
 title 'Bogota 95 Losers';

proc reg ;
 model scyfnsh inschl finish6 
	prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs usngsch
      = vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12  sex_miss  /acov;
where (bog95smp=1 | bog97smp=1 | jam93smp);
title 'Commined--basic controls';

proc reg ;
 model finish7 finish8
      = vouch0 svy hsvisit djamundi phone age sex2 strata1-strata6 stratams
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 sex_miss   /acov;
where bog95smp=1 | jam93smp;

proc reg ;
 model scyfnsh inschl finish6 prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs usngsch
      = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 darea1-darea19  sex_miss  /acov;
where (bog95smp=1 | bog97smp=1 | jam93smp);
title 'Combined-- all controls';

proc reg ;
 model finish7 finish8
      = vouch0 svy hsvisit djamundi phone age sex2
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	darea1-darea19  sex_miss /acov;
where bog95smp=1 | jam93smp;

proc reg ;
 model scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
        prsch_c rept6 rept nrept totscyrs usngsch
      = vouch0 
         /acov;
where bog95smp=1 ;
title 'BOG95--no controls';

proc reg ;
 model scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs usngsch
      = vouch0 svy hsvisit djamundi phone age  sex2 sex_miss
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	 /acov;
where bog95smp=1 ;
title 'BOG95--basic controls';

proc reg ;
 model scyfnsh inschl finish6 finish7 finish8 prscha_1 prscha_2
	prsch_c rept6 rept nrept totscyrs usngsch
      = vouch0 svy hsvisit djamundi phone age  sex2 sex_miss
         dbogota d1993 d1995 d1997 dmonth1-dmonth12 strata1-strata6 stratams
	darea1-darea19	 /acov;
where bog95smp=1 ;
title 'BOG95 all controls';

run;
