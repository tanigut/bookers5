class SearchesController < ApplicationController

   def search

     @range = params[:range]  #userかbookかを選択
     search = params[:search] #一致箇所の選択
     @word = params[:word]     #検索ワード

     if @range == '1'
       @user = User.search(search,@word)
     else
       @book = Book.search(search,@word)
     end
     render 'search'
   end

end
