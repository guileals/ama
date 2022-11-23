class PocosController < ApplicationController
  before_action :set_poco, only: %i[ show edit update destroy ]

  # GET /pocos or /pocos.json
  def index
    @pocos = Poco.all
  end

  # GET /pocos/1 or /pocos/1.json
  def show
    @poco = Poco.find(params[:id])
    gon.lat = @poco.lat
    gon.long = @poco.long
    gon.res = @poco.res
  end

  # GET /pocos/new
  def new
    @poco = Poco.new
  end

  # GET /pocos/1/edit
  def edit
  end

  # POST /pocos or /pocos.json
  def create
    @poco = Poco.new(poco_params)

    respond_to do |format|
      if @poco.save
        format.html { redirect_to poco_url(@poco), notice: "Poço adicionado com sucesso!" }
        format.json { render :show, status: :created, location: @poco }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pocos/1 or /pocos/1.json
  def update
    respond_to do |format|
      if @poco.update(poco_params)
        format.html { redirect_to poco_url(@poco), notice: "Poço atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @poco }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pocos/1 or /pocos/1.json
  def destroy
    @poco.destroy

    respond_to do |format|
      format.html { redirect_to pocos_url, notice: "Poço removido com sucesso!", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poco
      @poco = Poco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poco_params
      params.require(:poco).permit(:endereco, :complemento, :cidade, :estado, :telefone, :lat, :long, :res)
    end
end
