defmodule Task1bNumberDetection do
@moduledoc """
  A module that implements functions for detecting numbers present in a grid in provided image
  """
  alias Evision, as: OpenCV


  @doc """
  #Function name:
         identifyCellNumbers
  #Inputs:
         image  : Image path with name for which numbers are to be detected
  #Output:
         Matrix containing the numbers detected
  #Details:
         Function that takes single image as an argument and provides the matrix of detected numbers
  #Example call:

      iex(1)> Task1bNumberDetection.identifyCellNumbers("images/grid_1.png")
      [["22", "na", "na"], ["na", "na", "16"], ["na", "25", "na"]]
  """
  
  def get_img_mat(path) do
    OpenCV.imread(path)
  end


  # This function is used to read an image
  # from a given file as grayscale
  # and remove noise from image
  def get_gray_img_mat(path) do
    th = OpenCV.imread(path, flags: OpenCV.cv_IMREAD_GRAYSCALE)
    kernel = OpenCV.getStructuringElement(OpenCV.cv_MORPH_RECT,{3,3})
    th = OpenCV.morphologyEx(th,OpenCV.cv_MORPH_OPEN,kernel)
    th
  end

  # This is the most useful function which is
  # used to update the image
  def update(img_mat, ref_img) do
    OpenCV.imwrite(ref_img, img_mat)
    :done
  end

  # To display image
  def show(path) do
    System.cmd("xdg-open", [path])
    :ok
  end

  def identifyCellNumbers(image) do

    img_mat = get_img_mat image
    update(img_mat, "first.png")

#   show "first.png"

    g_img_mat = get_gray_img_mat image
    update(g_img_mat, "second.png")

#    show "second.png"

## In findContours 2nd and 3rd argument used to find contours with Simple Approximation
## Method ~3rd and Return external list mode use 0 for return external ~2nd 

    {contour, _hierarchy} = OpenCV.findContours(g_img_mat, 1, 1)     
    contour_mat = OpenCV.drawContours(img_mat, contour, -1, {0,0,255})
    contour_mat |> update("third.png")

#   show "third.png"

    {_sorted_area, sorted_contour} = sort(contour, 0, Enum.count(contour), 0, 0, [], [])

    sorted_mat = OpenCV.drawContours(img_mat, [Enum.at(sorted_contour, 1)], -1, {0,0,255})
    sorted_mat |> update("fourth.png")
#   show "fourth.png"

    {x,y,w,h} = OpenCV.boundingRect(Enum.at(sorted_contour, 1))
    crop_mat = Evision.Mat.roi(img_mat, {y, y+h}, {x, x+w})
    crop_mat |> update("fifth.png")

#   show "fifth.png"

    cropped_image = "fifth.png"
    gray_crop_mat = get_gray_img_mat cropped_image
    gray_crop_mat |> update(cropped_image)

#   show cropped_image

    {cont, _} = OpenCV.findContours(gray_crop_mat, 1, 2)     
    cont_mat = OpenCV.drawContours(crop_mat, cont, -1, {0,0,255})
    cont_mat |> update("sixth.png")

#   show "sixth.png"

##  now find the all cordinates arrange them in particular order and based on this 
##  sort the above contour mat, then you can read the image.
    rect_mat = trace_rect(cont, 0, Enum.count(cont), [])
#   rect_mat = rect_mat -- [Enum.at(rect_mat,0), Enum.at(rect_mat,1)]
#   To define rows and columns
    {test, _,_,_} = OpenCV.boundingRect(Enum.at(rect_mat, 0))
    {detected_list, row} = clipped_cell(0, Enum.count(rect_mat), crop_mat, rect_mat, [], test, 0)
    col = div(Enum.count(detected_list), row)
#    IO.inspect {row, col}
    matrix(detected_list, 0, row, col, [])
  end
## To made m x n matrix
 def matrix(list_item, int, row, col, result) when int < row do
   temp = list(list_item, int, 0, col, [])
   matrix(list_item, int + 1, row, col, [temp | result])
 end
 def matrix(_list_item, int, row, _col, result) when int == row do
   result = Enum.reverse(result)
   result
 end
 def list(list_item, int, int_2, col, result) when int_2 < col do
   data = Enum.at(list_item, int*col + int_2)
   list(list_item, int, int_2 + 1, col, [data | result])
 end
 def list(_list_item, _int, int_2, col, result) when int_2 == col do
   result = Enum.reverse(result)
   result
 end
## To trace rectangular cells from the final grid
  def trace_rect(cont, i, l, res) when i < l do
    arc_len = Evision.arcLength(Enum.at(cont, i), true)
    approx_con = Evision.approxPolyDP(Enum.at(cont, i), 0.02*arc_len, true)
    {len, _, _} =  approx_con |> Evision.Mat.to_nx() |> Nx.shape()
    if len == 4 do
      trace_rect(cont, i + 1, l, [Enum.at(cont, i) | res])
    else
      trace_rect(cont, i + 1, l, res)
    end
  end
  def trace_rect(_cont, i, l, res) when i == l do
    res
  end


