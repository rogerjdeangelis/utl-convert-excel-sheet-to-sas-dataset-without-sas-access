# utl-convert-excel-sheet-to-sas-dataset-without-sas-access
Convert excel sheet to sas dataset without sas access
    %let pgm=utl-convert-excel-sheet-to-sas-dataset-without-sas-access;

    %stop_subbmission

    Convert excel sheet to sas dataset without sas access

    github
    https://tinyurl.com/4hxdmddw
    https://github.com/rogerjdeangelis/utl-convert-excel-sheet-to-sas-dataset-without-sas-access

    /************************************************************************************************************************/
    /* INPUT                                   | PROCESS                                   | OUTPUT                         */
    /* =====                                   | ========                                  | ======                         */
    /* d:/xls/class.xlsx                       | 1 Powershell import-Excel                 |                                */
    /*                                         | 2 Powershell Output CSV                   |                                */
    /* ----------------------+                 | 3 Classic Editor csv to sas7bdat          |                                */
    /* | A1| fx    |NAME     |                 |                                           |                                */
    /* --------------------------------------+ |                                           |                                */
    /* [_] |    A    | B | C |    D  |    E  | | %utlfkil(d:\csv\class.csv);               | WORK.SASCLASS                  */
    /* --------------------------------------| |                                           |                                */
    /*  1  | NAME    |SEX|AGE| HEIGHT| WEIGHT| | proc datasets lib=work nolist             |   NAME   SEX AGE HEIGHT WEIGHT */
    /*  -- |---------+---+---+-------+-------| |  nodetails;                               |                                */
    /*  2  |  Alfred | M | 14| 69    | 112.5 | |   delete sasclass;                        |  Alfred   M  14   69    112.5  */
    /*  -- |---------+---+---+-------+-------| | run;quit;                                 |  Alice    F  13   56.5  84     */
    /*  3  |  Alice  | F | 13| 56.5  | 84    | |                                           |  Barbara  F  13   65.3  98     */
    /*  -- |---------+---+---+-------+-------| | %utl_psbegin;                             |  Carol    F  14   62.8  102.5  */
    /*  4  |  Barbara| F | 13| 65.3  | 98    | | parmcards4;                               |  Henry    M  14   63.5  102.5  */
    /*  -- |---------+---+---+-------+-------| | import-Excel `                            |                                */
    /*  5  |  Carol  | F | 14| 62.8  | 102.5 | |   -Path "d:\xls\class.xlsx" `             |                                */
    /*  -- |---------+---+---+-------+-------| |   -WorksheetName "class" `                |                                */
    /*  6  |  Henry  | M | 14| 63.5  | 102.5 | |    | Export-Csv -Path "d:\csv\class.csv" `|                                */
    /*  -- |---------+---+---+-------+-------| |   -NoTypeInformation ;                    |                                */
    /* [CLASS}                                 | ;;;;                                      |                                */
    /*                                         | %utl_psend;                               |                                */
    /* data have;informat                      |                                           |                                */
    /* NAME $8.                                | dm 'dimport "d:\csv\class.csv" sasclass'; |                                */
    /* SEX $1.                                 |                                           |                                */
    /* AGE 8.                                  | proc print data=sasclass;                 |                                */
    /* HEIGHT 8.                               | run;quit;                                 |                                */
    /* WEIGHT 8.                               |                                           |                                */
    /* ;input                                  |                                           |                                */
    /* NAME SEX AGE                            |                                           |                                */
    /*  HEIGHT WEIGHT;                         |                                           |                                */
    /* cards4;                                 |                                           |                                */
    /* Alfred M 14 69 112.5                    |                                           |                                */
    /* Alice F 13 56.5 84                      |                                           |                                */
    /* Barbara F 13 65.3 98                    |                                           |                                */
    /* Carol F 14 62.8 102.5                   |                                           |                                */
    /* Henry M 14 63.5 102.5                   |                                           |                                */
    /* ;;;;                                    |                                           |                                */
    /* run;quit;                               |                                           |                                */
    /*                                         |                                           |                                */
    /* %utlfkil(d:/xls/class.xlsx);            |                                           |                                */
    /*                                         |                                           |                                */
    /* ods excel file="d:/xls/class.xlsx"      |                                           |                                */
    /*   options(sheet_name="class");          |                                           |                                */
    /* proc print data=have width=min noobs;   |                                           |                                */
    /* run;quit;                               |                                           |                                */
    /* ods excel close;                        |                                           |                                */
    /************************************************************************************************************************/

    /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */






































































INPUT                                      PROCESS                                    OUTPUT
=====                                      ========                                   ======
d:/xls/class.xlsx                          %utlfkil(d:\csv\class.csv);                 WORK.SASCLASS

----------------------+                    proc datasets lib=work nolist                 NAME   SEX AGE HEIGHT WEIGHT
| A1| fx    |NAME     |                     nodetails;
--------------------------------------+      delete sasclass;                           Alfred   M  14   69    112.5
[_] |    A    | B | C |    D  |    E  |    run;quit;                                    Alice    F  13   56.5  84
--------------------------------------|                                                 Barbara  F  13   65.3  98
 1  | NAME    |SEX|AGE| HEIGHT| WEIGHT|    %utl_psbegin;                                Carol    F  14   62.8  102.5
 -- |---------+---+---+-------+-------|    parmcards4;                                  Henry    M  14   63.5  102.5
 2  |  Alfred | M | 14| 69    | 112.5 |    import-Excel `
 -- |---------+---+---+-------+-------|      -Path "d:\xls\class.xlsx" `
 3  |  Alice  | F | 13| 56.5  | 84    |      -WorksheetName "class" `
 -- |---------+---+---+-------+-------|       | Export-Csv -Path "d:\csv\class.csv" `
 4  |  Barbara| F | 13| 65.3  | 98    |      -NoTypeInformation ;
 -- |---------+---+---+-------+-------|    ;;;;
 5  |  Carol  | F | 14| 62.8  | 102.5 |    %utl_psend;
 -- |---------+---+---+-------+-------|
 6  |  Henry  | M | 14| 63.5  | 102.5 |    dm 'dimport "d:\csv\class.csv" sasclass';
 -- |---------+---+---+-------+-------|
[CLASS}                                    proc print data=sasclass;
                                           run;quit;
data have;informat
NAME $8.
SEX $1.
AGE 8.
HEIGHT 8.
WEIGHT 8.
;input
NAME SEX AGE
 HEIGHT WEIGHT;
cards4;
Alfred M 14 69 112.5
Alice F 13 56.5 84
Barbara F 13 65.3 98
Carol F 14 62.8 102.5
Henry M 14 63.5 102.5
;;;;
run;quit;

%utlfkil(d:/xls/class.xlsx);

ods excel file="d:/xls/class.xlsx"
  options(sheet_name="class");
proc print data=have width=min noobs;
run;quit;
ods excel close;












































ods excel file"d:/xls/


%utl_psbegin;
parmcards4;
Import-Excel -Path d:\xls\tab.xlsx -WorksheetName 'sheet1' |
    ConvertTo-Html |
    Out-File -FilePath d:\htm\tab.html -Encoding utf8
;;;;
run;quit;

%utlfkil(d:\csv\class.csv);

proc datasets lib=work nolist
 nodetails;
  delete sasclass;
run;quit;

%utl_psbegin;
parmcards4;
import-Excel `
  -Path "d:\xls\class.xlsx" `
  -WorksheetName "class" `
   | Export-Csv -Path "d:\csv\class.csv" `
  -NoTypeInformation ;
;;;;
%utl_psend;

dm 'dimport "d:\csv\class.csv" sasclass';


WORK.SASCLASS

  NAME   SEX AGE HEIGHT WEIGHT

 Alfred   M  14   69    112.5
 Alice    F  13   56.5  84
 Barbara  F  13   65.3  98
 Carol    F  14   62.8  102.5
 Henry    M  14   63.5  102.5


























import-Excel -Path "d:\xls\tabt.xlsx" -WorksheetName "Sheet1" | Export-Csv -Path "d:\csv\tabt.csv" -NoTypeInformation ;

dm 'dimport "d:\csv\tabt.csv" tabt';

filename tmp temp;
data _null_;
 file tmp;
 do lyn=2 to 20;
  put @2 '-- |----------+---------+---------+---------+---------+---------+---------+---------+---------+---------|';
  row=put(lyn, 2. -r);
  put @1 row $2.
   @5 '|          |         |         |         |         |         |         |         |         |         |';
 end;
  put @2 '-- |----------+---------+---------+---------+---------+---------+---------+---------+---------+---------|';
 stop;
run;quit;

/*__ _ _ _            _ _
 / _(_) | |   ___ ___| | |___
| |_| | | |  / __/ _ \ | / __|
|  _| | | | | (_|  __/ | \__ \
|_| |_|_|_|  \___\___|_|_|___/

*/
data _null_;
  infile tmp sharebuffers;
  file tmp;
  input;
  put _infile_;
  input;
  set have point=_n_ nobs=numobs;
  put @8 NAME @18  SEX @28 AGE @38 HEIGHT @48 WEIGHT;
  call symput('lines',2*_n_+1);
  if _n_=numobs then stop;
run;quit;
/*         _     _   _                    _
  __ _  __| | __| | | |__   ___  __ _  __| | ___ _ __
 / _` |/ _` |/ _` | | `_ \ / _ \/ _` |/ _` |/ _ \ `__|
| (_| | (_| | (_| | | | | |  __/ (_| | (_| |  __/ |
 \__,_|\__,_|\__,_| |_| |_|\___|\__,_|\__,_|\___|_|

*/
data _null_;
  infile tmp;
  input;
  if _n_=1 then do;
     put "-----------------------+";
     put "| A1| fx    |DAYNUM    |";
     put "---------------------------------------------------------------------------------------------------------+";
     put "[_] |    A     |    B    |    C    |    E    |    F    |    G    |    H    |    I    |    J    |    K    |";
     put "---------------------------------------------------------------------------------------------------------|";
     PUT " 1  | NAME     |   SEX   |   AGE   | HEIGHT  | WEIGHT  |         |         |         |         |         |";
  end;
  putlog _infile_;
  if _n_=&lines then do;
     putlog '[CLASS}';
     stop;
  end;
run;quit;













































































data have;
set sashelp.class;
run;quit;

%macro repro(dsn);

data have;
 set &dsn;
run;quit;

%let _vls=%utl_varlist(have) ;
%put &=_vls;
%array(_var,values=&_vls);

%put &=_var2;

data _null_;
  set have end=dne;
  if _n_=1 then do;
     put "data have;informat ";
     %do_over(_var,phrase=%str(
         if vtype(?) ne "N" then typ='$';
         else typ = "";
         typLen = cats(typ,vlength(?),'.');
         put "?" +1 typLen;
         )
     );
     put ';input';
     put "&_vls;";
     put 'cards4;';
     if dne then put ';run;quit;';
  end;

  put &_vls ;
  if dne then put ';;;;' / 'run;quit;';

run;quit;

%mend repro;

%repro(sashelp.class);






































%let pgm=utl-creating-sqlite-and-postgresql-tables-from-sas-datasets-without-sas-access;

%stop_submission;

Creating sqlite and postgresql tables from sas datasets

Best run with the classic editor, note the display manager 'DM' commands.

SOAPBOX ON

This repo solves the issues

Be scepticle

Someone should publish a book on what you cannot do, it would save a lot of programmer time.

This repo solves these issues

   1 postgreSQL: It's not possible to import a CSV file into a PostgreSQL table
      using psql CLI without first creating the table structure, names and datatypes.

   2 Sqlite: It's not possible to import a CSV file with numeric data into a sqlite table
     using sqlite CLI. without first creating the table structure, names and datatypes.
     All columns are created with the TEXT data type by default,
     regardless of whether the CSV contains numbers, text, or a mix of both.
     SQLite does not auto-detect numeric types during this import

     process.
IMPORTANT NOTE

    1  postgreSQL comes with a builtin admin user account, user postgres
    2  postgres comes with an builtin database, template1

    3 sqlite is a simple file based data base and does not need a admin user or builtin database

SOAPBOX ON



PARTIAL SOLUTION (SOLUTION WITH INFERRED EXPORTED DATATYPES - FULL SLUTION LATER
=================================================================================

USAGE

   1 Manual posgressql execution
   2 Drop down macros pgbegin and pgend
   3 Manual sqlite3 cli
   4 sqlite3 drop down                                                                               _        _ _
/*                                    _  _ __   ___  ___  __ _ _ __ ___  ___  __ _| |   ___| (_)
/ | _ __ ___   __ _ _ __  _   _  __ _| || `_ \ / _ \/ __|/ _` | `__/ _ \/ __|/ _` | |  / __| | |
| || `_ ` _ \ / _` | `_ \| | | |/ _` | || |_) | (_) \__ \ (_| | | |  __/\__ \ (_| | | | (__| | |
| || | | | | | (_| | | | | |_| | (_| | || .__/ \___/|___/\__, |_|  \___||___/\__, |_|  \___|_|_|
|_||_| |_| |_|\__,_|_| |_|\__,_|\__,_|_||_|              |___/                  |_|



%utlfkil(c:/temp/tstcsv.csv)

x 'cmd /K psql -U postgres -d template1 -c "create
                                               table tst (id real);
                                             insert
                                               into tst(id)
                                             values
                                               (100),(200),(300),(400)"');
x 'cmd /K psql -U postgres -d template1 -c "\dt;"');
x 'cmd /K psql -U postgres -d template1 -c "select * from tst;"');
x 'cmd /k psql -U postgres -d template1 -c "\copy tst to ''c:/temp/tstcsv.csv'' with csv header;"');

OUTPUT

               List of relations
Schema |  Name  | Type  |  Owner
-------+--------+-------+----------
public | tst    | table | postgres

/*--- one line import ---*/
dm "dimport 'c:/temp/tstcsv.csv' tst replace";

SAS work.tst

 ID

100
200
300
400

/*___                                              _      _                           _
|___ \   _ __   ___  ___  __ _ _ __ ___  ___  __ _| |  __| |_ __ ___  _ __         __| | _____      ___ __
  __) | | `_ \ / _ \/ __|/ _` | `__/ _ \/ __|/ _` | | / _` | `__/ _ \| `_ \ _____ / _` |/ _ \ \ /\ / / `_ \
 / __/  | |_) | (_) \__ \ (_| | | |  __/\__ \ (_| | || (_| | | | (_) | |_) |_____| (_| | (_) \ V  V /| | | |
|_____| | .__/ \___/|___/\__, |_|  \___||___/\__, |_| \__,_|_|  \___/| .__/       \__,_|\___/ \_/\_/ |_| |_|
        |_|              |___/                  |_|                  |_|
*/

%utlfkil(c:/temp/tstcsv.csv)

filename ft15f001 "c:/temp/tst.sql";
parmcards4;
create
   table tst (id real);
 insert
   into tst(id)
 values
   (100),(200),(300),(400);
;;;;
run;quit;

%utl_pgbegin;
parmcards4;
-f c:/temp/tst.sql
\dt
select * from tst
\copy tst to "c:/temp/tstcsv.csv" with csv header;
;;;;
%utl_pgend;

dm "dimport 'c:/temp/tstcsv.csv' tst replace";

OUTPUT
                List of relations
 Schema |  Name  | Type  |  Owner
 -------+--------+-------+----------
 public | tst    | table | postgres

/*--- one line import ---*/
dm "dimport 'c:/temp/tstcsv.csv' tst replace";

SAS work.tst

 ID

100
200
300
400

/*____                                     _             _ _ _       _____
|___ /   _ __ ___   __ _ _ __  _   _  __ _| |  ___  __ _| (_) |_ ___|___ /
  |_ \  | `_ ` _ \ / _` | `_ \| | | |/ _` | | / __|/ _` | | | __/ _ \ |_ \
 ___) | | | | | | | (_| | | | | |_| | (_| | | \__ \ (_| | | | ||  __/___) |
|____/  |_| |_| |_|\__,_|_| |_|\__,_|\__,_|_| |___/\__, |_|_|\__\___|____/
                                                      |_|
*/


%utlfkil(c:/temp/tst.db);
%utlfkil(c:/temp/tstcsv.csv);

x 'cmd /K sqlite3 c:/temp/tst.db < c:/temp/tst.sql');
x 'cmd /K sqlite3 c:/temp/tst.db ".tables"');
x 'cmd /K sqlite3 c:/temp/tst.db "select * from tst"');
x 'cmd /K sqlite3 c:/temp/tst.db "PRAGMA table_info(''tst'');"');
x 'cmd /K sqlite3 c:/temp/tst.db -csv -header "select * from tst;" > c:/temp/tstcsv.csv');

