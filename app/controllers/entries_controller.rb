class EntriesController < ApplicationController

  def index
    @entries = current_user.entries
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.create_entry(params[:quiz_id],  params[:answers],  current_user)
    if @entry.present?
    flash[:success] = @entry.message unless @entry.message.blank?
    redirect_to @entry
    elsif redirect_to current_user
    end

  end


end
