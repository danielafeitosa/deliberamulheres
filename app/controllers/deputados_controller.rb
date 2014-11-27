class DeputadosController < ApplicationController
  # GET /deputados
  # GET /deputados.json
  def index
    @deputados = Deputado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deputados }
    end
  end

  # GET /deputados/1
  # GET /deputados/1.json
  def show
    @deputado = Deputado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deputado }
    end
  end

  # GET /deputados/new
  # GET /deputados/new.json
  def new
    @deputado = Deputado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deputado }
    end
  end

  # GET /deputados/1/edit
  def edit
    @deputado = Deputado.find(params[:id])
  end

  # POST /deputados
  # POST /deputados.json
  def create
    @deputado = Deputado.new(params[:deputado])

    respond_to do |format|
      if @deputado.save
        format.html { redirect_to @deputado, notice: 'Deputado was successfully created.' }
        format.json { render json: @deputado, status: :created, location: @deputado }
      else
        format.html { render action: "new" }
        format.json { render json: @deputado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deputados/1
  # PUT /deputados/1.json
  def update
    @deputado = Deputado.find(params[:id])

    respond_to do |format|
      if @deputado.update_attributes(params[:deputado])
        format.html { redirect_to @deputado, notice: 'Deputado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deputado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deputados/1
  # DELETE /deputados/1.json
  def destroy
    @deputado = Deputado.find(params[:id])
    @deputado.destroy

    respond_to do |format|
      format.html { redirect_to deputados_url }
      format.json { head :no_content }
    end
  end
end
