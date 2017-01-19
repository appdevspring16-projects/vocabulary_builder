class ReaderReadingsController < ApplicationController
  def index
    @reader_readings = ReaderReading.all

    render("reader_readings/index.html.erb")
  end

  def show
    @reader_reading = ReaderReading.find(params[:id])

    render("reader_readings/show.html.erb")
  end

  def new
    @reader_reading = ReaderReading.new

    render("reader_readings/new.html.erb")
  end

  def create
    @reader_reading = ReaderReading.new

    @reader_reading.reader_id = params[:reader_id]
    @reader_reading.reading_id = params[:reading_id]

    save_status = @reader_reading.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reader_readings/new", "/create_reader_reading"
        redirect_to("/reader_readings")
      else
        redirect_back(:fallback_location => "/", :notice => "Reader reading created successfully.")
      end
    else
      render("reader_readings/new.html.erb")
    end
  end

  def edit
    @reader_reading = ReaderReading.find(params[:id])

    render("reader_readings/edit.html.erb")
  end

  def update
    @reader_reading = ReaderReading.find(params[:id])

    @reader_reading.reader_id = params[:reader_id]
    @reader_reading.reading_id = params[:reading_id]

    save_status = @reader_reading.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reader_readings/#{@reader_reading.id}/edit", "/update_reader_reading"
        redirect_to("/reader_readings/#{@reader_reading.id}", :notice => "Reader reading updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reader reading updated successfully.")
      end
    else
      render("reader_readings/edit.html.erb")
    end
  end

  def destroy
    @reader_reading = ReaderReading.find(params[:id])

    @reader_reading.destroy

    if URI(request.referer).path == "/reader_readings/#{@reader_reading.id}"
      redirect_to("/", :notice => "Reader reading deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reader reading deleted.")
    end
  end
end
