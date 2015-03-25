class EntriesController < ApplicationController

  def index
    @entries = current_user.entries
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create

    @entry = Entry.create_entry(params[:quiz_id],  params[:answers],  current_user)
    redirect_to @entry

  end


end
