module MenuHelper
  def main_menu_items
    menu_root = [Rails.root, 'config', 'menu', 'default'].join('/')

    File.open([menu_root, 'menu.yml'].join('/')) { |file| YAML.load(file) }.map do |i|
      file_name = [menu_root, "#{i[:name]}.yml"].join('/')
      File.open([menu_root, "#{i[:name]}.yml"].join('/')) { |file| YAML.load(file) } if File.exists?(file_name)
    end.flatten.compact
  end

  def menu_items
    menu_items = []
    main_menu_items.each do |menu_item|
      menu_items << item(menu_item)
    end
    menu_items.compact
  end

  def item(menu_item)
    items = menu_item[:items]
    if items.present?
      sub_menu_items = []
      items.each do |item|
        sub_menu_items << item(item)
      end
      sub_menu_items = sub_menu_items.compact
      if sub_menu_items.present?
        menu_item[:items] = sub_menu_items
      end
    end

    menu_item
  end
end
