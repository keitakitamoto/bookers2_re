class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    # :book_idはカラム名
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = BookComment.find_by(id: params[:id],book_id: book.id)
    # find by 複数の条件を指定できて、一致した一件の情報を取得する
    comment.destroy
    redirect_to book_path(book)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end