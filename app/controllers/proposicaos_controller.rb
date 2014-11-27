class ProposicaosController < ApplicationController
  # GET /proposicaos
  # GET /proposicaos.json
  def index
    @proposicaos = Proposicao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposicaos }
    end
  end

  # GET /proposicaos/1
  # GET /proposicaos/1.json
  def show
    @proposicao = Proposicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposicao }
    end
  end

  # GET /proposicaos/new
  # GET /proposicaos/new.json
  def new
    @proposicao = Proposicao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proposicao }
    end
  end

  # GET /proposicaos/1/edit
  def edit
    @proposicao = Proposicao.find(params[:id])
  end

  # POST /proposicaos
  # POST /proposicaos.json
  def create
    @proposicao = Proposicao.new(params[:proposicao])

    respond_to do |format|
      if @proposicao.save
        format.html { redirect_to @proposicao, notice: 'Proposicao was successfully created.' }
        format.json { render json: @proposicao, status: :created, location: @proposicao }
      else
        format.html { render action: "new" }
        format.json { render json: @proposicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proposicaos/1
  # PUT /proposicaos/1.json
  def update
    @proposicao = Proposicao.find(params[:id])

    respond_to do |format|
      if @proposicao.update_attributes(params[:proposicao])
        format.html { redirect_to @proposicao, notice: 'Proposicao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proposicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposicaos/1
  # DELETE /proposicaos/1.json
  def destroy
    @proposicao = Proposicao.find(params[:id])
    @proposicao.destroy

    respond_to do |format|
      format.html { redirect_to proposicaos_url }
      format.json { head :no_content }
    end
  end
end
