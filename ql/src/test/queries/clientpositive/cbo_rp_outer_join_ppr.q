--! qt:dataset:srcpart
--! qt:dataset:src
set hive.mapred.mode=nonstrict;
set hive.cbo.enable=true;
set hive.cbo.returnpath.hiveop=true;
set hive.optimize.ppd=true;

-- SORT_QUERY_RESULTS

EXPLAIN EXTENDED
 FROM 
  src a
 FULL OUTER JOIN 
  srcpart b 
 ON (a.key = b.key AND b.ds = '2008-04-08')
 SELECT a.key, a.value, b.key, b.value
 WHERE a.key > 10 AND a.key < 20 AND b.key > 15 AND b.key < 25;

 FROM 
  src a
 FULL OUTER JOIN 
  srcpart b 
 ON (a.key = b.key AND b.ds = '2008-04-08')
 SELECT a.key, a.value, b.key, b.value
 WHERE a.key > 10 AND a.key < 20 AND b.key > 15 AND b.key < 25;

EXPLAIN EXTENDED
 FROM 
  src a
 FULL OUTER JOIN 
  srcpart b 
 ON (a.key = b.key)
 SELECT a.key, a.value, b.key, b.value
 WHERE a.key > 10 AND a.key < 20 AND b.key > 15 AND b.key < 25 AND b.ds = '2008-04-08';

 FROM 
  src a
 FULL OUTER JOIN 
  srcpart b 
 ON (a.key = b.key)
 SELECT a.key, a.value, b.key, b.value
 WHERE a.key > 10 AND a.key < 20 AND b.key > 15 AND b.key < 25 AND b.ds = '2008-04-08';
