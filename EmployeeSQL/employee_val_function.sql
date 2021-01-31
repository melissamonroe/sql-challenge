--drop function employee_val

create FUNCTION employee_val (integer,text) RETURNS text AS '
  DECLARE
    
    -- Declare aliases for user input.
    employee_id ALIAS FOR $1;
	field ALIAS FOR $2;
    
    -- Declare variables to hold the customer name.
    d_name TEXT;
    d_number TEXT;
	e_namefirst TEXT;
	e_namelast TEXT;
  	RETURNVALUE TEXT;
	
	BEGIN

		if field = ''namedept'' then  
				-- Retrieve the customer first and last name for the customer
				-- whose ID matches the value supplied as a function argument.
				SELECT INTO d_number
							dept_no                
							FROM dept_emp WHERE emp_no = employee_id;

				SELECT INTO d_name
							max(dept_name)
							FROM departments WHERE dept_no = d_number;
				-- Return the name.			
				RETURNVALUE = d_name;
		end if;
		if field = ''namefirst'' then 
			SELECT INTO e_namefirst
							first_name                
							FROM employees WHERE emp_no = employee_id;
				RETURNVALUE = e_namefirst;
		end if;
		if field = ''namelast'' then 
			SELECT INTO e_namelast
							last_name                
							FROM employees WHERE emp_no = employee_id;
				RETURNVALUE = e_namelast;
		end if;
	RETURN RETURNVALUE;
  END;
' LANGUAGE 'plpgsql';