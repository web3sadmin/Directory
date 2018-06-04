module ApplicationHelper
  def get_sid_string(data)
      sid = data.unpack('b x nN V*')
      sid[1, 2] = Array[nil, b48_to_fixnum(sid[1], sid[2])]
      sid.delete("-")
    end

    B32 = 2**32

    def b48_to_fixnum(i16, i32)
      i32 + (i16 * B32)
    end


  def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to index_index_path, {:sort => column, :direction => direction}, {:class => css_class}
end

end
