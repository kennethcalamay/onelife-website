class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])

    if @contact_form.deliver
      redirect_to contact_path, :notice => "Your message was successfully sent."
    else
      unless @contact_form.errors.any?
        flash[:alert] = "An error occured while sending your message."
      end
      render :action => "new"
    end
  end
end
