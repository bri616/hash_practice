class HomebrewInventory
  attr_accessor :inventory_items
  def initialize(list_of_items)
    @inventory_items = []
    list_of_items.each {|item| add_to_inventory(item)}
  end

  def add_to_inventory(item)
    @inventory_items << InventoryItem.new(item)
  end

  def show_items
    @inventory_items.each {|inventory_item| inventory_item.show_item_attrs}
  end

  class InventoryItem
    attr_accessor :beer_name, :style, :og, :fg, :date_brewed, :amount, :date_bottled, :abw, :abv
    def initialize(inventory_item)
      @beer_name = inventory_item[:beer_name]
      @style = inventory_item[:style]
      @og = inventory_item[:og]
      @fg = inventory_item[:fg]
      @date_brewed = inventory_item[:date_brewed]
      @amount = inventory_item[:amount]
      @date_bottled = inventory_item[:date_bottled]
      @abw = calc_abw(@og.to_f, @fg.to_f)
      @abv = calc_abv(@abw.to_f)
    end

    def calc_abw(og, fg)
      ((og - fg)*105).round(1).to_s
    end

    def calc_abv(abw)
      (abw*1.25).round(1).to_s
    end

    def show_item_attrs
      puts @beer_name
      puts @style
      puts @og
      puts @fg
      puts @date_brewed
      puts @amount
      puts @date_bottled
      puts @abw
      puts @abv
    end

  end
end

item1 = {
  beer_name: "Blargle Milk Stout",
  style: "Sweet Stout",
  og: "1.072",
  fg: "1.027",
  date_brewed: "2014.03.29",
  amount: "3 G",
  date_bottled: "2014.05.07"
  }

item2 = {
  beer_name: "Chamomile Pale Ale",
  style: "American Pale Ale",
  og: "1.046",
  fg: "1.010",
  date_brewed: "2014.08.17",
  amount: "3 G",
  date_bottled: "2014.08.31"
}

my_inventory = [item1, item2]

my_hb_inventory = HomebrewInventory.new(my_inventory)

my_hb_inventory.show_items

# my_inventory.each do |inventory_item|
#   a_beer = HomebrewInventory.new(inventory_item)
#   puts a_beer
#   puts a_beer.beer_name
#   puts a_beer.style
#   puts a_beer.og
#   puts a_beer.fg
#   puts a_beer.date_brewed
#   puts a_beer.amount
#   puts a_beer.date_bottled
#   puts a_beer.abw
#   puts a_beer.abv
# end
