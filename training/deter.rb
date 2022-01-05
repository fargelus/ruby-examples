def cross_out_matrix(matrix, index)
  matrix.slice(1..-1).map do |row|
    row.each_with_index.reject { |*, col_index| col_index == index }.map(&:first)
  end
end

# return the determinant of the matrix passed in
def determinant(matrix)
  case matrix.size
  when 1
    matrix.flatten.first
  when 2
    first_row = matrix.first
    last_row = matrix.last
    first_row.first * last_row.last - first_row.last * last_row.first
  else
    indexes = matrix.first
    operations = %i[- +]
    indexes.each_with_index.reduce(0) do |memo, (num, index)|
      crossed_matrix = cross_out_matrix(matrix, index)
      det = num * determinant(crossed_matrix)
      operations.reverse!
      memo.send(operations.first, det)
    end
  end
end
