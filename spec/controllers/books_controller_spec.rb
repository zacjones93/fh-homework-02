require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:valid_attributes) { { title: "Oathbringer", author: "Brandon Sanderson", genre: "Fantasy", classification: "Fine Arts", book_type: "Fiction", year: 2017 } }
  let(:invalid_attributes) { { title: "", author: "Brandon Sanderson", genre: "Fantasy", classification: "Fine Arts", book_type: "Fiction", year: 2017 } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all books as @books" do
      book = Book.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:books)).to eq([book])
    end
  end

  describe "GET #show" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :show, params: {id: book.to_param}, session: valid_session
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "GET #new" do
    it "assigns a new book as @book" do
      get :new, params: {}, session: valid_session
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET #edit" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :edit, params: {id: book.to_param}, session: valid_session
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, params: {book: valid_attributes}, session: valid_session
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, params: {book: valid_attributes}, session: valid_session
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it "redirects to the created book" do
        post :create, params: {book: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Book.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        expect {
          post :create, params: {book: invalid_attributes}, session: valid_session
        }.to change(Book, :count).by(0)
      end

      it "re-renders the 'new' template" do
        post :create, params: {book: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "Oathbringer", author: "Brandon Sanderson", genre: "Fantasy", classification: "Fine Arts", book_type: "Fiction", year: 2017 }
      }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: new_attributes}, session: valid_session
        expect(response).to redirect_to(book)
      end

      it "assigns the requested book as @book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: valid_attributes}, session: valid_session
        expect(assigns(:book)).to eq(book)
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: valid_attributes}, session: valid_session
        expect(response).to redirect_to(book)
      end
    end

    context "with invalid params" do
      it "assigns the book as @book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}, session: valid_session
        expect(assigns(:book)).to eq(book)
      end

      it "re-renders the 'edit' template" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: {id: book.to_param}, session: valid_session
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the book list" do
      book = Book.create! valid_attributes
      delete :destroy, params: {id: book.to_param}, session: valid_session
      expect(response).to redirect_to(books_url)
    end
  end

end
