class ApisController < ApplicationController
  layout "regLayout"
  before_action :set_api, only: [:show, :edit, :update, :destroy]


  # GET /apis
  # GET /apis.json
  def index
    @apis = Api.all
  end

  # GET /apis/1
  # GET /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @api = Api.new
    @key = generate_api_key
  end

  # POST /apis
  # POST /apis.json
  def create
    @api = Api.new(api_params)
    current_user.apis << @api
    respond_to do |format|

      if @api.save
        format.html { redirect_to user_path(current_user), notice: 'Api-nyckeln har skapats' }
        format.json { render :show, status: :created, location: @api }
      else
        format.html { render :new }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api.destroy
    redirect_to user_path(current_user), notice: 'Nyckeln har raderats'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = Api.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_params
      params.require(:api).permit(:key, :application)
    end

    def generate_api_key
      @key = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Api.exists?(key: random_token)
      end
    end
end
