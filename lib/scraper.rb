require 'nokogiri'
require 'open-uri'
require "pry"

require_relative './course.rb'

class Scraper

  attr_reader :doc

  def get_page
  html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
  @doc = Nokogiri::HTML(html)
  end

  def get_courses
    @courses = self.get_page.css("h2")
  end

  def make_courses
    self.get_courses.map do |element|
      new_course = Course.new
      new_course.title = element.css("h2").text
      new_course.schedule = element.css(".date").text
      new_course.description = element.css("p").text
    end
  end

  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



