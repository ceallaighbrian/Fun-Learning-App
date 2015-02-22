class EntriesController < ApplicationController


  def index
    @entries = current_user.entries
  end

  def show

  end

  def create

    @entry = Entry.create_entry(params[:quiz_id], params[:answers], current_user)
    redirect_to @entry

  end


end
