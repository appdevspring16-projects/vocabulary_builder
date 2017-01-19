class ReadingsController < ApplicationController
  def index
    @q = Reading.ransack(params[:q])
    @readings = @q.result(:distinct => true).includes(:reader_readings, :reading_words, :author).page(params[:page]).per(10)

    render("readings/index.html.erb")
  end

  def show
    @reading_word = ReadingWord.new
    @reader_reading = ReaderReading.new
    @reading = Reading.find(params[:id])

    render("readings/show.html.erb")
  end

  def new
    @reading = Reading.new

    render("readings/new.html.erb")
  end

  def create
    @reading = Reading.new

    @reading.title = params[:title]
    @reading.more_information_url = params[:more_information_url]
    @reading.author_id = params[:author_id]
    @reading.description = params[:description]

    save_status = @reading.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/readings/new", "/create_reading"
        redirect_to("/readings")
      else
        redirect_back(:fallback_location => "/", :notice => "Reading created successfully.")
      end
    else
      render("readings/new.html.erb")
    end
  end

  def edit
    @reading = Reading.find(params[:id])

    render("readings/edit.html.erb")
  end

  def update
    @reading = Reading.find(params[:id])

    @reading.title = params[:title]
    @reading.more_information_url = params[:more_information_url]
    @reading.author_id = params[:author_id]
    @reading.description = params[:description]

    save_status = @reading.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/readings/#{@reading.id}/edit", "/update_reading"
        redirect_to("/readings/#{@reading.id}", :notice => "Reading updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reading updated successfully.")
      end
    else
      render("readings/edit.html.erb")
    end
  end

  def destroy
    @reading = Reading.find(params[:id])

    @reading.destroy

    if URI(request.referer).path == "/readings/#{@reading.id}"
      redirect_to("/", :notice => "Reading deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reading deleted.")
    end
  end
end
