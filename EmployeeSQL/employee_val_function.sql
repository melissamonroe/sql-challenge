drop function employee_val
create FUNCTION employee_val (integer,text) RETURNS text AS '
  DECLARE
    
    -- Declare aliases for user input.
    employee_id ALIAS FOR $1;
	field ALIAS FOR $2;
    
    -- Declare variables to hold the customer name.
    d_name TEXT;
    d_number TEXT;
  	RETURNVALUE TEXT;
	
	BEGIN

		if field = ''departmentname'' then  
				-- Retrieve the customer first and last name for the customer
				-- whose ID matches the value supplied as a function argument.
				SELECT INTO d_number
							dept_no                
							FROM dept_emp WHERE emp_no = employee_id;

				SELECT INTO d_name
							dept_name                
							FROM departments WHERE dept_no = d_number;
				-- Return the name.			
				RETURNVALUE = d_name;
		end if;
		
	RETURN RETURNVALUE;
  END;
' LANGUAGE 'plpgsql';