dm "dimport 'c:/temp/tstcsv.csv' tst replace";

.tables
=======
tst

select * from tst

100.0
200.0
300.0
400.0

PRAGMA table_info(''tst'')

0|id|REAL|0||0




/*  _               _ _ _       _____      _                           _
| || |    ___  __ _| (_) |_ ___|___ /   __| |_ __ ___  _ __         __| | _____      ___ __
| || |_  / __|/ _` | | | __/ _ \ |_ \  / _` | `__/ _ \| `_ \ _____ / _` |/ _ \ \ /\ / / `_ \
|__   _| \__ \ (_| | | | ||  __/___) || (_| | | | (_) | |_) |_____| (_| | (_) \ V  V /| | | |
   |_|   |___/\__, |_|_|\__\___|____/  \__,_|_|  \___/| .__/       \__,_|\___/ \_/\_/ |_| |_|
                 |_|                                  |_|
*/

%utlfkil(c:/temp/tstcsv.csv)

filename ft15f001 "c:/temp/tst.sql";
parmcards4;
create
   table tst (id real);
 insert
   into tst(id)
 values
   (100),(200),(300),(400);
;;;;
run;quit;

%utl_sqbegin;
parmcards4;
-d c:/temp/tst.db
< c:/temp/tst.sql
"select * from tst"
;;;;
%utl_sqend;

".tables"'
"select * from tst"'
"PRAGMA table_info('tst');"
-csv -header "select * from tst;" > c:/temp/tstcsv.csv
;;;;
%utl_sqend;






















-f c:/temp/tst.sql
\dt
select * from tst
\copy tst to "c:/temp/tstcsv.csv" with csv header;
;;;;
%utl_sqend;

dm "dimport 'c:/temp/tstcsv.csv' tst replace";

OUTPUT
                List of relations
 Schema |  Name  | Type  |  Owner
 -------+--------+-------+----------
 public | tst    | table | postgres

/*--- one line import ---*/
dm "dimport 'c:/temp/tstcsv.csv' tst replace";


5 DROP DOWN TO POSTGRESQL AND LOAD SAS TABLE, PROCESS TABLE, CREATE NEW TABLE AND EXPORT TABLE WITH META DATATYPE DATA.
=======================================================================================================================

%macro utl_sqbegin;
%utlfkil(c:/temp/sq_pgm.ps);
%utlfkil(c:/temp/sq_pgm.log);
filename ft15f001 "c:/temp/sq_pgm.sql";
%mend utl_sqbegin;

%macro utl_sqend(returnvar=N);
options noxwait noxsync;
  data _null_;
    length cmd $200;
    infile  "c:/temp/sq_pgm.sql";
    file  "c:/temp/sq_pgmx.sql" ;
    input;
    if left(_infile_) =: '-d ' then do;
      db=scan(_infile_,2,' ');
      cmd=catx(' ',"sqlite3",db);
      putlog cmd;
      rc=system(strip(cmd));
    end;
    if left(_infile_) =: '< ' then do;
      cmd=catx(' ',"sqlite3",_infile_);
      putlog cmd;
      rc=system(strip(cmd));
    end;
    else do;
       put _infile_;
    end;
  run;quit;
  filename rut pipe  "sqlite3 &db c:/temp/sq_pgmx.sql > c:/temp/sq_pgm.log";
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    putlog _infile_;
    put _infile_;
  run;
  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/pg_pgmx.log";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_sqend;


%utl_slbegin;
parmcards4;
drop table if exists meta;
drop table if exists class;
drop table if exists tst;
drop table if exists stats;
drop table if exists stats;
\dt
;;;;
%utl_slend;

%utlfkil(c:/temp/statscsv.csv);
%utlfkil(c:/temp/metacsv.csv);

/*--- -f has to be the first record ---*/
%utl_pgbegin;
parmcards4;
-f c:/temp/tst.sql
\dt
;;;;
%utl_pgend;
drop table if exists tst;
create
   table stats as
select
   sex
  ,avg(age) as avgage
  ,avg(weight) as avgwgt
  ,avg(height) as avghgt
from
  class
group
  by sex
;
\copy stats TO 'c:/temp/statscsv.csv' WITH CSV HEADER;
drop table if exists meta;
create
   table meta as
select
  column_name
 ,data_type
from
  information_schema.columns
where
  table_name = 'stats'
order
  by ordinal_position;
;
\copy meta TO 'c:/temp/metacsv.csv' WITH CSV HEADER;
;;;;
%utl_pgend;

proc datasets lib=work nolist nodetails;
 delete meta stats;
run;quit;

dm "dimport 'c:/temp/metacsv.csv' meta replace";
dm "dimport 'c:/temp/statscsv.csv' stats  replace";


proc print data=meta;
run;quit;

40 obs from META total obs=4
 COLUMN_
  NAME          DATA_TYPE

 sex        character varying
 avgage     double precision
 avgwgt     double precision
 avghgt     double precision

  40 obs from STATS total obs=2 09JUL2025:1
   SEX     AVGAGE     AVGWGT     AVGHGT

    M     13.3333    108.556    63.3444
    F     13.2222     90.111    60.5889


 Variable    Type    Len   Informat

 SEX         Char      1   $1.
 AVGAGE      Num       8   BEST32.
 AVGWGT      Num       8   BEST32.
 AVGHGT      Num       8   BEST32.






















x 'cmd /K sqlite3 "< c:/temp/tst.sql;"';
x 'cmd /K sqlite3 "c:/temp/tst.db ''select * from tst;''"')

sqlite3 example.db < create_table.sql
x 'cmd /K psql -U postgres -d template1 -c "select * from tst;"');


"\copy tst to ''c:/temp/tstcsv.csv'' with csv header;"');


         ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
         ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
         ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
         ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;

sqlite3 c:/temp/tst.db "SELECT name FROM sqlite_master WHERE type='table';"

%utlfkil(c:/temp/tstcsv.csv)


%utlfkil(c:/temp/tst.db);
data _null_;
rc=system('cmd /K sqlite3 c:/temp/tst.db < c:/temp/tst.sql');
rc=system('cmd /K sqlite3 c:/temp/tst.db ".tables"');
rc=system('cmd /K sqlite3 c:/temp/tst.db "select * from tst"');
rc=system('cmd /K sqlite3 c:/temp/tst.db "PRAGMA table_info(''tst'');"');
rc=system('cmd /K sqlite3 c:/temp/tst.db -csv -header "select * from tst;" > c:/temp/tstcsv.csv');
run;quit;

.headers on;.mode csv;.output c:/temp/tstcsv.tst;select * from tst;.output stdout;

rc=system('cmd /K sqlite3 c:/temp/tst.db ".headers on;.mode csv;.output c:/temp/tstcsv.csv;select * from tst;.output stdout;"');


please provide a reproducible example creating a csv using the sqlite2 cli shelling out ot windoes cmd.exe?
Please try to use something like the following
sqlite3 c:/temp/tst.db ".headers on;.mode csv;.output c:/temp/tstcsv.tst;select * from tst;.output stdout;"


 sqlite3 -csv c:/temp/tst.db "select * from tst;" > c:/temp/tstcsv.tst


why doesn't the fololwing sqlite3 cli produce the csv file c:\temp\tstcsv.csv
sqlite3 C:\temp\tst.db ".headers on;.mode csv;.output C:\temp\tstcsv.csv;select * from tst;.output stdout;"


 C:\Windows\system32>sqlite3 C:\temp\tst.db ".headers on;.mode csv;.output C:\temp\tstcsv.csv;select * from tst;.output stdout;"
Usage: .headers on|off







          ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
















%utl_pgbegin;
parmcards4;
drop table if exists tst;
\dt
;;;;
%utl_pgend;


  %utl_pgbegin;
  parmcards4;
  drop table if exists tst;
  \dt
  ;;;;
  %utl_pgend;


;;;;
%mend utl_pgend ;

%utl_pgend;
\dt;
drop
  table if exists tst;
create
   table tst (id real);
 insert
   into tst(id)
 values
   (100),(200),(300),(400)"');










select
  *
from
  class
;
create
  table want as
select
  sex
 ,avg(age) as avgAge
 ,avg(height) as avgHgt
 ,avg(weight) as avgWgt
from
  class
group
  by sex
;
select
   *
from
   want
;
create
   table meta as
select
  column_name
 ,data_type
from
  information_schema.columns
where
  table_name = 'want'
;
select
  *
from
  meta
\copy (select * from meta) to 'c:/temp/metacsv.csv' csv header;
\copy (select * from want) to 'c:/temp/wantcsv.csv' csv header;
;
\o c:/temp/lglog.txt;
;;;;
%mend utl_pgend ;
%utl_pgend;





















%let pgm=utl-sas-create-processs-and-import-postgresql-tables-using-sas-tagsets-and-drop-down-to-posgresql;

%stop_submission;

sas create processs and import postgresql tables using tagsets and drop down to posgresql

SOAPBOX ON

IMPORTANT NOTES

    1 postgreSQL comes with very powerfull CLI using the psql.exe.

       psql CLI options                                          psql meta commands

       -d <dbname>      Specify the database name to connect to  \l               List all databases
       -U <username>    Specify the database user                \c <dbname>      Connect to another database
       -h <host>        Specify the database server host         \dt              List all tables
       -p <port>        Specify the port number                  \d <table>       Describe a table (columns, types, etc.)
       -W               Force password prompt                    \dn              List all schemas
       -c "<command>"   Execute a single command and exit        \df              List all functions
       -f <filename>    Execute commands from a file             \dv              List all views
       --csv            Output results in CSV format             \du              List all users and roles
       -a               Echo all input lines                     \g               Execute the previous command again
       -A               Unaligned output mode                    \s               Show command history
       -b               Echo failed SQL commands to stderr       \i <file>        Execute commands from a file

       KEY DICTIONARY TABLE information_schema.columns where table='class'

    2 it's not possible to import a CSV file into a PostgreSQL table
       using psql without first creating the table structure, names and datatypes.
    3  postgreSQL comes with a builtin admin user account, user postgres
    4  postgres comes with an builtin database, template1

    5  The purpose of this post is to automate exchange sas tables with postgreSQL.
       a drop down to postgresql is presented.


       1 Generate the 'create table and insert' script
       2 Map sas character and numeric to varchar and float(8byte) datatypes.
       3 Use meta data in postgreSQL to map the many datatypes in 12
         relational databases to varchar and float
       4 Reduce the size of floats and varchars.


       Here is minimal example of postgreSQ psqlinterfacing with SAS.

       %utlfkil(c:/temp/tstcsv.csv)

       x 'cmd /K psql -U postgres -d template1 -c "drop table tst;"');
       x 'cmd /K psql -U postgres -d template1 -c "\dt;"');
       x 'cmd /K psql -U postgres -d template1 -c "create
                                                      table tst (id real);
                                                    insert
                                                      into tst(id)
                                                    values
                                                      (100),(200),(300),(400)"');
       x 'cmd /K psql -U postgres -d template1 -c "\dt;"');
       x 'cmd /K psql -U postgres -d template1 -c "select * from tst;"');
       x 'cmd /k psql -U postgres -d template1 -c "\copy tst to ""c:/temp/tstcsv.csv"" with csv header;"');

                      List of relations
       Schema |  Name  | Type  |  Owner
       -------+--------+-------+----------
       public | tst    | table | postgres

       dm "dimport 'c:/temp/tstcsv.csv' tst replace";

       SAS work.tst

        ID

       100
       200
       300
       400




Open up


The sqlite3 command-line interface supports a range of flags and options that control its behavior and output formatting. Below is a comprehensive list of the main flags and options you can use when launching the sqlite3 CLI:

