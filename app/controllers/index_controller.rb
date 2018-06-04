class IndexController < ApplicationController
  before_action :set_index, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

def index

      @indexes = if params[:term]
        Index.where('name LIKE ? OR mail LIKE ? OR telephoneNumber LIKE?', "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%")
      else
        Index.order(sort_column + " " + sort_direction)
      end
      @indexnew = Index.new

end

  def show

  end

  def new
    @index = Index.new
  end


  def create
    @index = Index.new(index_params)

    respond_to do |format|
      if @index.save
        UserMailer.welcome_email(@index).deliver
        format.html { redirect_to @index, notice: 'Пользователь создан.' }
        #format.json { render :show, status: :created, location: @index }
      else
        format.html { render :new }
      #  format.json { render json: @index.errors, status: :unprocessable_entity }
      end
    end
  end

def update
  respond_to do |format|
        if @index.update(index_params)
          format.html { redirect_to @index, notice: 'Данные пользователя обновлены.' }
          format.json { render :show, status: :ok, location: @index }
        else
          format.html { render :edit }
          format.json { render json: @index.errors, status: :unprocessable_entity }
        end
      end
end

  def destroy
      @index.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Пользователь удален.' }
        format.json { head :no_content }
      end
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_index
      @index = Index.find(params[:id])
    end
    def sort_column
    Index.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  def index_params
      params.require(:index).permit(:name, :givenName, :sn, :displayName, :description, :physicalDeliveryOfficeName, :telephoneNumber, :mail, :title, :department, :company, :ipphone, :mobile, :homephone, :photo, :cloudUser, :usbUser, :userit, :registered, :term)
    end
end
