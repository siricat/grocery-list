categories = [
  'Alcohol',
  'Baby',
  'Bakery',
  'Baking',
  'Beverages',
  'Breads',
  'Beauty',
  'Canned and Jarred Goods',
  'Cereals',
  'Cleaning Supplies',
  'Dairy',
  'Deli',
  'Frozen',
  'Garden',
  'Gifts',
  'Health',
  'Holiday',
  'Home',
  'International Cuisine',
  'Meat',
  'Oils and Dressings',
  'Pasta, Rice, and Beans',
  'Pet',
  'Pharmacy',
  'Produce',
  'Ready Made',
  'Sauces and Condiments',
  'Seafood',
  'Snacks',
  'Spices',
  'Toys',
  'Miscellaneous'
]

categories.each do |name|
  Category.seed(:name) do |seed|
    seed.name = name
  end
end

