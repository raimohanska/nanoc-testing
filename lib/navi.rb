def navi_items(item, level)
  root = navi_root(item, level)
  items = [root] + root.children
  items.find_all{|i| i[:title]}.sort_by{|i| i[:title]}
end

def navi_root(item, level) 
  if item_depth(item) == level
    item
  else
    navi_root(item.parent, level)
  end
end

def item_depth(item)
  if item.parent
    item_depth(item.parent) + 1
  else
    puts "root set to #{item[:title]}"
    0
  end
end
