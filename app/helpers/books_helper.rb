module BooksHelper
  def book_params
    params.require(:book).permit(:id, :in_storage, :missing, :location, :title, :genre_id, author_ids: [], keyword_ids: [])
  end
end
