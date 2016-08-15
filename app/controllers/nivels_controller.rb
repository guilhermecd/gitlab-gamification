class NivelsController < ApplicationController
  before_action :set_nivel, only: [:show, :edit, :update, :destroy]

  # GET /nivels
  def index
    @nivels = Nivel.all
  end

  # GET /nivels/1
  def show
  end

  # GET /nivels/new
  def new
    @nivel = Nivel.new
  end

  # GET /nivels/1/edit
  def edit
  end

  # POST /nivels
  def create
    @nivel = Nivel.new(nivel_params)

    if @nivel.save
      redirect_to @nivel, notice: 'Nivel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /nivels/1
  def update
    if @nivel.update(nivel_params)
      redirect_to @nivel, notice: 'Nivel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /nivels/1
  def destroy
    @nivel.destroy
    redirect_to nivels_url, notice: 'Nivel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel
      @nivel = Nivel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nivel_params
      params.require(:nivel).permit(:nome_nivel, :qtd_pontos)
    end
end
