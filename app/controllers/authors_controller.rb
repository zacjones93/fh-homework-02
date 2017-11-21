class AuthorsController < ApplicationController

  def create
    @author = Author.create(author_params)
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :age)
  end
end
