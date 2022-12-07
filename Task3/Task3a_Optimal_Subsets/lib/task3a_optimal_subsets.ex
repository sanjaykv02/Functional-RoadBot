defmodule Task3aOptimalSubsets do

  # Function that generates the list for array_of_digits randomly
  def random_list_generator do
    for _n <- 1..Enum.random(6..9), do: Enum.random(1..9)
  end

  # Function that generates the 2d matrix for matrix_of_sum randomly
  def random_matrix_generator do
    list_of_na = for _n <- 1..9, do: "na"
    recurse(list_of_na, Enum.random(3..5)) |>
    Enum.chunk_every(3)
  end

  # Helper function for `random_matrix_generator()`
  def recurse(list_of_na, 0), do: list_of_na
  def recurse(list_of_na, num_of_sum) do
    recurse(List.replace_at(list_of_na, Enum.random(0..8), Enum.random(11..20)), num_of_sum-1)
  end

  @doc """
  #Function name:
        valid_sum
  #Inputs:
        matrix_of_sum   : A 2d matrix containing two digit numbers for which subsebts are to be created
  #Output:
        List of all vallid sums from the given 2d matrix
  #Details:
        Finds the valid sum values from the given 2d matrix
  """

  #  Configuration of char list should be printed as list only
  #  Source https://stackoverflow.com/questions/30037914/elixir-lists-interpreted-as-char-lists
  IEx.configure(inspect: [charlists: :as_lists])

  # #Example:
  #            matrix_of_sum = [
  #                              [21 ,"na", "na", "na", 12],
  #                              ["na", "na", 12, "na", "na"],
  #                              ["na", "na", "na", "na", "na"],
  #                              [17, "na", "na", "na", "na"],
  #                              ["na", 22, "na", "na", "na"]
  #                            ]


  def valid_sum(matrix_of_sum \\ random_matrix_generator()) do
    IO.inspect matrix_of_sum, label:  "matrix_of_sum"
    ### Write your code here ###
    matrix_of_sum |> List.flatten |>
         Enum.filter(fn x -> if is_integer(x), do: x end)
  end


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
  """

  # array_of_digits = [3, 5, 2, 7, 4, 2, 3]
  #              and sum_val = 10

  def combination(list,num)
  def combination(_list, 0), do: [[]]
  def combination(list=[], _num), do: list
  def combination([head | tail],num) do
   Enum.map(combination(tail,num - 1),&[head|&1])++
   combination(tail,num)
  end

  def sum_of_one(array_of_digits \\ random_list_generator(), sum_val \\ Enum.random(11..20)) do
    IO.inspect array_of_digits, label:  "array_of_digits"
    IO.inspect sum_val, label:  "sum_val"
    ### Write your code here ###
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
  """

  # #Example call:
  #          if given array of digits is as follows:
  #            array_of_digits = [3, 5, 2, 7, 4, 2, 3]
  #          and if given 2d matrix is as follows:
  #            matrix_of_sum = [
  #                              [21 ,"na", "na", "na", 12],
  #                              ["na", "na", 12, "na", "na"],
  #                              ["na", "na", "na", "na", "na"],
  #                              [17, "na", "na", "na", "na"],
  #                              ["na", 22, "na", "na", "na"]
  #                            ]

   def sum_of_all(array_of_digits \\ random_list_generator(), matrix_of_sum \\ random_matrix_generator()) do
    IO.inspect array_of_digits, label:  "array_of_digits"
    IO.inspect matrix_of_sum, label:  "matrix_of_sum"
    ### Write your code here ###
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

  @doc """
  #Function name:
        get_optimal_subsets
  #Inputs:
        array_of_digits : Array containing single digit numbers to satisty sum
        matrix_of_sum   : A 2d matrix containing two digit numbers for which subsebts are to be created
  #Output:
        Map containing the sums and corresponding subset as keys & values respectively
  #Details:
        Function that takes matrix_of_sum and array_of_digits as argument and select single subset for each sum optimally to satisfy maximum sums
  #Example call:
      Check Task 3A Document
  """
  def get_optimal_subsets(array_of_digits \\ random_list_generator(), matrix_of_sum \\ random_matrix_generator()) do
    IO.inspect array_of_digits, label:  "array_of_digits"
    IO.inspect matrix_of_sum, label:  "matrix_of_sum"
    ### Write your code here ###

  end

end
