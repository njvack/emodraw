class Admin::ImagesController < ApplicationController
  def show
    img = Image.find(params[:id])
    send_data img.data, :type => img.content_type, :disposition => :inline
  end
end
