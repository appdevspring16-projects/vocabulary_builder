class ReadingWordsController < ApplicationController
  def index
    @reading_words = ReadingWord.page(params[:page]).per(10)

    render("reading_words/index.html.erb")
  end

  def show
    @reading_word = ReadingWord.find(params[:id])

    render("reading_words/show.html.erb")
  end

  def new
    @reading_word = ReadingWord.new

    render("reading_words/new.html.erb")
  end

  def create
    @reading_word = ReadingWord.new

    @reading_word.word_id = params[:word_id]
    @reading_word.reading_id = params[:reading_id]

    save_status = @reading_word.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reading_words/new", "/create_reading_word"
        redirect_to("/reading_words")
      else
        redirect_back(:fallback_location => "/", :notice => "Reading word created successfully.")
      end
    else
      render("reading_words/new.html.erb")
    end
  end

  def edit
    @reading_word = ReadingWord.find(params[:id])

    render("reading_words/edit.html.erb")
  end

  def update
    @reading_word = ReadingWord.find(params[:id])

    @reading_word.word_id = params[:word_id]
    @reading_word.reading_id = params[:reading_id]

    save_status = @reading_word.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reading_words/#{@reading_word.id}/edit", "/update_reading_word"
        redirect_to("/reading_words/#{@reading_word.id}", :notice => "Reading word updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reading word updated successfully.")
      end
    else
      render("reading_words/edit.html.erb")
    end
  end

  def destroy
    @reading_word = ReadingWord.find(params[:id])

    @reading_word.destroy

    if URI(request.referer).path == "/reading_words/#{@reading_word.id}"
      redirect_to("/", :notice => "Reading word deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reading word deleted.")
    end
  end
end
