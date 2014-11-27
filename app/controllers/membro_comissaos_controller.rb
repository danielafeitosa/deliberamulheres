class MembroComissaosController < ApplicationController
  # GET /membro_comissaos
  # GET /membro_comissaos.json
  def index
    @membro_comissaos = MembroComissao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @membro_comissaos }
    end
  end

  # GET /membro_comissaos/1
  # GET /membro_comissaos/1.json
  def show
    @membro_comissao = MembroComissao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membro_comissao }
    end
  end

  # GET /membro_comissaos/new
  # GET /membro_comissaos/new.json
  def new
    @membro_comissao = MembroComissao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membro_comissao }
    end
  end

  # GET /membro_comissaos/1/edit
  def edit
    @membro_comissao = MembroComissao.find(params[:id])
  end

  # POST /membro_comissaos
  # POST /membro_comissaos.json
  def create
    @membro_comissao = MembroComissao.new(params[:membro_comissao])

    respond_to do |format|
      if @membro_comissao.save
        format.html { redirect_to @membro_comissao, notice: 'Membro comissao was successfully created.' }
        format.json { render json: @membro_comissao, status: :created, location: @membro_comissao }
      else
        format.html { render action: "new" }
        format.json { render json: @membro_comissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /membro_comissaos/1
  # PUT /membro_comissaos/1.json
  def update
    @membro_comissao = MembroComissao.find(params[:id])

    respond_to do |format|
      if @membro_comissao.update_attributes(params[:membro_comissao])
        format.html { redirect_to @membro_comissao, notice: 'Membro comissao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membro_comissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membro_comissaos/1
  # DELETE /membro_comissaos/1.json
  def destroy
    @membro_comissao = MembroComissao.find(params[:id])
    @membro_comissao.destroy

    respond_to do |format|
      format.html { redirect_to membro_comissaos_url }
      format.json { head :no_content }
    end
  end
end
