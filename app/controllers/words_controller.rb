class WordsController < ApplicationController
  def index
    @words = Word.page(params[:page]).per(10)

    render("words/index.html.erb")
  end

  def show
    @reading_word = ReadingWord.new
    @reader_word = ReaderWord.new
    @word = Word.find(params[:id])

    render("words/show.html.erb")
  end

  def new
    @word = Word.new

    render("words/new.html.erb")
  end

  def create
    @word = Word.new

    @word.word = params[:word]
    @word.language = params[:language]
    @word.definition = params[:definition]

    save_status = @word.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/words/new", "/create_word"
        redirect_to("/words")
      else
        redirect_back(:fallback_location => "/", :notice => "Word created successfully.")
      end
    else
      render("words/new.html.erb")
    end
  end

  def edit
    @word = Word.find(params[:id])

    render("words/edit.html.erb")
  end

  def update
    @word = Word.find(params[:id])

    @word.word = params[:word]
    @word.language = params[:language]
    @word.definition = params[:definition]

    save_status = @word.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/words/#{@word.id}/edit", "/update_word"
        redirect_to("/words/#{@word.id}", :notice => "Word updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Word updated successfully.")
      end
    else
      render("words/edit.html.erb")
    end
  end

  def destroy
    @word = Word.find(params[:id])

    @word.destroy

    if URI(request.referer).path == "/words/#{@word.id}"
      redirect_to("/", :notice => "Word deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Word deleted.")
    end
  end
end