## To clip cells

  def clipped_cell(init, fin, crop_mat, cont, res, test, row) when init < fin do
    cmat = Enum.at(cont, init)
    {x,y,w,h} = OpenCV.boundingRect(cmat)
    clip_mat = Evision.Mat.roi(crop_mat, {y, y+h}, {x, x+w})
    clip_mat |> update("seventh.png")
#   show "seventh.png"
    gmat = get_gray_img_mat("seventh.png")
    mat = get_img_mat("seventh.png")
    {cntr, _} = Evision.findContours(gmat, 1, 2)
    Evision.drawContours(mat, cntr, -1, {0, 0, 0}, thickness: 2) |> update("tem.png")
#   show "tem.png"
    data = TesseractOcr.read("seventh.png",%{psm: 6, oem: 1, dpi: 200})
    if String.match?(data, ~r{\A\d*\z})  and data != "" do
      if x == test do
        clipped_cell(init + 1, fin, crop_mat, cont, [data | res], test, row + 1)
      else
        clipped_cell(init + 1, fin, crop_mat, cont, [data | res], test, row )
      end
    else
      if x == test do
        clipped_cell(init + 1, fin, crop_mat, cont, ["na" | res], test, row + 1)
      else 
        clipped_cell(init + 1, fin, crop_mat, cont, ["na" | res], test, row)
        end
    end
  end
  def clipped_cell(init, fin, _crop_mat, _cont, res, _test, row) when init == fin do
    {Enum.reverse(res), row}
  end
  
## To sort contour
  def sort(contour, init, fin, temp, i, result, res) when init < fin and fin != 0 do
    area = OpenCV.contourArea(Enum.at(contour,init))
    if temp < area do
      sort(contour, init + 1, fin, area, init, result, res)
    else  
      sort(contour, init + 1, fin, temp, i, result, res)
    end
  end
  def sort(contour, init, fin, temp, i, result, res) when init == fin and fin != 1 do
    new = List.delete(contour, Enum.at(contour, i))
    sort(new, 0, Enum.count(new), 0, i, [temp | result], [Enum.at(contour,i) | res])
  end 
  def sort(contour, init, fin, temp, i, result, res) when init == fin and fin ==1 do
    result = [temp | result]
    res = [Enum.at(contour,i) | res]
    {Enum.reverse(result), Enum.reverse(res)}
  end

  @doc """
  #Function name:
         identifyCellNumbersWithLocations
  #Inputs:
         matrix  : matrix containing the detected numbers
  #Output:
         List containing tuple of detected number and it's location in the grid
  #Details:
         Function that takes matrix generated as an argument and provides list of tuple
  #Example call:

        iex(1)> matrix = Task1bNumberDetection.identifyCellNumbers("images/grid_1.png")
        [["22", "na", "na"], ["na", "na", "16"], ["na", "25", "na"]]
        iex(2)> Task1bNumberDetection.identifyCellNumbersWithLocations(matrix)
        [{"22", 1}, {"16", 6}, {"25", 8}]
  """
  def identifyCellNumbersWithLocations(matrix) do
    list = List.flatten(matrix)
    valid_num(list, 0, Enum.count(list), [])
  end
  def valid_num(list, int, fnl, res) when int < fnl do
    if Enum.at(list, int) != "na" do
      data = {Enum.at(list, int), int + 1}
      valid_num(list, int + 1, fnl, [data | res])
    else
      valid_num(list, int + 1, fnl, res)
    end
  end
  def valid_num(_list, int, fnl, res) when int == fnl do
    res = Enum.reverse(res)
    res
  end

  @doc """
  #Function name:
         driver
  #Inputs:
         path  : The path where all the provided images are present
  #Output:
         A final output with image name as well as the detected number and it's location in gird
  #Details:
         Driver functional which detects numbers from mutiple images provided
  #Note:
         DO NOT EDIT THIS FUNCTION
  #Example call:

      iex(1)> Task1bNumberDetection.driver("images/")
      [
        {"grid_1.png", [{"22", 1}, {"16", 6}, {"25", 8}]},
        {"grid_2.png", [{"13", 3}, {"27", 5}, {"20", 7}]},
        {"grid_3.png", [{"17", 3}, {"20", 4}, {"11", 5}, {"15", 9}]},
        {"grid_4.png", []},
        {"grid_5.png", [{"13", 1}, {"19", 2}, {"17", 3}, {"20", 4}, {"16", 5}, {"11", 6}, {"24", 7}, {"15", 8}, {"28", 9}]},
        {"grid_6.png", [{"20", 2}, {"17", 6}, {"23", 9}, {"15", 13}, {"10", 19}, {"19", 22}]},
        {"grid_7.png", [{"19", 2}, {"21", 4}, {"10", 5}, {"23", 11}, {"15", 13}]}
      ]
  """
  def driver(path \\ "images/") do

       # Getting the path of images
       image_path = path <> "*.png"
       # Creating a list of all images paths with extension .png
       image_list = Path.wildcard(image_path)
       # Parsing through all the images to get final output using the two funtions which teams need to complete
       Enum.map(image_list, fn(x) ->
              {String.trim_leading(x,path), identifyCellNumbers(x) |> identifyCellNumbersWithLocations}
       end)
  end

end
