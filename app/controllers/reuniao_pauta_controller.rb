class ReuniaoPautaController < ApplicationController
  # GET /reuniao_pauta
  # GET /reuniao_pauta.json
  def index
    @reuniao_pauta = ReuniaoPautum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reuniao_pauta }
    end
  end

  # GET /reuniao_pauta/1
  # GET /reuniao_pauta/1.json
  def show
    @reuniao_pautum = ReuniaoPautum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reuniao_pautum }
    end
  end

  # GET /reuniao_pauta/new
  # GET /reuniao_pauta/new.json
  def new
    @reuniao_pautum = ReuniaoPautum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reuniao_pautum }
    end
  end

  # GET /reuniao_pauta/1/edit
  def edit
    @reuniao_pautum = ReuniaoPautum.find(params[:id])
  end

  # POST /reuniao_pauta
  # POST /reuniao_pauta.json
  def create
    @reuniao_pautum = ReuniaoPautum.new(params[:reuniao_pautum])

    respond_to do |format|
      if @reuniao_pautum.save
        format.html { redirect_to @reuniao_pautum, notice: 'Reuniao pautum was successfully created.' }
        format.json { render json: @reuniao_pautum, status: :created, location: @reuniao_pautum }
      else
        format.html { render action: "new" }
        format.json { render json: @reuniao_pautum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reuniao_pauta/1
  # PUT /reuniao_pauta/1.json
  def update
    @reuniao_pautum = ReuniaoPautum.find(params[:id])

    respond_to do |format|
      if @reuniao_pautum.update_attributes(params[:reuniao_pautum])
        format.html { redirect_to @reuniao_pautum, notice: 'Reuniao pautum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reuniao_pautum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reuniao_pauta/1
  # DELETE /reuniao_pauta/1.json
  def destroy
    @reuniao_pautum = ReuniaoPautum.find(params[:id])
    @reuniao_pautum.destroy

    respond_to do |format|
      format.html { redirect_to reuniao_pauta_url }
      format.json { head :no_content }
    end
  end
end
