class EntriesController < ApplicationController

  def create

    params[:answer].each do |question_id, answer_id|
      puts question_id
      puts v
    end

  end


end
