class EmailsController < ApplicationController
  include EmailsHelper

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(
      object: get_object,
      body: get_otis_quote,
      read: false
    )
    if @email.save
      respond_to do |format|
        format.html {
          redirect_to root_path
          flash[:notice] = "Email ajouté !"
        }
        format.js {}
      end
    else
      respond_to do |format|
        format.html {
          redirect_to root_path
          flash[:notice] = "Erreur"
        }
        # format.js {}
      end
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.read = true
    @email.save
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.js {}
    end
  end

end
