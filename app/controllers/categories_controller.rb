class CategoriesController < ApplicationController
  def news
    query("news")
  end

  def programming
    query("programming")
  end

  def education
    query("education")
  end

  def sports
    query("sports")
  end

  def humor
    query("humor")
  end

  private
  def query(column)
    @posts = Post.where("#{column} = 't'")
  end
end
