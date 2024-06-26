 CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci_sequence INTEGER)
AS $$
	WITH RECURSIVE r AS (
		SELECT 0 AS num, 1 AS next_num
		
		 UNION
		
        SELECT next_num, num + next_num
          FROM r
         WHERE next_num < pstop
	)	
	SELECT num
	  FROM r
	 WHERE num < pstop;
$$ LANGUAGE SQL;

SELECT *
  FROM fnc_fibonacci(100);
SELECT *
  FROM fnc_fibonacci();