class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def dados
    respond_to do |format|
      format.html # dados.html.erb
    end
  end

  def doc
    respond_to do |format|
      format.html # doc.html.erb
    end
  end

  def notas
    respond_to do |format|
      format.html # notas.html.erb
    end
  end

end
