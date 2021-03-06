require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def new_product(image_url)
    Product.new(
      title: 'My Book Title',
      description: 'tremendous book',
      price: 1,
      image_url: image_url
    )
  end
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  
  test "product price must be positive" do
    product = Product.new(title: 'My Book Title',
      description: 'tremendous book',
      image_url: 'zzz.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal I18n.translate('activerecord.errors.models.product.attributes.price.greater_than_or_equal_to'),
      product.errors[:price].join('; ')      
    product.price = 0
    assert product.invalid?
    assert_equal I18n.translate('activerecord.errors.models.product.attributes.price.greater_than_or_equal_to'),
      product.errors[:price].join('; ')
    product.price = 1
    assert product.valid?
  end
  
  test "image url" do
    good_names = %w{jonny.gif jonny.jpg jonny.png JONNY.JPG JONNY.Jpg
      http://a.b.c/xx/y/z/jonny.gif}
    bad_names = %w{jonny.doc jonny.gif/more jonny.gif.more jonny}
    good_names.each do |name|
      assert new_product(name).valid?, "#{name} should'n be invalid"
    end
    bad_names.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  
  test "product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title,
      description: 'yyy',
      price: 1,
      image_url: 'rails.png')
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.models.product.attributes.title.taken'),
      product.errors[:title].join('; ')
  end
end
