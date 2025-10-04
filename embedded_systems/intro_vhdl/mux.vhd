entity mux is 
	port (
		I3 , I2 , I1 , I0: in bit;
		S: in bit_vector(1 downto 0);
		O: out bit
	);
end mux;

--Dataflow Style with condition test
-- kind of an if statement
architecture mux_dataflow_condition of mux is
begin
	O <= I0 when S="00" else 
		I1 when S="01" else 
		I2 when S="10" else 
		I3;	      
end mux_dataflow_condition;

--Dataflow Style with selection test
-- kind of a switch-case statement
architecture mux_dataflow_selection of mux is
begin
  with S select
    O <= I0 when "00",
            I1 when "01",
            I2 when "10",
            I3 when "11";
end mux_dataflow_selection;

--Behavior Style with condition test
-- very literal if statement
architecture mux_behavioural_condition of mux is
begin
  process (I3 , I2 , I1 , I0 , S)
  begin
    if  S = "00" then O <= I0;
    elsif S = "01" then O <= I1;
    elsif S = "10" then O <= I2;
    else O<= I3;
    end if;
  end process;
end mux_behavioural_condition;

--Behavior Style with selection test
-- very literal switch-case statement
architecture mux_behavioural_selection of mux is
begin
  process (I3 , I2 , I1 , I0 , S)
  begin
    case S is
      when "00" => O <= I0;
      when "01" => O <= I1;
      when "10" => O <= I2;
      when "11" => O <= I3;
    end case;
  end process;
end mux_behavioural_selection;