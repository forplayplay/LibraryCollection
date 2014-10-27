# spec/controllers/search_controller_spec.rb
require 'spec_helper' 
require 'support/api_utilities'

describe SearchController do

  describe '#search' do 

    it 'returns results for good search terms' do 
      keyword = FactoryGirl.create(:keyword)
      get :search, "search" => "boogers"
      response.should be_ok
      expect(assigns[:keywords]).to include(keyword)
    end 

    it 'returns results for good, multi-word search terms' do 
      book = FactoryGirl.create(:book, title: "The True Story of Those Boots")
      get :search, "search" => "True Boots"
      response.should be_ok
      expect(assigns[:books]).to include(book)
    end 

    it 'returns nothing for unsuccessful searches' do 
      get :search, search: "Pegasus"
      response.should be_ok
      expect(assigns[:authors].empty?).to be_true
    end 

    it 'redirects with notice for nil search terms' do 
      get :search, search: ""
      flash[:notice].should_not be_nil
      response.should redirect_to root_url
    end 

  end 

  describe 'scrape' do

  before do 
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    @user = create :user
    @admin = create :admin 
    @isbn = "1234567890"
    create_google_stub(create_google_url(@isbn), "exists")
  end 

  after do 
    DatabaseCleaner.clean
  end 

  after :each do 
    Warden.test_reset! 
  end 


    context 'as non-admin' do

      before { sign_in @user }


      it 'redirects un-authorized users' do
        expect(get :import).to redirect_to(root_path)
        expect(post :scrape, isbn: @isbn).to redirect_to(root_path)
      end
    end

    context 'as admin' do

      before { sign_in @admin }

      context 'success' do
        it 'redirects to edit book' do
          post :scrape, isbn: @isbn
          expect(response).to redirect_to(edit_book_path(Book.last))
        end
      end

      context 'failure' do
        it 'redirects to import' do
          Search.scrape(@isbn)
          post :scrape, isbn: @isbn
          expect(response).to redirect_to(import_path)
        end
      end
    end
  end
end 