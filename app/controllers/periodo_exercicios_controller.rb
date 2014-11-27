class PeriodoExerciciosController < ApplicationController
  # GET /periodo_exercicios
  # GET /periodo_exercicios.json
  def index
    @periodo_exercicios = PeriodoExercicio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @periodo_exercicios }
    end
  end

  # GET /periodo_exercicios/1
  # GET /periodo_exercicios/1.json
  def show
    @periodo_exercicio = PeriodoExercicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @periodo_exercicio }
    end
  end

  # GET /periodo_exercicios/new
  # GET /periodo_exercicios/new.json
  def new
    @periodo_exercicio = PeriodoExercicio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @periodo_exercicio }
    end
  end

  # GET /periodo_exercicios/1/edit
  def edit
    @periodo_exercicio = PeriodoExercicio.find(params[:id])
  end

  # POST /periodo_exercicios
  # POST /periodo_exercicios.json
  def create
    @periodo_exercicio = PeriodoExercicio.new(params[:periodo_exercicio])

    respond_to do |format|
      if @periodo_exercicio.save
        format.html { redirect_to @periodo_exercicio, notice: 'Periodo exercicio was successfully created.' }
        format.json { render json: @periodo_exercicio, status: :created, location: @periodo_exercicio }
      else
        format.html { render action: "new" }
        format.json { render json: @periodo_exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /periodo_exercicios/1
  # PUT /periodo_exercicios/1.json
  def update
    @periodo_exercicio = PeriodoExercicio.find(params[:id])

    respond_to do |format|
      if @periodo_exercicio.update_attributes(params[:periodo_exercicio])
        format.html { redirect_to @periodo_exercicio, notice: 'Periodo exercicio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @periodo_exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodo_exercicios/1
  # DELETE /periodo_exercicios/1.json
  def destroy
    @periodo_exercicio = PeriodoExercicio.find(params[:id])
    @periodo_exercicio.destroy

    respond_to do |format|
      format.html { redirect_to periodo_exercicios_url }
      format.json { head :no_content }
    end
  end
end