Option / Flag   Description
-init file      Read and execute commands from the specified file (can contain SQL and meta-commands).
-echo           Print commands before execution.
-[no]header     Turn headers on or off in query output.
-column         Display query results in a table-like format with aligned columns.
-html           Output query results as simple HTML tables.
-line           Display each value on a separate line, rows separated by a blank line.
-list           Display results separated by the field separator (default: `
-separator SEP  Set the output field separator (default: `
-nullvalue STR  Set the string used to represent NULL values (default: empty string).
-version        Show the SQLite version and exit.
-help           Show help on available options and exit.
-bail           Stop after hitting an error.
-batch          Force batch I/O mode (useful for scripts).
-cmd COMMAND    Run the specified command before reading from stdin. Can be used multiple times.
-csv            Set output mode to CSV (comma-separated values).
-interactive    Force interactive I/O mode.
-mmap N         Set the default memory-mapped I/O size to N.
-stats          Print memory stats before each finalize.
-vfs NAME       Use the specified VFS (Virtual File System) implementation.


C OMMAND                 DESCRIPTION

 .backup ?DB? FILE       Backup DB (default "main") to FILE
 .bail on                off
 .clone NEWDB            Clone data into NEWDB from the existing database
 .databases              List names and files of attached databases
 .dump ?TABLE? ...       Dump the database in SQL text format
 .echo on                off
 .eqp on                 off
 .exit, .quit            Exit the sqlite3 program
 .explain ?on            off?
 .fullschema             Show schema and content of sqlite_stat tables
 .headers on             off
 .help                   Show help for meta-commands
 .import FILE TABLE      Import data from FILE into TABLE
 .indices ?TABLE?        Show names of all indices (optionally for TABLE)
 .load FILE ?ENTRY?      Load an extension library
 .log FILE               off
 .mode MODE              Set output mode (csv, column, html, insert, line, list, tabs, tcl)
 .nullvalue STRING       Set string used to represent NULL values
 .once FILENAME          Output next query to FILENAME
 .open ?OPTIONS? FILE    Close existing and reopen FILE
 .output FILENAME        Send output to FILENAME
 .print STRING...        Print literal STRING
 .prompt MAIN CONT       Replace the standard prompts
 .read FILENAME          Execute commands from FILENAME
 .restore ?DB? FILE      Restore DB (default "main") from FILE
 .save FILE              Write database to FILE
 .scanstats on           off
 .schema ?PATTERN?       Show CREATE statements matching PATTERN
 .separator COL ?ROW?    Change column/row separators
 .session ?NAME? CMD     Create or control sessions
 .sha3sum ...            Compute SHA3 hash of database content
 .shell CMD ARGS...      Run CMD ARGS in a system shell
 .show                   Show current settings
 .stats ?ARG?            Show stats or turn stats on/off
 .system CMD ARGS...     Run CMD ARGS in a system shell
 .tables ?PATTERN?       List names of tables matching PATTERN
 .timeout MS             Set busy timeout to MS milliseconds
 .timer on               off
 .trace ?OPTIONS?        Output each SQL statement as it is run
 .unmodule NAME ...      Unregister virtual table modules










%utl_psbegin;
parmcards4;
Import-Excel -Path d:\xls\tab.xlsx -WorksheetName 'sheet1' |
    ConvertTo-Html |
    Out-File -FilePath d:\htm\tab.html -Encoding utf8
;;;;
run;quit;

%utlfkil(d:\csv\tabt.csv);

%utl_psbegin;
parmcards4;
import-Excel -Path "d:\xls\tabt.xlsx" -WorksheetName "Sheet1" | Export-Csv -Path "d:\csv\tabx.csv" -NoTypeInformation ;
;;;;
%utl_psend;


import-Excel -Path "d:\xls\tabt.xlsx" -WorksheetName "Sheet1" | Export-Csv -Path "d:\csv\tabt.csv" -NoTypeInformation ;

dm 'dimport "d:\csv\tabt.csv" tabt';







I have the simple two column excel 2010 plus sheet1.

Command         Description
-init file      Read and execute commands from the specified file (can contain SQL and meta-commands).
-echo           Print commands before execution.
-[no]header     Turn headers on or off in query output.
-column         Display query results in a table-like format with aligned columns.

I want to convert shhet1 to a csv file using the following posershell script.

import-Excel -Path "d:\xls\tabt.xlsx" -WorksheetName "Sheet1" | Export-Csv -Path "d:\csv\tabt.csv" -NoTypeInformation ;

dm 'dimport "d:\csv\tabt.csv" tabt';

However pwershell creates csv d:\csv\tabx.csv with two incorrect columns

command","Description"
.backup ?DB? FILE","Backup DB (default ""main"") to FILE"
.bail on","off"
.clone NEWDB","Clone data into NEWDB from the existing database"
.databases","List names and files of attached databases"
.dump ?TABLE? ...","Dump the database in SQL text format"
.echo on","off"
.eqp on","off"
.exit, .quit","Exit the sqlite3 program"
.explain ?on","off?"

Please help me get the correct output?







<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>HTML TABLE</title>
</head><body>
<table>











mport-Excel .\Services.xlsx | ConvertTo-Html | Out-File .\Services.html -Encoding utf8
;;;;
%utl_psend;




































psql options

-d <dbname>      Specify the database name to connect to
-U <username>    Specify the database user
-h <host>        Specify the database server host
-p <port>        Specify the port number
-W               Force password prompt
-c "<command>"   Execute a single command and exit
-f <filename>    Execute commands from a file
--csv            Output results in CSV format
-a               Echo all input lines
-A               Unaligned output mode
-b               Echo failed SQL commands to stderr

psql meta commands

\l               List all databases
\c <dbname>      Connect to another database
\dt              List all tables
\d <table>       Describe a table (columns, types, etc.)
\dn              List all schemas
\df              List all functions
\dv              List all views
\du              List all users and roles
\g               Execute the previous command again
\s               Show command history
\i <file>        Execute commands from a file
\q                Quit psql
\?              Show help for all meta-commands

postgresql dictionary tables
   information_schema.columns where table='class'


In oto

%sqlitet             load sqlite table into sas with inferred typing
%sqlitex             load sqlite table into sas with typin

matlab-octave functions
                                                          g
table2matx.m         converts matlab dbtable to matrix
tagsets.sql          generate sqk and create table and insert
sql_create_table.m   called by sql_create_insert.m
sql_insert.m         called by sql_create_insert.m
sql_create_insert.m  create and insert matlab-octave table into postgre



INPUT                          PROCESS (CREATE TABLES)             OUTPUT (IMPORT TABLES)

SAS ACCESS IS NOT NEEDED       THREE POSTGRESQL TABLES             FINALLY A SAS DATSET

PROBLEM                         name  |sex|age|height|weight       SAS TABLE WORK.WANT
                               -------+---+---+------+------
WORK.CLASS                     Alice  |F  | 13|  56.5|   84        SEX     AVGAGE     AVGWGT
                               Barbara|F  | 13|  65.3|   98         M     14.0000    107.500
 NAME  SEX AGE WEIGHT HEIGHT   Carol  |F  | 14|  62.8|102.5         F     13.3333     94.833
                               Henry  |M  | 14|  63.5|102.5
Alfred  M   14  112.5  56.5    ....
Alice   F   13   84.0  65.3                                        SAS MWORK.METS
Barbara F   13   98.0  62.8    MEANS BY SEX
Carol   F   14  102.5  63.5                                        COLUMN_
Henry   M   14  102.5  61.2    sex|aveage|avgwgt                    NAME          DATA_TYPE
                               ---+------+------
                               M  | 14.00|107.50                   avgage     double precision
data CLASS;                    F  | 13.33| 94.83                   avghgt     double precision
informat                                                           avgwgt     double precision
  NAME $8.                     Coumn data types                    sex        character varying
  SEX $1.
  AGE 8.                       column_name|    data_type
  WEIGHT 8.                    -----------+------------------
  HEIGHT 8.                    age        |double precision
;                              height     |double precision
input                          weight     |double precision
 NAME SEX AGE WEIGHT           name       |character varying
 HEIGHT;                       sex        |character varying
cards4;
Alfred M 14 112.5 56.5
Alice F 13 84 65.3
Barbara F 13 98 62.8
Carol F 14 102.5 63.5
Henry M 14 102.5 61.2
;;;;
run;quit;

ods path (prepend) sasuser.templates(update);
%utl_sqlinsert(sashelp.class,c:/temp/sqlcreins.sql);



utl-exporting-tables-from-seven--=to-csv-files













   1  sas x commands create sql table class
   2  drop down to postgtresql full solution
   3  SAS macro to generate the create table and insert sql query script
   4  sas drop down to postgreSQL (data typing to and from postgreSQL
   5  Usefull postgreSQL CLI options and meta commands
   6  postgresql
       import sas dataset create postgresql table with sas datatypes
       process table
       create output postgres table
       export postgresql table back to sas with sas types

SOAPBOX ON

CONTENTS

 1 Better than csv files?
 2 12 databases  with common sas like numeric and characteer data types, varchar and float.
 3 sas tagset to create sas create table and insert script from a sas table
 4 SAS macro to convert sas to syntax 12 databases can use
 5 Drop down to postgresql and load sas table, process table, create new table and export table with meta datatype data.


1 BETTER THAN CSV FILES
========================

  Unlike csv files, this repo provides algorithms to create tables in many databases
  with data typing and I way to import
  data data with datatyping from many databases.


2 CREATE DATABASE TABLE WITH COMMON SAS LIKE NUMERIC AND CHARACTEER DATA TYPES
==============================================================================

  The key point is standardization of the create and insert sql clause.

  All these databases support varchar and float datatypes?

  PostgreSQL (all modern versions)
  SQLite (all versions)
  Microsoft SQL Server (since 2008+)
  MariaDB (MySQL-compatible, all versions)
  IBM Db2 (since at least version 9.7+)
  Amazon Redshift (PostgreSQL-compatible)
  CockroachDB (PostgreSQL-compatible)
  Snowflake
  Teradata
  SAP HANA
  Google BigQuery (with INSERT INTO or INSERT DML)
  Oracle (only 23c+; older versions like 19c/21c do not support this syntax)


3 SAS TAGSET TO CREATE SAS CREATE TABLE AND INSERT SCRIPT FOR A SAS TABLE
=========================================================================

  proc template ;
    define tagset tagsets.sql / STORE=sasuser.templates;

        /*---------------------------------------------------------------eric-*/
        /*-- Set up some look-up tables for convenience.                    --*/
        /*------------------------------------------------------------11Feb04-*/
        /* type translations */
        define event type_translations;
            set $types['string'] 'varchar';
            set $types['double'] 'float';
            set $types['int']    'integer';
        end;

        /* column name translation */
        define event name_translations;
            set $name_trans['desc'] 'description';
        end;

        define event initialize;
            trigger type_translations;
            trigger name_translations;

            /* types that need widths */
            set $types_with_widths['string'] "True";

            /* types that need quotes */
            set $types_with_quotes['string'] "True";
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Reset everything so we can run one proc print after another.   --*/
        /*------------------------------------------------------------11Feb04-*/
        define event table;
            unset $names;
            unset $col_types;
            unset $columns;
            unset $values;
            unset $lowname;
        end;


        define event colspec_entry;
            /*---------------------------------------------------------------eric-*/
            /*-- Ignore the obs column.  The value will get ignored because     --*/
            /*-- it will be in a header cell and we don't define a header       --*/
            /*-- event to catch it.                                             --*/
            /*------------------------------------------------------------12Feb04-*/
            break /if cmp(name, 'obs');

            /*---------------------------------------------------------------eric-*/
            /*-- Create a list of column names.  Translate the names            --*/
            /*-- if they are in the translate list.                             --*/
            /*------------------------------------------------------------11Feb04-*/
            set $lowname lowcase(name);
            do /if $name_trans[$lowname];
                set $names[] $name_trans[$lowname];
            else;
                set $names[] $lowname;
            done;

            /* keep a list of types */
            set $col_types[] type;

            /* make a list of column type definitions */
            set $col_def $types[type];

            /* append width if needed */
            /*set $col_def $col_def "(" width ")" /if $types_with_widths[type];*/
            set $col_def $col_def "(" "200" ")" /if $types_with_widths[type];

            set $columns[] $col_def;
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Catch the data label and get the data set name from it.        --*/
        /*------------------------------------------------------------11Feb04-*/
        define event output;
            start:
                set $table_name reverse(label);
                set $table_name scan($table_name, 1, '.');
                set $table_name reverse($table_name);
                set $table_name lowcase($table_name);
        end;

       /*---------------------------------------------------------------eric-*/
       /*-- Print out the create table statement before Any data           --*/
       /*-- rows come along.                                               --*/
       /*------------------------------------------------------------11Feb04-*/
        define event table_body;
            put "proc sql;" nl; put " Create table " $table_name "(";
            /* put "           "; */

            /* loop over the names, and column definitions */
            eval $i 1;
            unset $not_first;
            do /while $i <= $names;
                /* comma's only after the first name */
                put ', ' /if $not_first;
                put $names[$i] " ";
                put $columns[$i];
                eval $i $i+1;
                set $not_first "True";
            done;

            put ");" nl;
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Reset the values at the beginning of each row.  Print the      --*/
        /*-- insert statement at the end of each row.                       --*/
        /*------------------------------------------------------------11Feb04-*/
        define event row;
            start:
                unset $values;
            finish:
                trigger insert;
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Save away the data.  The Obs column won't hit this because     --*/
        /*-- it's a header.                                                 --*/
        /*------------------------------------------------------------12Feb04-*/
        define event data;
            do /if value;
                set $values[] strip(value);
            else;
                set $values[] ' ';
            done;
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Create the insert statement                                    --*/
        /*------------------------------------------------------------12Feb04-*/
        define event insert;
            finish:
                break /if ^$values;

                put "Insert into " $table_name;
                trigger print_names;
                put;
                put  " Values";
                trigger print_values;
                put ";" nl;
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Print the list of names.  This could use                       --*/
        /*-- a single putvars statement if it weren't for                   --*/
        /*-- the commas.                                                    --*/
        /*------------------------------------------------------------12Feb04-*/
        define event print_names;
            put "(";
            iterate $names;
            unset $not_first;
            do /while _value_;
                /* comma's only after the first name */
                put ", " /if $not_first;
                put lowcase(_value_);
                set $not_first "true";
                next $names;
            done;
            put ")";
        end;

        /*---------------------------------------------------------------eric-*/
        /*-- Print the values for the insert statement. Commas and quoting  --*/
        /*-- are an issue.  double up the quotes in strings.  Remove        --*/
        /*-- commas from numbers.                                           --*/
        /*------------------------------------------------------------12Feb04-*/
        define event print_values;
            put "(" ;

            eval $i 1;
            unset $not_first;

            iterate $values;

            do /while _value_;
                put ", " /if $not_first;

                do /if $types_with_quotes[$col_types[$i]];
                    put "'" ;
                    put tranwrd(_value_, "'", "''") /if ^cmp(_value_, ' ');
                    put "'";
                else;
                    do /if cmp(_value_, ' ');
                        put '0';
                    else;
                        put tranwrd(_value_, "," , "") ;
                    done;
                done;

                set $not_first "true";

                next $values;
                eval $i $i+1;
            done;

            put ")";
        end;

    end;
  run;

/*--- add template to sasuser.templates ---*/
ods path (prepend) sasuser.templates(update);

/*--- show sql script to create table ---*/
options ls=256;
filename tmp temp lrecl=4096;
ods tagsets.sql file=tmp;
proc print data=sashelp.class;
run;quit;
ods _all_ close; ** very important;

ods listing;
data _null_;
infile tmp end=dne;
input;
put _infile_;
if dne then put 'quit;';
run;quit;
filename tmp clear;

proc sql;
 Create table class(name varchar(200), sex varchar(200), age float, height float, weight float);
Insert into class(name, sex, age, height, weight) Values('Alfred', 'M', 14, 69.0, 112.5);
Insert into class(name, sex, age, height, weight) Values('Alice', 'F', 13, 56.5, 84.0);
Insert into class(name, sex, age, height, weight) Values('Barbara', 'F', 13, 65.3, 98.0);
Insert into class(name, sex, age, height, weight) Values('Carol', 'F', 14, 62.8, 102.5);
Insert into class(name, sex, age, height, weight) Values('Henry', 'M', 14, 63.5, 102.5);
...
quit;


4 SAS MACRO TO CONVERT SAS TO SYNTAX 12 DATABASES CAN USE (uses tagsets.sql)
=============================================================================

  %macro utl_sqlinsert(dsn,_out_)
     /des="send sql insert code to the log and clipbord paste buffer";

     options ls=256;

     filename tmp temp lrecl=4096;

     ods tagsets.sql file=tmp;

     proc print data=&dsn;
     run;quit;

     ods _all_ close; ** very important;


     data _null_;
     infile tmp end=dne;
     input;
     put _infile_;
     run;quit;


     filename _out_ "&_out_";
     data _null_;
      retain flg 0;
      length once $255 remain $255;
      infile tmp end=dne;
      file _out_;
      input;
      select;
         when (_n_ =1)           leave;
         when (_n_ < 3)  do;
             put _infile_;
             putlog _infile_;
         end;
         when (_infile_=:"Insert into" and flg=0)  do;
            flg=1;
            once=catx(' ',cats(scan(_infile_,1,')'),')'),'VALUES');
            remain=cats(scan(_infile_,2,')'),')');
            put once;
            putlog once;
            *put remain;
            *putlog remain;
         end;
         when (_infile_=:"Insert into") do;
            remain=substr(_infile_,index(_infile_,'Values')+6);
            if not dne then remain=translate(remain,',',';');
            put remain;
            putlog remain;
         end;
         * leave otherwise off to force error;
      end;
     run;quit;

     filename tmp clear;

     ods listing;

     options ls=255;

  %mend utl_sqlinsert;

  %utl_sqlinsert(sashelp.class,c:/temp/sqlcreins.sql);

  OUTPPUT SQL SCRIPT FOR ANY OF THE 12 DATBASES

   Create table class(name varchar(200), sex varchar(200), age float, height float, weight float);
  Insert into class(name, sex, age, height, weight) VALUES
  ('Alice', 'F', 13, 56.5, 84.0),
  ('Barbara', 'F', 13, 65.3, 98.0),
  ('Carol', 'F', 14, 62.8, 102.5),
  ('Henry', 'M', 14, 63.5, 102.5),
  ('James', 'M', 12, 57.3, 83.0),
  ('Jane', 'F', 12, 59.8, 84.5),
  ('Janet', 'F', 15, 62.5, 112.5),
  ('Jeffrey', 'M', 13, 62.5, 84.0),
  ('John', 'M', 12, 59.0, 99.5),
  ('Joyce', 'F', 11, 51.3, 50.5),
  ('Judy', 'F', 14, 64.3, 90.0),
  ('Louise', 'F', 12, 56.3, 77.0),
  ('Mary', 'F', 15, 66.5, 112.0),
  ('Philip', 'M', 16, 72.0, 150.0),
  ('Robert', 'M', 12, 64.8, 128.0),
  ('Ronald', 'M', 15, 67.0, 133.0),
  ('Thomas', 'M', 11, 57.5, 85.0),
  ('William', 'M', 15, 66.5, 112.0);


5 DROP DOWN TO POSTGRESQL AND LOAD SAS TABLE, PROCESS TABLE, CREATE NEW TABLE AND EXPORT TABLE WITH META DATATYPE DATA.
=======================================================================================================================

%macro utl_pgbegin;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/pg_pgm.sql";
%mend utl_pgbegin;

%macro utl_pgend(returnvar=N);
options noxwait noxsync;
  data _null_;
    length cmd $200;
    infile  "c:/temp/pg_pgm.sql";
    file  "c:/temp/pg_pgmx.sql" ;
    input;
    if left(_infile_) =: '-f ' then do;
      cmd=catx(' ','psql -U postgres -d template1',_infile_);
      putlog cmd;
      rc=system(strip(cmd));
    end;
    else do;
       put _infile_;
    end;
  run;quit;
  filename rut pipe  "psql -U postgres -d template1 -f c:/temp/pg_pgmx.sql > c:/temp/pg_pgm.log";
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    putlog _infile_;
    put _infile_;
  run;
  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/pg_pgm.log";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_pgend;

%utl_pgbegin;
parmcards4;
drop table if exists meta;
drop table if exists class;
drop table if exists tst;
drop table if exists stats;
drop table if exists stats;
\dt
;;;;
%utl_pgend;

%utlfkil(c:/temp/statscsv.csv);
%utlfkil(c:/temp/metacsv.csv);

/*--- -f has to be the first record ---*/
%utl_pgbegin;
parmcards4;
-f c:/temp/tst.sql
\dt
;;;;
%utl_pgend;
drop table if exists tst;
create
   table stats as
select
   sex
  ,avg(age) as avgage
  ,avg(weight) as avgwgt
  ,avg(height) as avghgt
from
  class
group
  by sex
;
\copy stats TO 'c:/temp/statscsv.csv' WITH CSV HEADER;
drop table if exists meta;
create
   table meta as
select
  column_name
 ,data_type
from
  information_schema.columns
where
  table_name = 'stats'
order
  by ordinal_position;
;
\copy meta TO 'c:/temp/metacsv.csv' WITH CSV HEADER;
;;;;
%utl_pgend;

proc datasets lib=work nolist nodetails;
 delete meta stats;
run;quit;

dm "dimport 'c:/temp/metacsv.csv' meta replace";
dm "dimport 'c:/temp/statscsv.csv' stats  replace";


proc print data=meta;
run;quit;

40 obs from META total obs=4
 COLUMN_
  NAME          DATA_TYPE

 sex        character varying
 avgage     double precision
 avgwgt     double precision
 avghgt     double precision

  40 obs from STATS total obs=2 09JUL2025:1
   SEX     AVGAGE     AVGWGT     AVGHGT

    M     13.3333    108.556    63.3444
    F     13.2222     90.111    60.5889


 Variable    Type    Len   Informat

 SEX         Char      1   $1.
 AVGAGE      Num       8   BEST32.
 AVGWGT      Num       8   BEST32.
 AVGHGT      Num       8   BEST32.



%macro pgcsvtyp(
   meta    = work.meta
  ,datacsv = c:/temp/statscsv.csv
  ,out     = statstyp
) / des="import sqlite table to sas dataset";

/*----
  %let meta    = work.meta;
  %let datacsv = c:/temp/statscsv.csv;
  %let out     = statstyp;
----*/

%macro utl_optlenpos(
       inp          /* input dataset  */
      ,out          /* output dataset */
      ,compress=binary   /* output compression */
      )
      / des="Create and apply a length statement to optimize variable attributes";

   /*
     Changed

         name of arrays to avoid clashes with input data (aded an under score)

         array num[&num]    _numeric_    to  array _num[&num]    _numeric_
         array lennum[&num] _temporary_  to  array _lennum[&num] _temporary_

         array chr[&chr] _character_     to  array _chr[&chr] _character_
         array lenchr[&chr] _temporary_  to  array _lenchr[&chr] _temporary_
    */

   %local retain num char dsid res nvars rc;

   * Input exist and/or empty;
   %let dsid  = %sysfunc(open(&inp,is));
   %let nvars = 0;
   %if &dsid ne 0 %then %do;
       %let nvars = %sysfunc(attrn(&dsid,NVARS));
   %end;

   %if &dsid ne 0 %then %do; %let rc=%sysfunc(close(&dsid)); %end;

   * Test for complete input;
   %put %sysfunc(ifc(%sysevalf(%superq(inp      )=,boolean) ,ERROR: Please Provide an Input dataset   ,));
   %put %sysfunc(ifc(%sysevalf(%superq(out      )=,boolean) ,ERROR: Please Provide an output dataset  ,));
   %put %sysfunc(ifc(%sysevalf(%superq(compress )=,boolean) ,ERROR: Please Provide compression        ,));
   %put %sysfunc(ifc(%sysevalf(%superq(dsid     )=0,boolean),ERROR: %sysfunc(sysmsg())                ,));
   %put %sysfunc(ifc(%sysevalf(%superq(nvars    )=0,boolean),ERROR: Dataset &inp is empty             ,));

    %let res= %eval
    (
        %sysfunc(ifc(%sysevalf(%superq(inp      )=,boolean),1,0))
      + %sysfunc(ifc(%sysevalf(%superq(out      )=,boolean),1,0))
      + %sysfunc(ifc(%sysevalf(%superq(compress )=,boolean),1,0))
      + %sysfunc(ifc(%sysevalf(%superq(nvars    )=0,boolean),1,0))
      + %sysfunc(ifc(%sysevalf(%superq(dsid     )=0,boolean),1,0))
    );

     %if &res = 0 %then %do; * passed;

        ods listing close;;
        ods output position=__layout;
        proc contents data=&inp position;
        run;quit;
        ods listing;

        * build retain statement;
        * use separated to eliminate leading blanks;
        proc sql noprint;
           select sum(type='Char'), sum(type='Num')
                  into :chr separated by ' ', :num  separated by ' ' from __layout;
        ;quit;

        data _null_;

           set &inp end=dne;

           %if &num ne 0 %then %do;

             array _num[&num]    _numeric_  ;
             array _lennum[&num] _temporary_;

           %end;

           %if &chr ne 0 %then %do;

             array _chr[&chr] _character_;
             array _lenchr[&chr] _temporary_;

             do __i=1 to dim(_chr);
                if lengthn(_chr[__i]) > _lenchr[__i] then _lenchr[__i]=length(_chr[__i]);
             end;

           %end;

           * if you can make the numeric variable integers this will usually cut the length of numeric in half;
           * this could be made more elegant but for maintenence reasons I kept it this way;
           * Rick Langston first proposed this;
           %if &num ne 0 %then %do;

             do i=1 to dim(_num);

                if missing(_num[i]) then _len=3;
                else do;
                  if _num[i] ne trunc( _num[i], 7 ) then _len = 8 ; else
                  if _num[i] ne trunc( _num[i], 6 ) then _len = 7 ; else
                  if _num[i] ne trunc( _num[i], 5 ) then _len = 6 ; else
                  if _num[i] ne trunc( _num[i], 4 ) then _len = 5 ; else
                  if _num[i] ne trunc( _num[i], 3 ) then _len = 4 ; else _len=3;
                end;
                if _len > _lennum[i] then _lennum[i]=_len;

              end;
           %end;

           * build and execute the program to optimize attributes;
           if dne then do;
              call execute(
              "data &out(
                   compress=&compress
                   label='Dataset &inp processed by utl_optlen')
              ;");
              call execute( 'retain');
              do until (dnepos);
                 set __layout(keep=variable) end=dnepos;
                 call execute( variable);
              end;
              call execute( ';length');

              %if &chr ne 0 %then %do;
               do __i=1 to dim(_chr);
                 var=catx(' ',vname(_chr[__i]),cats('$',put(_lenchr[__i],6.)));
                 call execute( var);
               end;
              %end;

              %if &num ne 0 %then %do;
               do __i=1 to dim(_num); * do not want I variable;
                 var=catx(' ',vname(_num[__i]),put(_lennum[__i],6.));
                 call execute( var);
               end;
              %end;
              call execute( ";set &inp;format _all_;informat _all_;run;quit;");

           end;

     %end;  * end do some work;

  run;quit;


%mend utl_optlenpos;


proc format;
 value $maptyp
  'double precision'    = '32.'
  'character varying'    = '$255.';
run;quit;
data _mapem_;
  set &meta ;
  typ=put(data_type,$maptyp.);
  drop data_type;
run;quit;
%array(_typ,data=_mapem_,var=typ);
%array(_nam,data=_mapem_,var=column_name);
data &out;
  informat
    %do_over(_nam _typ,phrase=?_nam ?_typ);
  infile "&datacsv" delimiter=',' firstobs=2;
  input
    %do_over(_nam,phrase=?);;
run;quit;
%arraydelete(_typ)
%arraydelete(_nam)
/*---- optimize variable lengths ----*/
%utl_optlenpos(&out,&out);
%mend pgcsvtyp;

%pgcsvtyp;


SEX     AVGAGE     AVGWGT     AVGHGT

 M     13.3333    108.556    63.3444
 F     13.2222     90.111    60.5889


#    Variable    Type    Len

1    SEX         Char      1
2    AVGAGE      Num       8
3    AVGWGT      Num       8
4    AVGHGT      Num       8






























\copy smmple_table to 'c:/temp/metacsv.csv' csv header;


































;;;;
%utl_pgend;

data;
c= 'cmd /K psql -U postgres -d template1 -f c:/temp/sqlcreins.sql ;';
call execute
run;quit;


drop table if exists class;
               ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;

x 'cmd /K psql -U postgres -d template1 -f c:/temp/sqlcreins.sql ;';

data ;
  set sashelp.class;
  input;
  if _n_=1 and and index(_infile_,'-f ') then do;
  cmd=catx(' ','psql -U postgres -d template1','_infile_,';');
  call exceute(cmd);





 --csv -d template1 -file c:/temp/pg_pgmx.sql >  c:/temp/pgcsv.csv";

















 data _null_;
   length cmd $200;
   infile  "c:/temp/pg_pgm.sql" sharebuffers;
   file  "c:/temp/pg_pgm.sql" ;
   input;
   if left(_infile_) =: '-f ' then do;
     cmd=catx(' ','cmd /K psql -U postgres -d template1',_infile_,';');
     putlog cmd;
     rc=system(strip(cmd));
   end;
   else put _infile_;
 run;quit;

 1     + "cmd /K psql -U postgres -d template1 -f c:/temp/sqlcreins.sql ;"
         -----------------------------------------------------------------
         180

 ERROR 180-322: Statement is not valid or it is used out of proper order.









































































ods _all_ close;
%utl_close;
proc printto;
run;quit;
ods _all_ close;



ods listing;
proc sql;
 Create table class (name varchar(200), sex varchar(200), age float, height float, weight float);
Insert into class(name, sex, age, height, weight) Values('Alfred', 'M', 14, 69.0, 112.5);
Insert into class(name, sex, age, height, weight) Values('Alice', 'F', 13, 56.5, 84.0);
Insert into class(name, sex, age, height, weight) Values('Barbara', 'F', 13, 65.3, 98.0);
Insert into class(name, sex, age, height, weight) Values('Carol', 'F', 14, 62.8, 102.5);
Insert into class(name, sex, age, height, weight) Values('Henry', 'M', 14, 63.5, 102.5);
Insert into class(name, sex, age, height, weight) Values('James', 'M', 12, 57.3, 83.0);
Insert into class(name, sex, age, height, weight) Values('Jane', 'F', 12, 59.8, 84.5);
Insert into class(name, sex, age, height, weight) Values('Janet', 'F', 15, 62.5, 112.5);
Insert into class(name, sex, age, height, weight) Values('Jeffrey', 'M', 13, 62.5, 84.0);
Insert into class(name, sex, age, height, weight) Values('John', 'M', 12, 59.0, 99.5);
Insert into class(name, sex, age, height, weight) Values('Joyce', 'F', 11, 51.3, 50.5);
Insert into class(name, sex, age, height, weight) Values('Judy', 'F', 14, 64.3, 90.0);
Insert into class(name, sex, age, height, weight) Values('Louise', 'F', 12, 56.3, 77.0);
Insert into class(name, sex, age, height, weight) Values('Mary', 'F', 15, 66.5, 112.0);
Insert into class(name, sex, age, height, weight) Values('Philip', 'M', 16, 72.0, 150.0);
Insert into class(name, sex, age, height, weight) Values('Robert', 'M', 12, 64.8, 128.0);
Insert into class(name, sex, age, height, weight) Values('Ronald', 'M', 15, 67.0, 133.0);
Insert into class(name, sex, age, height, weight) Values('Thomas', 'M', 11, 57.5, 85.0);
Insert into class(name, sex, age, height, weight) Values('William', 'M', 15, 66.5, 112.0);
;quit;
run;quit;

proc print data=class;
run;quit;


        run;quit;;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;



   ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
   ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
   ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
   ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
   ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;






ods listing;
proc print data=sashelp.class style=tagsets.sql;
run;quit;
ods _all_ close; ** very important;


















%utl_sqlinsert(sashelp.class);



%macro utl_pginsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;


   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;


   filename _out_ "c:/temp/sqlcreins.sql";
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file _out_;
    input;
    select;
       when (_n_ =1)           leave;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=catx(' ',cats(scan(_infile_,1,')'),')'),'VALUES');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          *put remain;
          *putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=substr(_infile_,index(_infile_,'Values')+6);
          if not dne then remain=translate(remain,',',';');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_pginsert;

ods path (prepend) sasuser.templates(update);
%utl_pginsert(sashelp.class);


3 SAS macro to generate the create table and insert sql query script

  %utl_sqlinsert(sashelp.class,c:/temp/sqlcreins.sql);

  outputs file
  c:/temp/sqlcreins.sql with

   Create table class(
     name varchar(200)
    ,sex varchar(200)
    ,age float
    ,height float
    ,weight flot
   );
   Insert into class(name, sex, age, height, weight) VALUES
   ('Robert', 'M', 12, 64.8, 128.0),
   ('Ronald', 'M', 15, 67.0, 133.0),
   ('Thomas', 'M', 11, 57.5, 85.0),
   ...
   ('William', 'M', 15, 66.5, 112.0);

4  sas drop down to postgreSQL (with data typing to and from postgreSQL)

   %utl_pgbegin;
   parmcards4;

%utl_pgbegin;
parmcards4;
-f c:/temp/sqlcreins.sql;
;;;;
%mend utl_pgend ;
%utl_pgend;
\dt;
drop
  table if exists want;
drop
  table if exists meta;
select
  *
from
  class
;
create
  table want as
select
  sex
 ,avg(age) as avgAge
 ,avg(height) as avgHgt
 ,avg(weight) as avgWgt
from
  class
group
  by sex
;
select
   *
from
   want
;
create
   table meta as
select
  column_name
 ,data_type
from
  information_schema.columns
where
  table_name = 'want'
;
select
  *
from
  meta
\copy (select * from meta) to 'c:/temp/metacsv.csv' csv header;
\copy (select * from want) to 'c:/temp/wantcsv.csv' csv header;
;
\o c:/temp/lglog.txt;
;;;;
%mend utl_pgend ;
%utl_pgend;















%utl_pgbegin;
parmcards4;
\dt;
drop
  table if exists want;
drop
  table if exists meta;
select
  *
from
  class
;
create
  table want as
select
  sex
 ,avg(age) as avgAge
 ,avg(height) as avgHgt
 ,avg(weight) as avgWgt
from
  class
group
  by sex
;
select
   *
from
   want
;
create
   table meta as
select
  column_name
 ,data_type
from
  information_schema.columns
where
  table_name = 'want'
;
select
  *
from
  meta
\copy (select * from meta) to 'c:/temp/metacsv.csv' csv header;
\copy (select * from want) to 'c:/temp/wantcsv.csv' csv header;
;
\o c:/temp/lglog.txt;
;;;;
%utl_pgend(create_table=c:/temp/sqlcreins.sql);

dm "dimport 'c:/temp/metacsv.csv' meta  replace";
dm "dimport 'c:/temp/wantcsv.csv' want  replace";




4  Usefull postgreSQL CLI options and meta commands

















psql options

-d <dbname>      Specify the database name to connect to
-U <username>    Specify the database user
-h <host>        Specify the database server host
-p <port>        Specify the port number
-W               Force password prompt
-c "<command>"   Execute a single command and exit
-f <filename>    Execute commands from a file
--csv            Output results in CSV format
-a               Echo all input lines
-A               Unaligned output mode
-b               Echo failed SQL commands to stderr

psql meta commands

\l               List all databases
\c <dbname>      Connect to another database
\dt              List all tables
\d <table>       Describe a table (columns, types, etc.)
\dn              List all schemas
\df              List all functions
\dv              List all views
\du              List all users and roles
\g               Execute the previous command again
\s               Show command history
\i <file>        Execute commands from a file
\q                Quit psql
\?              Show help for all meta-commands

postgresql dictionary tables

   information_schema.columns where table='class'


In oto

%sqlitet             load sqlite table into sas with inferred typing
%sqlitex             load sqlite table into sas with typin

matlab-octave functions
                                                          g
table2matx.m         converts matlab dbtable to matrix
tagsets.sql          generate sqk and create table and insert
sql_create_table.m   called by sql_create_insert.m
sql_insert.m         called by sql_create_insert.m
sql_create_insert.m  create and insert matlab-octave table into postgre



INPUT                          PROCESS (CREATE TABLES)             OUTPUT (IMPORT TABLES)

SAS ACCESS IS NOT NEEDED       THREE POSTGRESQL TABLES             FINALLY A SAS DATSET

PROBLEM                         name  |sex|age|height|weight       SAS TABLE WORK.WANT
                               -------+---+---+------+------
WORK.CLASS                     Alice  |F  | 13|  56.5|   84        SEX     AVGAGE     AVGWGT
                               Barbara|F  | 13|  65.3|   98         M     14.0000    107.500
 NAME  SEX AGE WEIGHT HEIGHT   Carol  |F  | 14|  62.8|102.5         F     13.3333     94.833
                               Henry  |M  | 14|  63.5|102.5
Alfred  M   14  112.5  56.5    ....
Alice   F   13   84.0  65.3                                        SAS MWORK.METS
Barbara F   13   98.0  62.8    MEANS BY SEX
Carol   F   14  102.5  63.5                                        COLUMN_
Henry   M   14  102.5  61.2    sex|aveage|avgwgt                    NAME          DATA_TYPE
                               ---+------+------
                               M  | 14.00|107.50                   avgage     double precision
data CLASS;                    F  | 13.33| 94.83                   avghgt     double precision
informat                                                           avgwgt     double precision
  NAME $8.                     Coumn data types                    sex        character varying
  SEX $1.
  AGE 8.                       column_name|    data_type
  WEIGHT 8.                    -----------+------------------
  HEIGHT 8.                    age        |double precision
;                              height     |double precision
input                          weight     |double precision
 NAME SEX AGE WEIGHT           name       |character varying
 HEIGHT;                       sex        |character varying
cards4;
Alfred M 14 112.5 56.5
Alice F 13 84 65.3
Barbara F 13 98 62.8
Carol F 14 102.5 63.5
Henry M 14 102.5 61.2
;;;;
run;quit;

ods path (prepend) sasuser.templates(update);
%utl_sqlinsert(sashelp.class,c:/temp/sqlcreins.sql);



which sql realtional databases support the following insert data syntax?

Insert into class(name, sex, age, height, weight) VALUES
('Robert', 'M', 12, 64.8, 128.0),
('Ronald', 'M', 15, 67.0, 133.0),
('Thomas', 'M', 11, 57.5, 85.0),
('William', 'M', 15, 66.5, 112.0);
























psql options

-d <dbname>      Specify the database name to connect to
-U <username>    Specify the database user
-h <host>        Specify the database server host
-p <port>        Specify the port number
-W               Force password prompt
-c "<command>"   Execute a single command and exit
-f <filename>    Execute commands from a file
--csv            Output results in CSV format
-a               Echo all input lines
-A               Unaligned output mode
-b               Echo failed SQL commands to stderr

psql meta commands

\l               List all databases
\c <dbname>      Connect to another database
\dt              List all tables
\d <table>       Describe a table (columns, types, etc.)
\dn              List all schemas
\df              List all functions
\dv              List all views
\du              List all users and roles
\g               Execute the previous command again
\s               Show command history
\i <file>        Execute commands from a file
\q                Quit psql
\?              Show help for all meta-commands

postgresql dictionary tables
   information_schema.columns where table='class'


Related macros and matlab-octave functions

%sqlitet             load sqlite table into sas with inferred typing
%sqlitex             load sqlite table into sas with typin

matlab-octave functions
                                                          g
table2matx.m         converts matlab dbtable to matrix
tagsets.sql          generate sqk and create table and insert
sql_create_table.m   called by sql_create_insert.m
sql_insert.m         called by sql_create_insert.m
sql_create_insert.m  create and insert matlab-octave table into postgre

x 'psql -U postgres -d template1 -c "drop table class;"';
x 'psql -U postgres -d template1 -c "\dt;"';
x 'psql -U postgres -d template1 -f c:/temp/sqlcreins.sql';
x 'cmd /K psql -U postgres -d template1 -c "\dt;"';
x 'psql -U postgres -d template1 -c "select * from class;"';

%let p2=%str(-c ""\dt;"" ");
%put &=p2;





%macro xq(psql);
 data _null_;
  length p1 p2 $200;
  p1=catx(' '
   ,'cmd /K'
   ,"'"
   ,'psql -U postgres -d template1');
  put p1=;
  p2=&psql;
  put p2=;
  res=catx(' ',p1,p2,"';");
  put res=;
  rc=system(strip(res));
 run;quit;
%mend xq;



%xq('-c "\dt;"');
%xq('-c "drop table tst;"');
%xq('-c
  "create
     table tst (id real);
  insert
     into tst(id)
  values
     (100),(200),(300),(400)"');
%xq('-c "select * from tst;"');






psql -U postgres -d template1 -c "drop table if exists teams;"











%qsysfunc(compbl(

%let lon=
"create table tst (id real);
insert into tst(id) values
(100),(200),(300),(400))"
%put &=lon;

%xq('-c "create table tst (id real);
insert into tst(id) values
(100),(200),(300),(400)"');


%xq('-c
  "create
     table tst (id real);
  insert
     into tst(id)
  values
     (100),(200),(300),(400)"');











     ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
     ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
     ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
     ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
     ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;















           ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;

   psql=cats(&psql
   resolv=catx(' ',"cmd /K 'psql -U postgres -d template1",&psql);
   put resolv;
 run;quit;

         'cmd /K "psql -U postgres -d template1 -c ""\dt;"" ;"'
         x 'cmd /K "psql -U postgres -d template1 -c ""\dt;"""';
         x 'cmd /K "psql -U postgres -d template1 -c ""\dt;"""';

x 'cmd /k psql -U postgres -d template1 -c "\dt;"';







%let pfx=psql -U postgres -d template1;

x "&pfx -c 'drop table class;'";
x "&pfx -c '\dt;'";
x "&pfx -f c:/temp/sqlcreins.sql -c '\dt;";
x "&pfx -c '\dt;'";
x "&pfx -c 'select * from class;'";


INPUT                                 PROCESS                                        OUTPUT
======                                =======

WORK.CLASS

 NAME  SEX AGE WEIGHT HEIGHT         1 SAS X COMMANDS CREATE SQL TABLE CLASS       /dt

Alfred  M   14  112.5  56.5            a using defaults                                    List of relations
Alice   F   13   84.0  65.3               user postgres default admin user         Schema |  Name  | Type  |  Owner
Barbara F   13   98.0  62.8               template1 default builtin database       -------+--------+-------+----------
Carol   F   14  102.5  63.5            b drop table class if exists                public | class  | table | postgres
Henry   M   14  102.5  61.2            c display all all tables in template        public | meta   | table | postgres
                                       d create postgresql table tst               public | sample | table | postgres
                                       c shiow new table tst                       public | want   | table | postgres
data CLASS;                            e display table rows
informat
  NAME $8.                           %macro pgxeq(psql);                           select * from tst
  SEX $1.                             data _null_;                                  id
  AGE 8.                               length p1 p2 $200;                          -----
  WEIGHT 8.                            p1=catx(' '                                  100
  HEIGHT 8.                              ,'cmd /K'                                  200
;                                        ,"'"                                       300
input                                    ,'psql -U postgres -d template1');         400
 NAME SEX AGE WEIGHT                   put p1=;
 HEIGHT;                               p2=&psql;
cards4;                                put p2=;
Alfred M 14 112.5 56.5                 res=catx(' ',p1,p2,"';");
Alice F 13 84 65.3                     put res=;
Barbara F 13 98 62.8                   call system(res);
Carol F 14 102.5 63.5                 run;quit;
Henry M 14 102.5 61.2                %mend pgxeq;
;;;;
run;quit;
                                     %xq('-c "drop table tst;"');
                                     %xq('-c "\dt;"');
                                     %xq('-c
                                       "create
                                          table tst (id real);
                                       insert
                                          into tst(id)
                                       values
                                          (100),(200),(300),(400)"');
                                     %xq('-c "\dt;"');
                                     %xq('-c "select * from tst;"');














   CONTENTS

    PREP (see end of this message for macros

      A  compile tagset sql you only need to do this once
      B  complile sas macro utl_sqlinsert
         This creates the create and instert data sql query

    TWO SOLUTIONS

      1  sas x commands partial solution just creating postgres table
      2  drop down to postgtresql full solution


psql options

-d <dbname>      Specify the database name to connect to
-U <username>    Specify the database user
-h <host>        Specify the database server host
-p <port>        Specify the port number
-W               Force password prompt
-c "<command>"   Execute a single command and exit
-f <filename>    Execute commands from a file
--csv            Output results in CSV format
-a               Echo all input lines
-A               Unaligned output mode
-b               Echo failed SQL commands to stderr

psql meta commands

\l               List all databases
\c <dbname>      Connect to another database
\dt              List all tables
\d <table>       Describe a table (columns, types, etc.)
\dn              List all schemas
\df              List all functions
\dv              List all views
\du              List all users and roles
\g               Execute the previous command again
\s               Show command history
\i <file>        Execute commands from a file
\q                Quit psql
\?              Show help for all meta-commands

postgresql dictionary tables

   information_schema.columns where table='class'


In oto

%sqlitet             load sqlite table into sas with inferred typing
%sqlitex             load sqlite table into sas with typin

matlab-octave functions
                                                          g
table2matx.m         converts matlab dbtable to matrix
tagsets.sql          generate sqk and create table and insert
sql_create_table.m   called by sql_create_insert.m
sql_insert.m         called by sql_create_insert.m
sql_create_insert.m  create and insert matlab-octave table into postgre

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data class;
 set sashelp.class;


d:\csv\have.csv

NAME,SEX,AGE,WEIGHT
Alfred,M,14,112.5
Alice,F,13,84
Barbara,F,13,98
Carol,F,14,102.5
Henry,M,14,102.5

data have;
informat
  NAME $8.
  SEX $1.
  AGE 8
  WEIGHT 8.
  HEIGHT 8.
;


/**************************************************************************************************************************/
/* WO    RK.HAVE                                                                                                          */
/*                                                                                                                        */
/*  NAME   SEX AGE  WEIGHT                                                                                                */
/*                                                                                                                        */
/* Alfred   M   14   112.5                                                                                                */
/* Alice    F   13    84.0                                                                                                */
/* Barbara  F   13    98.0                                                                                                */
/* Carol    F   14   102.5                                                                                                */
/* Henry    M   14   102.5                                                                                                */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

x 'notepad';

/*--- CREATE THE SQL QUERY TEXT TO CREATE TABLE CLASS AND INSTERT DATA ---*/

ods path (prepend) sasuser.templates(update);
%utl_sqlinsert(sashelp.class,c:/temp/sqlcreins.sql);

c:/temp/sqlcreins.sql

Create table class(name text, sex text, age float, height real, weight real);
Insert into class(name, sex, age, height, weight) VALUES
('Alice', 'F', 13, 56.5, 84.0)
('Barbara', 'F', 13, 65.3, 98.0)
('Carol', 'F', 14, 62.8, 102.5)
('Henry', 'M', 14, 63.5, 102.5)
('James', 'M', 12, 57.3, 83.0)
('Jane', 'F', 12, 59.8, 84.5)
('Janet', 'F', 15, 62.5, 112.5)
('Jeffrey', 'M', 13, 62.5, 84.0)
('John', 'M', 12, 59.0, 99.5)
('Joyce', 'F', 11, 51.3, 50.5)
('Judy', 'F', 14, 64.3, 90.0)
('Louise', 'F', 12, 56.3, 77.0)
('Mary', 'F', 15, 66.5, 112.0)
('Philip', 'M', 16, 72.0, 150.0)
('Robert', 'M', 12, 64.8, 128.0)
('Ronald', 'M', 15, 67.0, 133.0)
('Thomas', 'M', 11, 57.5, 85.0)
('William', 'M', 15, 66.5, 112.0);

/*--- THIS WILL ADD TABLE CLASS TO DATABASE TEMPLATE1 ---*/

x 'psql -U postgres -d template1 -c "drop table class;"';
x 'psql -U postgres -d template1 -c "\dt;"';
x 'psql -U postgres -d template1 -f c:/temp/sqlcreins.sql -c "\dt;" > c:/temp/pglog.txt;';
x 'psql -U postgres -d template1 -c "\dt;"';
x 'psql -U postgres -d template1 -c "select * from class;"';

psql -U postgres -d template1 -c "\dt;"

C:\Windows\system32>psql -U postgres -d template1 -c "\dt;"
         List of relations
 Schema |  Name  | Type  |  Owner
--------+--------+-------+----------
 public | class  | table | postgres

%utl_pgbegin;
parmcards4;
\dt;
drop
  table if exists want;
drop
  table if exists meta;
select
  *
from
  class
;
create
  table want as
select
  sex
 ,avg(age) as avgAge
 ,avg(height) as avgHgt
 ,avg(weight) as avgWgt
from
  class
group
  by sex
;
select
   *
from
   want
;
create
   table meta as
select
  column_name
 ,data_type
from
  information_schema.columns
where
  table_name = 'want'
;
select
  *
from
  meta
\copy (select * from meta) to 'c:/temp/metacsv.csv' csv header;
\copy (select * from want) to 'c:/temp/wantcsv.csv' csv header;
;
\o c:/temp/lglog.txt;
;;;;
%utl_pgend(create_table=c:/temp/sqlcreins.sql);

dm "dimport 'c:/temp/metacsv.csv' meta  replace";
dm "dimport 'c:/temp/wantcsv.csv' want  replace";


x 'cmd /K "psql -U postgres -d template1 -c "\dt;""';


%macro utl_pgbegin;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/pg_pgm.sql";
%mend utl_pgbegin;

%macro utl_pgend(returnvar=N,create_table=N);
options noxwait noxsync;
%if "&create_table" ^= "N"  %then %do;
  x "psql -U postgres -d template1 -f &create_table;";
%end;
filename rut pipe  "psql -U postgres -d template1 -f c:/temp/pg_pgm.sql > c:/temp/pg_pgm.log";
run;quit;
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    put _infile_;
    putlog _infile_;
  run;
  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/pg_pgm.log";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_pgend;


















filename rut pipe  "psql -U postgres -d template1 -file c:/temp/pg_pgmx.sql > c:/temp/pgcsv.csv";
















%macro utl_sqlinsert(dsn,_out_)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;


   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;


   filename _out_ "&_out_";
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file _out_;
    input;
    select;
       when (_n_ =1)           leave;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=catx(' ',cats(scan(_infile_,1,')'),')'),'VALUES');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          *put remain;
          *putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=substr(_infile_,index(_infile_,'Values')+6);
          if not dne then remain=translate(remain,',',';');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;

ods path (prepend) sasuser.templates(update);
%utl_sqlinsert(sashelp.class,c:/temp/sqlcreins.sql);












Data Type      Category     Count      Databases Supporting It
VARCHAR        Text         11      All except Google Big Query
INTEGER        Numeric      12      PostgreSQL, SQLite, Microsoft SQL Server, MariaDB, IBM Db2, Amazon Redshift, CockroachDB, Snowflake, Teradata, SAP HANA, Google Big Query, Oracle








Create table class(name text, sex text, age float, height real, weight real);
Insert into class(name, sex, age, height, weight) VALUES
('Robert', 'M', 12, 64.8, 128.0)
('Ronald', 'M', 15, 67.0, 133.0)
('Thomas', 'M', 11, 57.5, 85.0)
('William', 'M', 15, 66.5, 112.0);

This will ahh table class to database template1
x 'psql -U postgres -d template1 -c ;"';
x 'psql -U postgres -d template1 -file c:/temp/sqlcreins.sql -c "\dt;"';


what is the  numeric, excluding integer and decimal, data type shared greatest number of the following databases.

All support varchar and float (8byte)

PostgreSQL
SQLite
Microsoft SQL Server
MariaDB
IBM Db2
Amazon Redshift
Cockroach DB
Snowflake
Teradata
SAPHANA
Google Big Query
Oracle


do all of these databases support varchar and  datatype
PostgreSQL
SQLite
Microsoft SQL Server
MariaDB
IBM Db2
Amazon Redshift
Cockroach DB
Snowflake
Teradata
SAPHANA
Google Big Query
Oracle






%macro utl_pgbegin(create_table=N);
%global create_table;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/ps_pgm.ps1";
%mend utl_pgbegin;



Create table class(name varchar, age float, height real, weight real);



psql -U postgres -d template1 -f c:/temp/sqlcreins.sql


Create table class(name text, sex text, age float, height real, weight real);
Insert into class(name, sex, age, height, weight) VALUES
('Alice', 'F', 13, 56.5, 84.0)
('Barbara', 'F', 13, 65.3, 98.0)
('Carol', 'F', 14, 62.8, 102.5)
('Henry', 'M', 14, 63.5, 102.5)
('James', 'M', 12, 57.3, 83.0)
('Jane', 'F', 12, 59.8, 84.5)
('Janet', 'F', 15, 62.5, 112.5)
('Jeffrey', 'M', 13, 62.5, 84.0)
('John', 'M', 12, 59.0, 99.5)
('Joyce', 'F', 11, 51.3, 50.5)
('Judy', 'F', 14, 64.3, 90.0)
('Louise', 'F', 12, 56.3, 77.0)
('Mary', 'F', 15, 66.5, 112.0)
('Philip', 'M', 16, 72.0, 150.0)
('Robert', 'M', 12, 64.8, 128.0)
('Ronald', 'M', 15, 67.0, 133.0)
('Thomas', 'M', 11, 57.5, 85.0)
('William', 'M', 15, 66.5, 112.0);


CREATE TABLE IF NOT EXISTS patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');


%macro utl_pgend(returnvar=N);
options noxwait noxsync;

   run;quit;
     data _null_;
       file print;
       infile rut recfm=v lrecl=32756;
       input;
       put _infile_;
       putlog _infile_;
     run;
%end;
%else %do;
    data _null_;
       file "&create_table" end=dne;
       do until (dne);
         input;
         put _infile_;
       end;
      filename rut pipe  "psql -U postgres --csv -d template1 -file c:/temp/pg_pgmx.sql >  c:/temp/pgcsv.csv";

  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/ps_pgm.log";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_pgend;























%macro utl_pgbegin(create_table=N);
%global create_table;
%utlfkil(c:/temp/ps_pgm.ps);
%utlfkil(c:/temp/ps_pgm.log);
filename ft15f001 "c:/temp/pg_pgm.sql";
%mend utl_pgbegin;

filename rut pipe  "psql -U postgres -d template1 -file &create_file;";
filename rut pipe  "psql -U postgres --csv -d template1 -file c:/temp/pg_pgm.sql >  c:/temp/pgcsv.csv";



psql -U postgres -d template1 \dt



x 'psql -U postgres -d template1 -c "\dt" > c:/temp/pglog.txt';






%macro utl_pgend(returnvar=N);
options noxwait noxsync;

   run;quit;
     data _null_;
       file print;
       infile rut recfm=v lrecl=32756;
       input;
       put _infile_;
       putlog _infile_;
     run;
%end;
%else %do;
    data _null_;
       file "&create_table" end=dne;
       do until (dne);
         input;
         put _infile_;
       end;
      filename rut pipe  "psql -U postgres --csv -d template1 -file c:/temp/pg_pgmx.sql >  c:/temp/pgcsv.csv";

  filename ft15f001 clear;
  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile "c:/temp/ps_pgm.log";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_pgend;































































proc template ;
  define tagset tagsets.sql / STORE=sasuser.templates;

      /*---------------------------------------------------------------eric-*/
      /*-- Set up some look-up tables for convenience.                    --*/
      /*------------------------------------------------------------11Feb04-*/
      /* type translations */
      define event type_translations;
          set $types['string'] 'varchar';
          set $types['double'] 'float';
          set $types['int']    'integer';
      end;

      /* column name translation */
      define event name_translations;
          set $name_trans['desc'] 'description';
      end;

      define event initialize;
          trigger type_translations;
          trigger name_translations;

          /* types that need widths */
          set $types_with_widths['string'] "True";

          /* types that need quotes */
          set $types_with_quotes['string'] "True";
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Reset everything so we can run one proc print after another.   --*/
      /*------------------------------------------------------------11Feb04-*/
      define event table;
          unset $names;
          unset $col_types;
          unset $columns;
          unset $values;
          unset $lowname;
      end;


      define event colspec_entry;
          /*---------------------------------------------------------------eric-*/
          /*-- Ignore the obs column.  The value will get ignored because     --*/
          /*-- it will be in a header cell and we don't define a header       --*/
          /*-- event to catch it.                                             --*/
          /*------------------------------------------------------------12Feb04-*/
          break /if cmp(name, 'obs');

          /*---------------------------------------------------------------eric-*/
          /*-- Create a list of column names.  Translate the names            --*/
          /*-- if they are in the translate list.                             --*/
          /*------------------------------------------------------------11Feb04-*/
          set $lowname lowcase(name);
          do /if $name_trans[$lowname];
              set $names[] $name_trans[$lowname];
          else;
              set $names[] $lowname;
          done;

          /* keep a list of types */
          set $col_types[] type;

          /* make a list of column type definitions */
          set $col_def $types[type];

          /* append width if needed */
          /*set $col_def $col_def "(" width ")" /if $types_with_widths[type];*/
          set $col_def $col_def "(" "200" ")" /if $types_with_widths[type];

          set $columns[] $col_def;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Catch the data label and get the data set name from it.        --*/
      /*------------------------------------------------------------11Feb04-*/
      define event output;
          start:
              set $table_name reverse(label);
              set $table_name scan($table_name, 1, '.');
              set $table_name reverse($table_name);
              set $table_name lowcase($table_name);
      end;

     /*---------------------------------------------------------------eric-*/
     /*-- Print out the create table statement before Any data           --*/
     /*-- rows come along.                                               --*/
     /*------------------------------------------------------------11Feb04-*/
      define event table_body;
          put "proc sql;" nl; put " Create table " $table_name "(";
          /* put "           "; */

          /* loop over the names, and column definitions */
          eval $i 1;
          unset $not_first;
          do /while $i <= $names;
              /* comma's only after the first name */
              put ', ' /if $not_first;
              put $names[$i] " ";
              put $columns[$i];
              eval $i $i+1;
              set $not_first "True";
          done;

          put ");" nl;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Reset the values at the beginning of each row.  Print the      --*/
      /*-- insert statement at the end of each row.                       --*/
      /*------------------------------------------------------------11Feb04-*/
      define event row;
          start:
              unset $values;
          finish:
              trigger insert;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Save away the data.  The Obs column won't hit this because     --*/
      /*-- it's a header.                                                 --*/
      /*------------------------------------------------------------12Feb04-*/
      define event data;
          do /if value;
              set $values[] strip(value);
          else;
              set $values[] ' ';
          done;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Create the insert statement                                    --*/
      /*------------------------------------------------------------12Feb04-*/
      define event insert;
          finish:
              break /if ^$values;

              put "Insert into " $table_name;
              trigger print_names;
              put;
              put  " Values";
              trigger print_values;
              put ";" nl;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Print the list of names.  This could use                       --*/
      /*-- a single putvars statement if it weren't for                   --*/
      /*-- the commas.                                                    --*/
      /*------------------------------------------------------------12Feb04-*/
      define event print_names;
          put "(";
          iterate $names;
          unset $not_first;
          do /while _value_;
              /* comma's only after the first name */
              put ", " /if $not_first;
              put lowcase(_value_);
              set $not_first "true";
              next $names;
          done;
          put ")";
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Print the values for the insert statement. Commas and quoting  --*/
      /*-- are an issue.  double up the quotes in strings.  Remove        --*/
      /*-- commas from numbers.                                           --*/
      /*------------------------------------------------------------12Feb04-*/
      define event print_values;
          put "(" ;

          eval $i 1;
          unset $not_first;

          iterate $values;

          do /while _value_;
              put ", " /if $not_first;

              do /if $types_with_quotes[$col_types[$i]];
                  put "'" ;
                  put tranwrd(_value_, "'", "''") /if ^cmp(_value_, ' ');
                  put "'";
              else;
                  do /if cmp(_value_, ' ');
                      put '0';
                  else;
                      put tranwrd(_value_, "," , "") ;
                  done;
              done;

              set $not_first "true";

              next $values;
              eval $i $i+1;
          done;

          put ")";
      end;

  end;
run;



%macro utl_pginsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;


   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;


   filename _out_ "c:/temp/sqlcreins.sql";
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file _out_;
    input;
    select;
       when (_n_ =1)           leave;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=catx(' ',cats(scan(_infile_,1,')'),')'),'VALUES');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          *put remain;
          *putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=substr(_infile_,index(_infile_,'Values')+6);
          if not dne then remain=translate(remain,',',';');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_pginsert;

ods path (prepend) sasuser.templates(update);
%utl_pginsert(sashelp.class);

%utl_psbegin;
parmcards4;
$sqlFile = "c:\temp\sql\creins.sql"
$database = "d:/sqlit/test.db"

sqlite3 "d:/sqlit/test.db"
sqlite3 $database ".read $sqlFile"
;;;;
%utl_psend;

















































proc template ;
  define tagset tagsets.sql / STORE=sasuser.templates;

      /*---------------------------------------------------------------eric-*/
      /*-- Set up some look-up tables for convenience.                    --*/
      /*------------------------------------------------------------11Feb04-*/
      /* type translations */
      define event type_translations;
          set $types['string'] 'varchar';
          set $types['double'] 'float';
          set $types['int']    'integer';
      end;

      /* column name translation */
      define event name_translations;
          set $name_trans['desc'] 'description';
      end;

      define event initialize;
          trigger type_translations;
          trigger name_translations;

          /* types that need widths */
          set $types_with_widths['string'] "True";

          /* types that need quotes */
          set $types_with_quotes['string'] "True";
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Reset everything so we can run one proc print after another.   --*/
      /*------------------------------------------------------------11Feb04-*/
      define event table;
          unset $names;
          unset $col_types;
          unset $columns;
          unset $values;
          unset $lowname;
      end;


      define event colspec_entry;
          /*---------------------------------------------------------------eric-*/
          /*-- Ignore the obs column.  The value will get ignored because     --*/
          /*-- it will be in a header cell and we don't define a header       --*/
          /*-- event to catch it.                                             --*/
          /*------------------------------------------------------------12Feb04-*/
          break /if cmp(name, 'obs');

          /*---------------------------------------------------------------eric-*/
          /*-- Create a list of column names.  Translate the names            --*/
          /*-- if they are in the translate list.                             --*/
          /*------------------------------------------------------------11Feb04-*/
          set $lowname lowcase(name);
          do /if $name_trans[$lowname];
              set $names[] $name_trans[$lowname];
          else;
              set $names[] $lowname;
          done;

          /* keep a list of types */
          set $col_types[] type;

          /* make a list of column type definitions */
          set $col_def $types[type];

          /* append width if needed */
          /*set $col_def $col_def "(" width ")" /if $types_with_widths[type];*/
          set $col_def $col_def "(" "200" ")" /if $types_with_widths[type];

          set $columns[] $col_def;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Catch the data label and get the data set name from it.        --*/
      /*------------------------------------------------------------11Feb04-*/
      define event output;
          start:
              set $table_name reverse(label);
              set $table_name scan($table_name, 1, '.');
              set $table_name reverse($table_name);
              set $table_name lowcase($table_name);
      end;

     /*---------------------------------------------------------------eric-*/
     /*-- Print out the create table statement before Any data           --*/
     /*-- rows come along.                                               --*/
     /*------------------------------------------------------------11Feb04-*/
      define event table_body;
          put "proc sql;" nl; put " Create table " $table_name "(";
          /* put "           "; */

          /* loop over the names, and column definitions */
          eval $i 1;
          unset $not_first;
          do /while $i <= $names;
              /* comma's only after the first name */
              put ', ' /if $not_first;
              put $names[$i] " ";
              put $columns[$i];
              eval $i $i+1;
              set $not_first "True";
          done;

          put ");" nl;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Reset the values at the beginning of each row.  Print the      --*/
      /*-- insert statement at the end of each row.                       --*/
      /*------------------------------------------------------------11Feb04-*/
      define event row;
          start:
              unset $values;
          finish:
              trigger insert;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Save away the data.  The Obs column won't hit this because     --*/
      /*-- it's a header.                                                 --*/
      /*------------------------------------------------------------12Feb04-*/
      define event data;
          do /if value;
              set $values[] strip(value);
          else;
              set $values[] ' ';
          done;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Create the insert statement                                    --*/
      /*------------------------------------------------------------12Feb04-*/
      define event insert;
          finish:
              break /if ^$values;

              put "Insert into " $table_name;
              trigger print_names;
              put;
              put  " Values";
              trigger print_values;
              put ";" nl;
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Print the list of names.  This could use                       --*/
      /*-- a single putvars statement if it weren't for                   --*/
      /*-- the commas.                                                    --*/
      /*------------------------------------------------------------12Feb04-*/
      define event print_names;
          put "(";
          iterate $names;
          unset $not_first;
          do /while _value_;
              /* comma's only after the first name */
              put ", " /if $not_first;
              put lowcase(_value_);
              set $not_first "true";
              next $names;
          done;
          put ")";
      end;

      /*---------------------------------------------------------------eric-*/
      /*-- Print the values for the insert statement. Commas and quoting  --*/
      /*-- are an issue.  double up the quotes in strings.  Remove        --*/
      /*-- commas from numbers.                                           --*/
      /*------------------------------------------------------------12Feb04-*/
      define event print_values;
          put "(" ;

          eval $i 1;
          unset $not_first;

          iterate $values;

          do /while _value_;
              put ", " /if $not_first;

              do /if $types_with_quotes[$col_types[$i]];
                  put "'" ;
                  put tranwrd(_value_, "'", "''") /if ^cmp(_value_, ' ');
                  put "'";
              else;
                  do /if cmp(_value_, ' ');
                      put '0';
                  else;
                      put tranwrd(_value_, "," , "") ;
                  done;
              done;

              set $not_first "true";

              next $values;
              eval $i $i+1;
          done;

          put ")";
      end;

  end;
run;




ods listing;

ods tagsets.sql file=tmp ;
filename tmp temp lrecl=4096;
proc print data=sashelp.class;
run;quit;

ods _all_ close; ** very important;

data _null_;
infile tmp end=dne;
input;
put _infile_;
run;quit;

ods _all_ close; ** very important;






































































































































































filename ft15f001 "c:/oto/sql_create_table.m";
parmcards4;
function sql_create_table(db,inp,quoted_table);

  colnames = inp.Properties.VariableNames;
  ncols = numel(colnames);
  sqlcols = cell(1, ncols);

  for i = 1:ncols
    colname = colnames{i};
    coldata = inp.(colname);
    firstval = coldata(1);
    if iscell(firstval) && (ischar(firstval{1,1}) || isstring(firstval{1,1}))
        sqltype = "TEXT";
    else
        sqltype = "REAL";
    end
    sqlcols{i} = sprintf('%s %s', colname, sqltype);
  end

  sql_str = sprintf('( %s )', strjoin(sqlcols, ','));

  sql_make = ["create table ", quoted_table, sql_str];

  disp(sql_make)
  execute(db,sql_make);

end
;;;;
run;quit;

filename ft15f001 "c:/oto/sql_insert.m";
parmcards4;
function sql_insert(db,inp,out);

   sql_delete = sprintf('DELETE FROM %s;', out);
   execute(db,sql_delete)

   columns = inp.Properties.VariableNames;
   n_rows  = size(inp, 1);

   % Construct and execute INSERT for each row
      for i = 1:n_rows
          % Get values for the current row
          values = cell(1, length(columns));
          for j = 1:length(columns)
              col_data = inp.(columns{j});
              if iscell(col_data)
                  values{j} = col_data{i};   % Handle text fields
              else
                  values{j} = col_data(i);   % Handle numeric fields
              end
          end
          formatted_values = cell(1, length(values));
          for k = 1:length(values)
              if ischar(values{k})
                  % Escape single quotes and wrap in SQL quotes
                  escaped_str = strrep(values{k}, "'", "''");
                  formatted_values{k} = sprintf("'%s'", escaped_str);
              else
                  formatted_values{k} = num2str(values{k});  % Convert numbers to strings
              end
          end

          % Build the INSERT query safely
          col_list = strjoin(columns, ', ');
          val_list = strjoin(formatted_values, ', ');
          query = sprintf('INSERT INTO %s (%s) VALUES (%s)',out, col_list, val_list);
          execute(db, query);
      end
      disp(query);
end
;;;;
run;quit;

filename ft15f001 "c:/oto/sql_create_insert.m";
parmcards4;
function sql_create_insert(db,dbtbl,sqltbl)

   sql_create_table(db,dbtbl,sqltbl);
   sql_insert      (db,dbtbl,sqltbl);

end;
;;;;
run;quit;

































































































































%macro utl_sqlinsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;


   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;


   filename _out_ "c:/temp/sqlcreins.sql";
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file _out_;
    input;
    select;
       when (_n_ =1)           leave;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=catx(' ',cats(scan(_infile_,1,')'),')'),'VALUES');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          *put remain;
          *putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=substr(_infile_,index(_infile_,'Values')+6);
          if not dne then remain=translate(remain,',',';');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;

ods path (prepend) sasuser.templates(update);
%utl_sqlinsert(sashelp.class);

%utl_psbegin;
parmcards4;
$sqlFile = "c:\temp\sql\creins.sql"
$database = "d:/sqlit/test.db"

sqlite3 "d:/sqlit/test.db"
sqlite3 $database ".read $sqlFile"
;;;;
%utl_psend;


psql -U postgres -d template1 -f c:/temp/sqlcreins.sql


Create table class(name text, sex text, age float, height real, weight real);
Insert into class(name, sex, age, height, weight) VALUES
('Alice', 'F', 13, 56.5, 84.0)
('Barbara', 'F', 13, 65.3, 98.0)
('Carol', 'F', 14, 62.8, 102.5)
('Henry', 'M', 14, 63.5, 102.5)
('James', 'M', 12, 57.3, 83.0)
('Jane', 'F', 12, 59.8, 84.5)
('Janet', 'F', 15, 62.5, 112.5)
('Jeffrey', 'M', 13, 62.5, 84.0)
('John', 'M', 12, 59.0, 99.5)
('Joyce', 'F', 11, 51.3, 50.5)
('Judy', 'F', 14, 64.3, 90.0)
('Louise', 'F', 12, 56.3, 77.0)
('Mary', 'F', 15, 66.5, 112.0)
('Philip', 'M', 16, 72.0, 150.0)
('Robert', 'M', 12, 64.8, 128.0)
('Ronald', 'M', 15, 67.0, 133.0)
('Thomas', 'M', 11, 57.5, 85.0)
('William', 'M', 15, 66.5, 112.0);


CREATE TABLE IF NOT EXISTS patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');



































# Define paths
$sqlFile = "c:\temp\creins.sql"
$database = "example.db"

# Create directory if it doesn't exist
$directory = Split-Path $sqlFile
if (-not (Test-Path $directory)) {
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
}

# Create SQL file content
@"
CREATE TABLE IF NOT EXISTS patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');
"@ | Set-Content -Path $sqlFile -Encoding UTF8

# Import SQL file into database
sqlite3 $database ".read '$($sqlFile.Replace('\','/'))'"

# Verify results
Write-Host "Database created with $((sqlite3 $database "SELECT COUNT(*) FROM patients" | Out-String).Trim()) patients"






































































%macro utl_sqlinsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;

   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;

   filename clp clipbrd;
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file clp;
    input;
    select;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=catx(' ',cats(scan(_infile_,1,')'),')'),'VALUES');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          *put remain;
          *putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=substr(_infile_,index(_infile_,'Values')+6);
          if not dne then remain=translate(remain,' ',';');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
    if dne then do;
         putlog ';quit;';
         put ';quit;';
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;

%utl_sqlinsert(sashelp.class);






i

into class(name, sex, age, height, weight) Values('William', 'M', 15, 66.5, 112.0);



















%macro utl_sqlinsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;

   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;

   filename clp clipbrd;
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file clp;
    input;
    select;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=cats(scan(_infile_,1,')'),')');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          put remain;
          putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=cats(scan(_infile_,2,')'),')');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
    if dne then do;
         putlog ';quit;';
         put ';quit;';
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;





data _null_;
infile tmp end=dne;
input;
put _infile_;
run;quit;





       ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
       ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
       ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;
       ;;;;%end;%mend;/*'*/ *);*};*];*/;/*"*/;run;quit;%end;end;run;endcomp;%utlfix;











options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=sashelp.class;
   run;quit;

   ods _all_ close; ** very important;





















ods path (prepend) sasuser.templates(update);
ods listing style=tagsets_sql;
proc print data=sashelp.class;
run;quit;

ods path show;

%macro utl_sqlinsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;

   data _null_;
   infile tmp end=dne;
   input;
   put _infile_;
   run;quit;

   filename clp clipbrd;
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file clp;
    input;
    select;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=cats(scan(_infile_,1,')'),')');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          put remain;
          putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=cats(scan(_infile_,2,')'),')');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
    if dne then do;
         putlog ';quit;';
         put ';quit;';
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;


%macro utl_sqlinsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;

   filename clp clipbrd;
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file clp;
    input;
    select;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=cats(scan(_infile_,1,')'),')');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          put remain;
          putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=cats(scan(_infile_,2,')'),')');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
    if dne then do;
         putlog ';quit;';
         put ';quit;';
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;



proc sql;
 Create table class(name varchar(200), sex varchar(200), age float, height float, weight float);
Insert into class(name, sex, age, height, weight)
Values('Alfred', 'M', 14, 69.0, 112.5)
Values('Alice', 'F', 13, 56.5, 84.0)
Values('Barbara', 'F', 13, 65.3, 98.0)
Values('Carol', 'F', 14, 62.8, 102.5)
Values('Henry', 'M', 14, 63.5, 102.5)
Values('James', 'M', 12, 57.3, 83.0)
Values('Jane', 'F', 12, 59.8, 84.5)
Values('Janet', 'F', 15, 62.5, 112.5)
Values('Jeffrey', 'M', 13, 62.5, 84.0)
Values('John', 'M', 12, 59.0, 99.5)
Values('Joyce', 'F', 11, 51.3, 50.5)
Values('Judy', 'F', 14, 64.3, 90.0)
Values('Louise', 'F', 12, 56.3, 77.0)
Values('Mary', 'F', 15, 66.5, 112.0)
Values('Philip', 'M', 16, 72.0, 150.0)
Values('Robert', 'M', 12, 64.8, 128.0)
Values('Ronald', 'M', 15, 67.0, 133.0)
Values('Thomas', 'M', 11, 57.5, 85.0)
Values('William', 'M', 15, 66.5, 112.0)
;quit;




sqlite3 example.db


CREATE TABLE patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');



please provide poweshell code using the sqlite3 cli to connect to database example.db
and add table patients from the sql file below


file: c:/temp/creins.sql

example.db

CREATE TABLE patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');



CREATE TABLE IF NOT EXISTS patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),



Create table class(name varchar(200), sex varchar(200), age float, height float, weight float);
insert into class(name, sex, age, height, weight)
Values('Thomas', 'M', 11, 57.5, 85.0)
Values('William', 'M', 15, 66.5, 112.0)
;

CREATE TABLE class(
  name VARCHAR(200),
  sex VARCHAR(200),
  age FLOAT,
  height FLOAT,
  weight FLOAT
);

INSERT INTO class(name, sex, age, height, weight) VALUES
  ('Thomas', 'M', 11, 57.5, 85.0),
  ('William', 'M', 15, 66.5, 112.0);

































# Define paths
$sqlFile = "c:\temp\creins.sql"
$database = "example.db"

# Create directory if it doesn't exist
$directory = Split-Path $sqlFile
if (-not (Test-Path $directory)) {
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
}

# Create SQL file content
@"
CREATE TABLE IF NOT EXISTS patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');
"@ | Set-Content -Path $sqlFile -Encoding UTF8

# Import SQL file into database
sqlite3 $database ".read '$($sqlFile.Replace('\','/'))'"

# Verify results
Write-Host "Database created with $((sqlite3 $database "SELECT COUNT(*) FROM patients" | Out-String).Trim()) patients"








































































CREATE TABLE patients (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  diagnosis TEXT
);

INSERT INTO patients (name, age, diagnosis) VALUES
  ('Alice', 34, 'Diabetes'),
  ('Bob', 58, 'Hypertension'),
  ('Carol', 45, 'Diabetes'),
  ('Dave', 60, 'Healthy');


/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/
data have;
informat
  NAME $8.
  SEX $1.
  AGE 8.
  WEIGHT 8.
;
input
 NAME SEX AGE WEIGHT;
cards4;
Alfred M 14 112.5
Alice F 13 84
Barbara F 13 98
Carol F 14 102.5
Henry M 14 102.5
;;;;
run;quit;

 *- CREATE CSV -*

dm "dexport have
'd:\csv\have.csv'
 replace";


proc template;
  list tagsets;
run;



ods path sasuser.templat(update) sashelp.tmplmst(read);




%macro utl_sqlinsert(dsn)/des="send sql insert code to the log and clipbord paste buffer";

   options ls=256;

   filename tmp temp lrecl=4096;

   ods tagsets.sql file=tmp;

   proc print data=&dsn;
   run;quit;

   ods _all_ close; ** very important;

   filename clp clipbrd;
   data _null_;
    retain flg 0;
    length once $255 remain $255;
    infile tmp end=dne;
    file clp;
    input;
    select;
       when (_n_ < 3)  do;
           put _infile_;
           putlog _infile_;
       end;
       when (_infile_=:"Insert into" and flg=0)  do;
          flg=1;
          once=cats(scan(_infile_,1,')'),')');
          remain=cats(scan(_infile_,2,')'),')');
          put once;
          putlog once;
          put remain;
          putlog remain;
       end;
       when (_infile_=:"Insert into") do;
          remain=cats(scan(_infile_,2,')'),')');
          put remain;
          putlog remain;
       end;
       * leave otherwise off to force error;
    end;
    if dne then do;
         putlog ';quit;';
         put ';quit;';
    end;
   run;quit;

   filename tmp clear;

   ods listing;

   options ls=255;

%mend utl_sqlinsert;



%utl_sqlinsert(sashelp.class)






























































github
https://tinyurl.com/yrzh99mt
https://github.com/rogerjdeangelis/utl-connecting-spss-pspp-to-postgresql-sample-problem-compute-mean-weight-by-sex


PROBLEM (USING PSPP and POSTGRESQL)

 COMPUTE AVERAGE AGE AND WEIGHT BY SEX

           INPUT                POSTGRESQL & SAV FILE    SAS DATASET

     NAME   SEX AGE  WEIGHT           Data List          SEX     AVGAGE     AVGWGT
                                 +---+------+------+
    Alfred   M   14   112.5      |SEX|AVEAGE|AVGWGT|      M     14.0000    107.500
    Alice    F   13    84.0      +---+------+------+      F     13.3333     94.833
    Barbara  F   13    98.0      |M  | 14.00|107.50|
    Carol    F   14   102.5      |F  | 13.33| 94.83|
    Henry    M   14   102.5      +---+------+------+


REPO
----------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-partial-key-matching-and-luminosity-in-gene-analysis-sas-r-python-postgresql
https://github.com/rogerjdeangelis/utl-pivot-wide-when-variable-names-contain-values-sql-and-base-r-sas-oython-excel-postgreSQL
https://github.com/rogerjdeangelis/utl-saving-and-creating-r-dataframes-to-and-from-a-postgresql-database-schema


SOAPBOX ON

I am a SPSS beginner!! Be critical.

POSTGRESQL PREP
===============

  CONTENTS

     1 postgresql prep
     2 pspp odbc
     3 no way to use HOST COMMAND=[psql_query].
     4 cannot use a macro function  runpsql "drop table if exists teams;".
     5 this works, the long way
     6 you have to manually assign column names and column types


1 postgresql prep

  a  Use postgres as the user name, it has admin priviledges.
  b  Postgresql does support windows extensions
  c  template1 is the postgresql builtin database

  d  Make sure passwords are turned off.

     Go to
     C:\Program Files\PostgreSQL\16\data\pg_hba,conf
     edit
     ip4 and ip6 replace scram-sha-256 with trust

     # IPv4 local connections:
     host    all             all   127.0.0.1/32   trust
     # IPv6 local connections:
     host    all             all   ::1/128        trust

2 There is a seamless ODBC connection for PSPP postgresql but you need to compile PSPP from source,
  install certain microsoft visual products, and install and link to sveral other modules.
  I decided not to go that route.
  I spent quite abit of time looking for a binary PSPP with ODBC support but could not find one.

3 It looks like there is no way to execute

  compute psqlquery-"...".
  HOST COMMAND=[psql_query].

4 Also can't use a function arguments.

  I tried variations of this

   DEFINE !runpsql (cmd = !TOKENS(1))
    HOST COMMAND=!QUOTE(
      !CONCAT(
        'psql -h localhost -u postgres -d devel -c "',
        !cmd,
        '"'
      )
    ).
  !ENDDEFINE.

  !runpsql "drop table if exists teams;".

5 this works

  %utlfkil(c:/temp/output.sql);
  %utlfkil(d:/csv/teamsout.csv);


  %utl_psppbeginx;
  parmcards4;
  HOST COMMAND=['psql -h localhost -U postgres -d template1 -c "drop table if exists teams;"'].
  HOST COMMAND=['psql -h localhost -U postgres -d template1 -c "create table teams (team text, player text);"'].
  HOST COMMAND=['psql -h localhost -U postgres -d template1 -c "\copy teams from ''d:/csv/have.csv'' delimiter '','' csv header;"'].
  HOST COMMAND=['psql -h localhost -U postgres -d template1 -c "\dt"'].
  HOST COMMAND=['psql -h localhost -U postgres -d template1 -c "select * from teams;"'].
  HOST COMMAND=['psql -h localhost -U postgres -d template1 -c "\copy teams TO ''d:/csv/teamsout.csv'' CSV HEADER;"'].

6 You have to manually assign column names and column types

  table sqlhav (NAME TEXT,SEX TEXT,AGE REAL,WEIGHT REAL);
  /VARIABLES=SEX A1 AVEAGE F8.2 AVGWGT F8.2.

SOAPBOX OFF

REPO
----------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-partial-key-matching-and-luminosity-in-gene-analysis-sas-r-python-postgresql
https://github.com/rogerjdeangelis/utl-pivot-wide-when-variable-names-contain-values-sql-and-base-r-sas-oython-excel-postgreSQL
https://github.com/rogerjdeangelis/utl-saving-and-creating-r-dataframes-to-and-from-a-postgresql-database-schema



/****************************************************************************************************************************************************/
/* INPUT                 | PROCESS                                                                | OUTPUT                                          */
/* =====                 | =======                                                                | ======                                          */
/* d:\csv\have.csv       | Process                                                                |                                                 */
/*                       | ========                                                               | Tables in initial template1 database            */
/* NAME,SEX,AGE,WEIGHT   |  1 create a template table                                             | I created the sample dataset                    */
/* Alfred,M,14,112.5     |    table sqlhav (NAME TEXT,SEX TEXT,AGE REAL,WEIGHT REAL);             |                                                 */
/* Alice,F,13,84         |  2 Ceate a file with the complete sql script c:/temp/output.sql        |          List of relations                      */
/* Barbara,F,13,98       |  3 Shell out and run the postgreSQL script  c:/temp/output.sql         |  Schema |  Name  | Type  |  Owner               */
/* Carol,F,14,102.5      |  4 Create a native spss sav data table d:/sav/want.sav                 | --------+--------+-------+----------            */
/* Henry,M,14,102.5      |  5 Create final csv fiile from sav file d:/sav/want.sav                |  public | sample | table | postgres             */
/*                       |  6 Create sas dataset want from pspp csv file work.want                | (1 row)                                         */
/* data have;            |                                                                        |                                                 */
/* informat              |                                  *--- for development        ---*;     |                                                 */
/*   NAME $8.            |  %utlfkil(c:/temp/output.sql);   *--- sql query              ---*;     | POSTGRESQL SQL                                  */
/*   SEX $1.             |  %utlfkil(d:/csv/wantout.csv);   *--- postgresql created csv ---*;     |                                                 */
/*   AGE 8.              |  %utlfkil(d:/sav/want.sav);      *--- native pspp table      ---*;     | +----------------------------------------------+*/
/*   WEIGHT 8.           |                                                                        | |                    qry                       |*/
/* ;                     |  proc datasets lib=work          *--- final sas dataset      ---*;     | +----------------------------------------------+*/
/* input                 |    nodetails nolist;                                                   | |drop table if exists sqlhav;                  |*/
/*  NAME SEX AGE WEIGHT; |    delete wantl                                                        | |drop table if exists want;                    |*/
/* cards4;               |  run;quit;                                                             | |\dt                                           |*/
/* Alfred M 14 112.5     |                                                                        | |create                                        |*/
/* Alice F 13 84         |  %utl_psppbeginx;                                                      | |  table sqlhav                                |*/
/* Barbara F 13 98       |  parmcards4;                                                           | |    (NAME TEXT,SEX TEXT,AGE REAL,WEIGHT REAL);|*/
/* Carol F 14 102.5      |  DATA LIST FIXED / qry 1-80 (A).                                       | |\copy sqlhav from 'd:/csv/have.csv'           |*/
/* Henry M 14 102.5      |                                                                        | |   delimiter ',' csv header;|                 |*/
/* ;;;;                  |  BEGIN DATA                                                            | |\dt                                           |*/
/* run;quit;             |  drop table if exists sqlhav;                                          | |create                                        |*/
/*                       |  drop table if exists want;                                            | |   table want as                              |*/
/*  *- CREATE CSV -*     |  \dt                                                                   | |select                                        |*/
/*                       |  create                                                                | |   sex                                        |*/
/* dm "dexport have      |   table sqlhav                                                         | |  ,avg(age)    as avgage                      |*/
/* 'd:\csv\have.csv'     |      (NAME TEXT,SEX TEXT,AGE REAL,WEIGHT REAL);                        | |  ,avg(weight) as avgwgt                      |*/
/*  replace";            |  \copy sqlhav from 'd:/csv/have.csv' delimiter ',' csv header;         | |from                                          |*/
/*                       |  \dt                                                                   | |   sqlhav                                     |*/
/*                       |  create                                                                | |group                                         |*/
/*                       |     table want as                                                      | |    by sex                                    |*/
/*                       |  select                                                                | |;                                             |*/
/*                       |     sex                                                                | |\dt                                           |*/
/*                       |    ,avg(age)    as avgage                                              | |\copy want TO 'd:/csv/wantout.csv' CSV HEADER;|*/
/*                       |    ,avg(weight) as avgwgt                                              | +----------------------------------------------+*/
/*                       | from                                                                   |         xpy end                                 */
/*                       |     sqlhav                                                             |                                                 */
/*                       |  group                                                                 |  LOADING SAS CSV FILE INTO POSTGRESQL           */
/*                       |      by sex                                                            |          List of relations                      */
/*                       |  ;                                                                     |  Schema |  Name  | Type  |  Owner               */
/*                       |  \dt                                                                   | --------+--------+-------+----------            */
/*                       |  \copy want TO 'd:/csv/wantout.csv' CSV HEADER;                        |  public | sample | table | postgres             */
/*                       |  END DATA.                                                             |  public | sqlhav | table | postgres             */
/*                       |                                                                        |                                                 */
/*                       |  LIST.                                                                 |                                                 */
/*                       |  SAVE TRANSLATE                                                        | CREATING POSTGRESQL TABLE WANT                  */
/*                       |    /OUTFILE='c:/temp/output.sql'                                       | WITH AVGERAGE AGE AND WEIGHT                    */
/*                       |    /TYPE=TAB                                                           |                                                 */
/*                       |    /REPLACE.                                                           |          List of relations                      */
/*                       |                                                                        |  Schema |  Name  | Type  |  Owner               */
/*                       |  HOST COMMAND=['psql -U postgres -d template1 -f c:/temp/output.sql']. | --------+--------+-------+----------            */
/*                       |                                                                        |  public | sample | table | postgres             */
/*                       |  GET DATA                                                              |  public | sqlhav | table | postgres             */
/*                       |    /TYPE=TXT                                                           |  public | want   | table | postgres             */
/*                       |    /FILE='d:/csv/wantout.csv'                                          |                                                 */
/*                       |    /DELCASE=LINE                                                       |       Data List                                 */
/*                       |    /DELIMITERS=","                                                     |  +---+------+------+                            */
/*                       |    /QUALIFIER='"'                                                      |  |SEX|AVEAGE|AVGWGT|                            */
/*                       |    /ARRANGEMENT=DELIMITED                                              |  +---+------+------+                            */
/*                       |    /FIRSTCASE=2                                                        |  |M  | 14.00|107.50|                            */
/*                       |    /VARIABLES=SEX A1 AVEAGE F8.2 AVGWGT F8.2.                          |  |F  | 13.33| 94.83|                            *
/*                       |  EXECUTE.                                                              |  +---+------+------+                            *
/*                       |  SAVE OUTFILE='d:/sav/want.sav'.                                       |                                                 *
/*                       |  LIST.                                                                 | SAS OUTPUT                                      *
/*                       |  ;;;;                                                                  |                                                 *
/*                       |  %utl_psppendx;                                                        | WANT total obs=2                                *
/*                       |                                                                        |                                                 *
/*                       |                                                                        |   SEX     AVGAGE     AVGWGT                     *
/*                       | dm "dimport 'd:/csv/wantout.csv' want  replace";                       |                                                 *
/*                       |                                                                        |    M     14.0000    107.500                     *
/*                       |                                                                        |    F     13.3333     94.833                     *
/***************************************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/
data have;
informat
  NAME $8.
  SEX $1.
  AGE 8.
  WEIGHT 8.
;
input
 NAME SEX AGE WEIGHT;
cards4;
Alfred M 14 112.5
Alice F 13 84
Barbara F 13 98
Carol F 14 102.5
Henry M 14 102.5
;;;;
run;quit;

 *- CREATE CSV -*

dm "dexport have
'd:\csv\have.csv'
 replace";

/**************************************************************************************************************************/
/* d:\csv\have.csv                                                                                                        */
/*                                                                                                                        */
/* NAME,SEX,AGE,WEIGHT                                                                                                    */
/* Alfred,M,14,112.5                                                                                                      */
/* Alice,F,13,84                                                                                                          */
/* Barbara,F,13,98                                                                                                        */
/* Carol,F,14,102.5                                                                                                       */
/* Henry,M,14,102.5                                                                                                       */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utlfkil(c:/temp/output.sql);   *--- sql query              ---*;
%utlfkil(d:/csv/wantout.csv);   *--- postgresql created csv ---*;
%utlfkil(d:/sav/want.sav);      *--- native pspp table      ---*;

proc datasets lib=work          *--- final sas dataset      ---*;
  nodetails nolist;
  delete wantl
run;quit;

%utl_psppbeginx;
parmcards4;
DATA LIST FIXED / qry 1-80 (A).

BEGIN DATA
drop table if exists sqlhav;
drop table if exists want;
\dt
create
 table sqlhav
    (NAME TEXT,SEX TEXT,AGE REAL,WEIGHT REAL);
\copy sqlhav from 'd:/csv/have.csv' delimiter ',' csv header;
\dt
create
   table want as
select
   sex
  ,avg(age)    as avgage
  ,avg(weight) as avgwgt
from
   sqlhav
group
    by sex
;
\dt
\copy want TO 'd:/csv/wantout.csv' CSV HEADER;
END DATA.

LIST.
SAVE TRANSLATE
  /OUTFILE='c:/temp/output.sql'
  /TYPE=TAB
  /REPLACE.

HOST COMMAND=['psql -U postgres -d template1 -f c:/temp/output.sql'].

GET DATA
  /TYPE=TXT
  /FILE='d:/csv/wantout.csv'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /VARIABLES=SEX A1 AVEAGE F8.2 AVGWGT F8.2.
EXECUTE.
SAVE OUTFILE='d:/sav/want.sav'.
LIST.
;;;;
%utl_psppendx;

dm "dimport 'd:/csv/wantout.csv' want  replace";

/**************************************************************************************************************************/
/* DROP TABLE                                                                                                             */
/* DROP TABLE                                                                                                             */
/*          List of relations                                                                                             */
/*  Schema |  Name  | Type  |  Owner                                                                                      */
/* --------+--------+-------+----------                                                                                   */
/*  public | sample | table | postgres                                                                                    */
/* (1 row)                                                                                                                */
/*                                                                                                                        */
/* CREATE TABLE                                                                                                           */
/* COPY 5                                                                                                                 */
/*          List of relations                                                                                             */
/*  Schema |  Name  | Type  |  Owner                                                                                      */
/* --------+--------+-------+----------                                                                                   */
/*  public | sample | table | postgres                                                                                    */
/*  public | sqlhav | table | postgres                                                                                    */
/* (2 rows)                                                                                                               */
/*                                                                                                                        */
/* SELECT 2                                                                                                               */
/*          List of relations                                                                                             */
/*  Schema |  Name  | Type  |  Owner                                                                                      */
/* --------+--------+-------+----------                                                                                   */
/*  public | sample | table | postgres                                                                                    */
/*  public | sqlhav | table | postgres                                                                                    */
/*  public | want   | table | postgres                                                                                    */
/* (3 rows)                                                                                                               */
/*                                                                                                                        */
/* COPY 2                                                                                                                 */
/*   Reading 1 record from INLINE.                                                                                        */
/* +--------+------+-------+------+                                                                                       */
/* |Variable|Record|Columns|Format|                                                                                       */
/* +--------+------+-------+------+                                                                                       */
/* |qry     |     1|1-80   |A80   |                                                                                       */
/* +--------+------+-------+------+                                                                                       */
/*                                                                                                                        */
/*                            Data List                                                                                   */
/* +-------------------------------------------------------------+                                                        */
/* |                             qry                             |                                                        */
/* +-------------------------------------------------------------+                                                        */
/* |drop table if exists sqlhav;                                 |                                                        */
/* |drop table if exists want;                                   |                                                        */
/* |\dt                                                          |                                                        */
/* |create                                                       |                                                        */
/* | table sqlhav                                                |                                                        */
/* |    (NAME TEXT,SEX TEXT,AGE REAL,WEIGHT REAL);               |                                                        */
/* |\copy sqlhav from 'd:/csv/have.csv' delimiter ',' csv header;|                                                        */
/* |\dt                                                          |                                                        */
/* |create                                                       |                                                        */
/* |   table want as                                             |                                                        */
/* |select                                                       |                                                        */
/* |   sex                                                       |                                                        */
/* |  ,avg(age)    as avgage                                     |                                                        */
/* |  ,avg(weight) as avgwgt                                     |                                                        */
/* |from                                                         |                                                        */
/* |   sqlhav                                                    |                                                        */
/* |group                                                        |                                                        */
/* |    by sex                                                   |                                                        */
/* |;                                                            |                                                        */
/* |\dt                                                          |                                                        */
/* |\copy want TO 'd:/csv/wantout.csv' CSV HEADER;               |                                                        */
/* +-------------------------------------------------------------+                                                        */
/*                                                                                                                        */
/*      Data List                                                                                                         */
/* +---+------+------+                                                                                                    */
/* |SEX|AVEAGE|AVGWGT|                                                                                                    */
/* +---+------+------+                                                                                                    */
/* |M  | 14.00|107.50|                                                                                                    */
/* |F  | 13.33| 94.83|                                                                                                    */
/* +---+------+------+                                                                                                    */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
