# -*- encoding: utf-8 -*-
require 'test_helper'

class JaTest < MiniTest::Test
  def setup
    @browser = Browser.new(ua: 'Safari')
  end

  def test_encode_method
    encoder = Ungarbled::Encoder::Ja.new(@browser)
    assert_equal '日本語ファイル名.txt', encoder.encode('日本語ファイル名.txt')

    browser = Browser.new(ua: 'MSIE')

    encoder = Ungarbled::Encoder::Ja.new(browser)
    assert_equal '%E6%97%A5%E6%9C%AC%E8%AA%9E%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E5%90%8D.txt',
                 encoder.encode('日本語ファイル名.txt')
    assert_equal 'ascii_filename.txt', encoder.encode('ascii_filename.txt')
  end

  def test_encode_for_zip_item_method
    browser = Browser.new(ua: 'Windows')
    encoder = Ungarbled::Encoder::Ja.new(browser)
    assert_equal 'Windows-31J',
                 encoder.encode_for_zip_item('日本語ファイル名.txt').encoding.to_s
  end
end
