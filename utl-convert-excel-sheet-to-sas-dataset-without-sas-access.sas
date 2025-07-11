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
