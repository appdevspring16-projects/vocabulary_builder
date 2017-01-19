class ReaderWordsController < ApplicationController
  def index
    @reader_words = ReaderWord.all

    render("reader_words/index.html.erb")
  end

  def show
    @reader_word = ReaderWord.find(params[:id])

    render("reader_words/show.html.erb")
  end

  def new
    @reader_word = ReaderWord.new

    render("reader_words/new.html.erb")
  end

  def create
    @reader_word = ReaderWord.new

    @reader_word.reader_id = params[:reader_id]
    @reader_word.word_id = params[:word_id]
    @reader_word.reader_readings_id = params[:reader_readings_id]
    @reader_word.context = params[:context]
    @reader_word.favorite = params[:favorite]

    save_status = @reader_word.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reader_words/new", "/create_reader_word"
        redirect_to("/reader_words")
      else
        redirect_back(:fallback_location => "/", :notice => "Reader word created successfully.")
      end
    else
      render("reader_words/new.html.erb")
    end
  end

  def edit
    @reader_word = ReaderWord.find(params[:id])

    render("reader_words/edit.html.erb")
  end

  def update
    @reader_word = ReaderWord.find(params[:id])

    @reader_word.reader_id = params[:reader_id]
    @reader_word.word_id = params[:word_id]
    @reader_word.reader_readings_id = params[:reader_readings_id]
    @reader_word.context = params[:context]
    @reader_word.favorite = params[:favorite]

    save_status = @reader_word.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reader_words/#{@reader_word.id}/edit", "/update_reader_word"
        redirect_to("/reader_words/#{@reader_word.id}", :notice => "Reader word updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reader word updated successfully.")
      end
    else
      render("reader_words/edit.html.erb")
    end
  end

  def destroy
    @reader_word = ReaderWord.find(params[:id])

    @reader_word.destroy

    if URI(request.referer).path == "/reader_words/#{@reader_word.id}"
      redirect_to("/", :notice => "Reader word deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reader word deleted.")
    end
  end
end
