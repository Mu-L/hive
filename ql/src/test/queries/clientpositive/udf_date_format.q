DESCRIBE FUNCTION date_format;
DESC FUNCTION EXTENDED date_format;
set hive.datetime.formatter=DATETIME;

set hive.local.time.zone=Africa/Johannesburg;

explain select date_format('2015-04-08', 'EEEE');

--string date
select
date_format('2015-04-08', 'E'),
date_format('2015-04-08', 'G'),
date_format('2015-04-08', 'y'),
date_format('2015-04-08', 'Y'),
date_format('2015-04-08', 'MMM'),
date_format('2015-04-08', 'w'),
date_format('2015-04-08', 'W'),
date_format('2015-04-08', 'D'),
date_format('2015-04-08', 'd'),
date_format(cast(null as string), 'dd');

set hive.local.time.zone=Europe/Berlin;

--string timestamp
select
date_format('2015-04-08 10:30:45', 'HH'),
date_format('2015-04-08 10:30:45', 'mm'),
date_format('2015-04-08 10:30:45', 'ss'),
date_format('2015-04-08 21:30:45', 'hh a'),
date_format('2015-04-08 10:30', 'dd'),
date_format('2015-04-08 10:30:45.123', 'S'),
date_format('2015-04-08T10:30:45', 'dd'),
date_format('2015-04-08 10', 'dd'),
date_format(cast(null as string), 'dd');

set hive.local.time.zone=Australia/Sydney;

--date
select
date_format(cast('2015-04-08' as date), 'EEEE'),
date_format(cast('2015-04-08' as date), 'G'),
date_format(cast('2015-04-08' as date), 'yyyy'),
date_format(cast('2015-04-08' as date), 'YY'),
date_format(cast('2015-04-08' as date), 'MMM'),
date_format(cast('2015-04-08' as date), 'w'),
date_format(cast('2015-04-08' as date), 'W'),
date_format(cast('2015-04-08' as date), 'D'),
date_format(cast('2015-04-08' as date), 'd'),
date_format(cast(null as date), 'dd');

set hive.local.time.zone=Asia/Bangkok;

--timestamp
select
date_format(cast('2015-04-08 10:30:45' as timestamp), 'HH'),
date_format(cast('2015-04-08 10:30:45' as timestamp), 'mm'),
date_format(cast('2015-04-08 10:30:45' as timestamp), 'ss'),
date_format(cast('2015-04-08 10:30:45' as timestamp), 'hh a'),
date_format(cast('2015-04-08 10:30:45' as timestamp), 'dd'),
date_format(cast('2015-04-08 10:30:45.123' as timestamp), 'SSS'),
date_format(cast('2015-04-08 10:30:45.123456789' as timestamp), 'SSS'),
date_format(cast(null as timestamp), 'HH');

-- wrong fmt
select
date_format('2015-04-08', ''),
date_format('2015-04-08', 'C');

-- with time zone
set hive.local.time.zone=Asia/Bangkok;
select date_format("2015-04-08 10:30:45","yyyy-MM-dd HH:mm:ss.SSS z");

set hive.local.time.zone=Australia/Sydney;
select date_format("2015-04-08 10:30:45","yyyy-MM-dd HH:mm:ss.SSS z");

set hive.local.time.zone=Europe/Berlin;
select date_format("2015-04-08 10:30:45","yyyy-MM-dd HH:mm:ss.SSS z");

--julian date
set hive.local.time.zone=UTC;
select date_format("1001-01-05","dd---MM--yyyy");

--dates prior to 1900
set hive.local.time.zone=Asia/Bangkok;
select date_format('1400-01-14 01:01:10.123', 'yyyy-MM-dd HH:mm:ss.SSS z');
select date_format('1800-01-14 01:01:10.123', 'yyyy-MM-dd HH:mm:ss.SSS z');

set hive.local.time.zone=Europe/Berlin;
select date_format('1400-01-14 01:01:10.123', 'yyyy-MM-dd HH:mm:ss.SSS z');
select date_format('1800-01-14 01:01:10.123', 'yyyy-MM-dd HH:mm:ss.SSS z');

set hive.local.time.zone=Africa/Johannesburg;
select date_format('1400-01-14 01:01:10.123', 'yyyy-MM-dd HH:mm:ss.SSS z');
select date_format('1800-01-14 01:01:10.123', 'yyyy-MM-dd HH:mm:ss.SSS z');
