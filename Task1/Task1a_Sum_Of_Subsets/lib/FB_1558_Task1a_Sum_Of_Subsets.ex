defmodule Task1aSumOfSubsets do
       @moduledoc """
         A module that implements functions for getting
         sum of subsets from a given 2d matrix and array of digits
         """

         @doc """
         #Function name:
                valid_sum
         #Inputs:
                matrix_of_sum   : A 2d matrix containing two digit numbers for which subsebts are to be created
         #Output:
                List of all vallid sums from the given 2d matrix
         #Details:
                Finds the valid sum values from the given 2d matrix
         #Example call:
           if given 2d matrix is as follows:
             matrix_of_sum = [
                               [21 ,"na", "na", "na", 12],
                               ["na", "na", 12, "na", "na"],
                               ["na", "na", "na", "na", "na"],
                               [17, "na", "na", "na", "na"],
                               ["na", 22, "na", "na", "na"]
                             ]

             iex(1)> matrix_of_sum = [
             ...(1)>       [21 ,"na", "na", "na", 12],
             ...(1)>       ["na", "na", 12, "na", "na"],
             ...(1)>       ["na", "na", "na", "na", "na"],
             ...(1)>       [17, "na", "na", "na", "na"],
             ...(1)>       ["na", 22, "na", "na", "na"]
             ...(1)>     ]
             iex(2)> Task1aSumOfSubsets.valid_sum(matrix_of_sum)
             [21, 12, 12, 17, 22]
         """
#  Configuration of char list should be printed as list only
#  Source https://stackoverflow.com/questions/30037914/elixir-lists-interpreted-as-char-lists
   IEx.configure(inspect: [charlists: :as_lists])
   def valid_sum(matrix_of_sum) do
		matrix_of_sum |> List.flatten |>
     Enum.filter(fn x -> if is_integer(x), do: x end)
   end
   # Please use h function name for detail in interactive shell.
         @doc """
         #Function name:
                sum_of_one
         #Inputs:
                array_of_digits : Array containing single digit numbers to satisty sum
                sum_val         : Any 2 digit value for which subsets are to be created
         #Output:
                List of list of all possible subsets
         #Details:
                Finds the all possible subsets from given array of digits for a 2 digit value
         #Example call:
           if given array of digits is as follows:
             array_of_digits = [3, 5, 2, 7, 4, 2, 3]
             and sum_val = 10

             iex(1)> array_of_digits = [3, 5, 2, 7, 4, 2, 3]
             iex(2)> Task1aSumOfSubsets.sum_of_one(array_of_digits, 10)
             [[3, 7],[3, 2, 5],[3, 2, 5],[3, 4, 3],[7, 3],[3, 2, 2, 3],[2, 5, 3],[2, 5, 3]]
         """
	 def combination(list,num)
	 def combination(_list, 0), do: [[]]
	 def combination(list=[], _num), do: list
	 def combination([head | tail],num) do
		Enum.map(combination(tail,num - 1),&[head|&1])++
		combination(tail,num)
	 end

   def sum_of_one(array_of_digits, sum_val) when sum_val > 0 do
	   max_count = Enum.count(array_of_digits)
		 loop_1(array_of_digits,1,max_count,sum_val,[])
   end
	 def loop_1(array,st,en,sum,result) when st <= en do
		result = result ++ Enum.filter(combination(array,st),&(if Enum.sum(&1) == sum, do: Enum.sum(&1)))
		loop_1(array,st+1,en,sum,result)
	 end
	 def loop_1(_array,st,en,_sum,result) when st > en do
		result
	 end
	 def sum_of_one(_array_of_digits, sum_val) when sum_val == 0 do
     result = []
     result
   end
         @doc """
         #Function name:
                sum_of_all
         #Inputs:
                array_of_digits : Array containing single digit numbers to satisty sum
                matrix_of_sum   : A 2d matrix containing two digit numbers for which subsebts are to be created
         #Output:
                Map of each sum value and it's respective subsets
         #Details:
                Finds the all possible subsets from given array of digits for all valid sums elements of given 2d matrix
         #Example call:
           if given array of digits is as follows:
             array_of_digits = [3, 5, 2, 7, 4, 2, 3]
           and if given 2d matrix is as follows:
             matrix_of_sum = [
                               [21 ,"na", "na", "na", 12],
                               ["na", "na", 12, "na", "na"],
                               ["na", "na", "na", "na", "na"],
                               [17, "na", "na", "na", "na"],
                               ["na", 22, "na", "na", "na"]
                             ]

             iex(1)> array_of_digits = [3, 5, 2, 7, 4, 2, 3]
             iex(2)> matrix_of_sum = [
             ...(2)>                   [21 ,"na", "na", "na", 12],
             ...(2)>                   ["na", "na", 12, "na", "na"],
             ...(2)>                   ["na", "na", "na", "na", "na"],
             ...(2)>                   [17, "na", "na", "na", "na"],
             ...(2)>                   ["na", 22, "na", "na", "na"]
             ...(2)>                 ]
             iex(3)> Task1aSumOfSubsets.sum_of_all(array_of_digits, matrix_of_sum)
             %{
               12 => [[3, 2, 7],[3, 7, 2],[3, 4, 5],[7, 5],[3, 2, 2, 5],[3, 2, 4, 3],[2, 7, 3],[3, 4, 2, 3],[7, 2, 3],[4, 5, 3],[2, 2, 5, 3]],
               17 => [[3, 2, 7, 5],[3, 7, 2, 5],[3, 4, 7, 3],[3, 2, 7, 2, 3],[3, 2, 4, 5, 3],[2, 7, 5, 3],[3, 4, 2, 5, 3],[7, 2, 5, 3]],
               21 => [[3, 2, 4, 7, 5],[3, 4, 7, 2, 5],[3, 2, 4, 7, 2, 3],[2, 4, 7, 5, 3],[4, 7, 2, 5, 3]],
               22 => [[3, 4, 7, 5, 3], [3, 2, 7, 2, 5, 3]]
             }
         """
   def sum_of_all(array_of_digits,matrix_of_sum) do
		list_of_sum = valid_sum(matrix_of_sum)
		loop_2(array_of_digits, list_of_sum, 0, Enum.count(list_of_sum), %{})
   end

	 def loop_2(array_of_digits,list_of_sum,st,en,result) when st < en do
		list = sum_of_one(array_of_digits,Enum.at(list_of_sum,st))
		IO.inspect array_of_digits
		result = Map.merge(result,%{Enum.at(list_of_sum,st) => list})
		loop_2(array_of_digits,list_of_sum,st+1,en,result)
	 end
	 def loop_2(_array_of_digits,_list_of_sum,st,en,result) when st == en do
		result
	 end
  end
