-- Name:    Madison Tilden
-- Date:    September 8, 2014
-- Course:  ITEC 320 Principles of Procedural Programming

-- Purpose: read in a numbers from a text file and determine if they are 
-- 	        prime or composite and print out the result. If the result is
--          composite you will print out all the factors of the current number.


with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure factors is

		
in_num, a : Integer;
counter, z: Integer := 0;
pos_num, temp1, temp2: Integer;
--d_num : Positive := 2;
completed : Boolean := false;
prime : Boolean := true;
c : Character;


begin 

EOF:
while not end_of_file loop
	
	
	excep:
	begin
	 	get(in_num);

 	if in_num = 0 then
		set_col(1);
		put_line("0 neither prime nor composite");
		
	elsif in_num = 1 then 
		set_col(1);
		put_line("1 neither prime nor composite");
	
	
    	-- if number is less than 0 make it positive and store in pos_num
	else
		if in_num < 0 then
    		pos_num := abs(in_num);
			temp1 := pos_num;
			temp2 := pos_num;
		
  	  	-- else set pos_num to be in_num
   		else               
    		pos_num := in_num;
			temp1 := pos_num;
			temp2 := pos_num;
			--end if;
    	end if;
--end if;
 
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------

--dESCIDES IF prime or composite
	-- loops though 2 times less than input number starts at 2 end at pos_num-1
  OUTER:
  for i in 2 .. pos_num-1 loop 
  ----------------------------------------------------
	if i = pos_num-1 then
		------------------------------
		if  ((temp1 mod i /= 0) or else (temp1 = 1)) then 
				set_col(1);
				put(in_num'img);  -- prints input number
	 	   	 	put(" is a prime number!");
	 		 	new_line;
				prime := true;
	 	   		completed := true; -- complete is true when prime/composite is identified
				exit Outer when completed = true;  --exits loop outer (for loop)
		else
				--set_col(1);
				put(in_num, width => 1); -- prints input number
	 	  	  	put(" is a composite number!");
	 	 	  	new_line; 
				prime := false;
	 	   		completed := true; -- complete is true when prime/composite is identified
				exit Outer when completed = true;  --exits loop outer (for loop)
		end if;  -- end SECOND IF AFTER FOR LOOP
		--------------------------------------	
	elsif temp1 mod i = 0 then
		--set_col(1);
		put(in_num, width => 1);  -- prints input number 
	 	put(" is a composite number!");
	 	new_line;
		prime := false;
		completed := true;  -- complete is true when prime or composite is identified
		exit Outer when completed = true;  -- exits loop OUTER (for loop)
		
	end if;  -- END FIRST IF AFTER FOR LOOP
	---------------------------------------------------	
   end loop OUTER;   -- END LOOP OUTER
		
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------	
if prime = false then    -- if prime = false
	set_col(5);  --set column to 5
	put("All positive factors of");
	put(pos_num'img);  -- print out abs val of in_num
	put(": 1,");	
	-- if prime boolean is false then find all positive factors
	
		OUTFOR:
		for n in 2 .. pos_num loop    -- for 2.. pos_num times .... CHECK
			if n = pos_num then 		-- if n = pos_num 
				put(n'img);  			-- just print it out
				new_line;
			elsif temp1 mod n = 0 then -- else if n < pos_num & temp one is divisible by n
				put(n'img);  -- print n,
				put(",");
			end if;  					-- end if to check if n is divisible by pos_num
		end loop OUTFOR;   				-- end for loop
	end if; -- end if for if prime = false		

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------	
if prime = false then    -- if prime = false
--	FOR PRIME FACTORIZATION PART
set_col(5);
put("Prime factorization of");
put(pos_num'img);
put(":");

-- takes out all the times you can divide in_num by 2 with factoring
--  CHK2:
--  while ((temp2 > 1) and then (z = 0)) loop
--	z := temp2 mod 2; -- determines if it divides evenly with mod function
--		if z = 0 then  					--if it does then....
--			temp2 := temp2 / 2;
--			counter := counter + 1;
	--	end if;
	
  --end loop CHK2; -- loop until it didnt divide z evenly, or Y is now 1
	
	-----------------------------
--	if counter = 1 then
--		put(counter'img);
		
--	elsif counter > 0 then -- if the number is divisible by 2 print out how many times
--		put(" 2 **");
--		put(counter'img);
--		put (" *");
--	end if; 			-- end counter if
	-----------------------------


	a := 2;
	First_W:  --NAME OF WHILE LOOP BELOW
	while a <= temp2 loop 			-- Stop when a > the Pos_num (temp2)
		z := 0;						-- ser z and counter back to zero
		counter := 0;
		
		--------------------
	  Second_w:  		-- NAME OF WHILE LOOP BELOW
       while ((temp2 > 1) and then (z = 0)) loop -- same as above but temp2 mod A instead of 2
			
			z := temp2 mod a;			--sees if it is divisible
			
			if z = 0 then
				temp2 := temp2 / a;
				counter := counter + 1;
			end if;
			
		end loop Second_w; --end loop to see what exp num would be
		---------------
		if counter = 1 then		-- if the counter is one just print a *
			put(a'img);
			--new_line;
		
		elsif counter > 1 then
			put(a'img);
			put(" **");
			put(counter'img);
			--if temp1 /= 1 then
			--	put(" *");
			--else
			--	new_line;
			--end if;
		end if;
		
		
		if temp2 /= 1 then
			put(" *");
		else
			new_line;
		end if;
		
		
		if a = 2 then 
		a := 3;
		else 
		a := a + 2; -- count up by odd numbers
	end if;
	end loop first_W;
			
end if; -- for if composite		

end if; -- FOR TESTING
--put("temp2 is");
--put_line(temp2'img);


exception
	when data_error =>
	put("Character '");
	get(c);
	put(c);
	put_line("' is not a digit!");
end excep;

end loop EOF; --END LOOP FOR NOT END OF FILE		
	
		
end factors;
