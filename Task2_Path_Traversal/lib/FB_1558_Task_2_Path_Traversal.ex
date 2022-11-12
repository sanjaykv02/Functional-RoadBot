defmodule Task2PathTraversal do
@moduledoc """
  A module that implements functions for
  path planning algorithm and travels the path
  """

  @cell_map %{ 1 => [4],
                2 => [3, 5],
                3 => [2],
                4 => [1, 7],
                5 => [2, 6, 8],
                6 => [5, 9],
                7 => [4, 8],
                8 => [5, 7],
                9 => [6]
  }

  @matrix_of_sum [
    ["na","na", 15],
    ["na", "na", 12],
    ["na", 10, "na"]
  ]

  @doc """
  #Function name:
          get_locations
  #Inputs:
          A 2d matrix namely matrix_of_sum containing two digit numbers
  #Output:
          List of locations of the valid_sum which should be in ascending order
  #Details:
          To find the cell locations containing valid_sum in the matrix
  #Example call:
          Check Task 2 Document
  """
  def get_locations(matrix_of_sum \\ @matrix_of_sum) do
    list = List.flatten(matrix_of_sum)
    track(list, 0, Enum.count(list), [])
  end
  def track(list, int, fin, res) when int < fin do
    if Enum.at(list, int) != "na" do
      track(list, int + 1, fin, [int + 1 | res ])
    else
      track(list, int + 1, fin, res)
    end
  end
  def track(list, int, fin, res) when int == fin do
    result = Enum.reverse(res)
    result
  end 
  @doc """
  #Function name:
          cell_traversal
  #Inputs:
          cell_map which contains all paths as well as the start and goal locations
  #Output:
          List containing the path from start to goal location
  #Details:
          To find the path from start to goal location
  #Example call:
          Check Task 2 Document
  """
  def cell_traversal(cell_map \\ @cell_map, start, goal) do
    func1(cell_map, start, goal, [start], [], start)
  end
  def func1(map, st, tg, temp, d_list, int) when int != tg do
    func2(map, map[int], int, st, tg, temp, d_list, 0, Enum.count(map[int]))
  end
  def func1(map, st, tg, temp, d_list, int) when int == tg do
    result = Enum.reverse(temp)
    result
  end
  def func2(map, list, threshold, st, tg, temp, d_list, int, fnl) when int < fnl do
    if Enum.member?(temp, Enum.at(list, int)) == false and Enum.member?(d_list, Enum.at(list, int)) == false do
      func1(map, st, tg, [Enum.at(list,int) | temp], d_list, Enum.at(list, int))
    else
      func2(map, list, threshold, st, tg, temp, d_list, int + 1, fnl)
    end
  end

  def func2(map, list, threshold, st, tg, temp, d_list, int, fnl) when int == fnl do
    func1(map, st, tg, [ st ], [ threshold | d_list ], st)
  end

  @doc """
  #Function name:
          traverse
  #Inputs:
          a list (this will be generated in grid_traversal function) and the cell_map
  #Output:
          List of lists containing paths starting from the 1st cell and visiting every cell containing valid_sum
  #Details:
          To find shortest path from first cell to all valid_sum’s locations
  #Example call:
          Check Task 2 Document
  """
  def traverse(list, cell_map) do
    get_op([1 | list], cell_map, 0, Enum.count(list), [])
  end
  def get_op(list, map, st, en, res) when st < en do
    result = cell_traversal(map, Enum.at(list, st), Enum.at(list,st + 1))
    get_op(list, map, st + 1, en, [result | res])
  end
  def get_op(list, map, st, en, res) when st == en do
    result = Enum.reverse(List.delete(res, [1]))
    result
  end

  @doc """
  #Function name:
          grid_traversal
  #Inputs:
          cell_map and matrix_of_sum
  #Output:
          List of keyword lists containing valid_sum locations along with paths obtained from traverse function
  #Details:
          Driver function which calls the get_locations and traverse function and returns the output in required format
  #Example call:
          Check Task 2 Document
  """
  def grid_traversal(cell_map \\ @cell_map,matrix_of_sum \\ @matrix_of_sum) do
    [1] ++ get_locations(matrix_of_sum)
    |> traverse(cell_map)
    |> Enum.map(fn path_list ->
        [{ Enum.at(path_list, -1)
           |> Integer.to_string()
           |> String.to_atom(), path_list}]
        end)
  end

end
