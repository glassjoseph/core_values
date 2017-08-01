class JournalsController < ApplicationController

  def index
    @journals = current_user.journals
  end

  def new
    @journal = Journal.new
  end

  def create
    new_journal = current_user.journals.new(journal_params)
    if new_journal.save
      new_journal.tag_list(tag_params[:tag_list])
      flash[:success] = "Journal Created!"
      redirect_to journals_path
    else
      flash.now[:danger] = "Creation Unsuccessful"
      @journal = Journal.new
      render :new
    end
  end

  def edit
    @journal = current_user.journals.find(params[:id])
  end

  def update
    @journal = current_user.journals.find(params[:id])
    if @journal.update(journal_params)
      @journal.tag_list(tag_params[:tag_list])
      flash[:success] = "Journal Updated!"
      redirect_to journals_path
    else
      flash.now[:warning] = "Update Unsuccessful"
      render :edit
    end
  end

  def destroy
    @journal = current_user.journals.find(params[:id])
    @journal.destroy
    flash[:success] = "Journal Deleted"
    redirect_to journals_path
  end

  private
    def journal_params
      params.require(:journal).permit(:title, :content, :user_id, :daily_id)
    end

    def tag_params
      params.require(:journal).permit(:tag_list)
    end
end
