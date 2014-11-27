#!/usr/bin/env ruby

#   Deliberatório Web - Script para gerar os dados para carta do jogo na web
#   Copyright (C) 2013 Valessio Brito <contato@valessiobrito.com.br>
#                      Daniel Costa Bucher <daniel.bucher88@gmail.com>
#
#   Este arquivo é parte do programa Deliberatório. O Deliberatório é um
#   software livre; você pode redistribuí-lo e/ou modificá-lo dentro dos termos
#   da GNU General Public License como publicada pela Fundação do Software Livre
#   (FSF); na versão 3 da Licença. Este programa é distribuído na esperança que
#   possa ser útil, mas SEM NENHUMA GARANTIA; sem uma garantia implícita de
#   ADEQUAÇÃO a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a licença para
#   maiores detalhes. Você deve ter recebido uma cópia da GNU General Public License,
#   sob o título "LICENCA.txt", junto com este programa, se não, acesse
#   http://www.gnu.org/licenses/
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

require File.dirname(__FILE__) + '/../config/environment'
require 'nokogiri'
require 'open-uri'

# tmp directory
TMP_PATH = Rails.root.join('data')
PAUTAS_BY_ORGAO_PATH = TMP_PATH.join('orgaos')

def get_deputados_xml
  'http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados'
end

def get_orgaos_xml
  'http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterOrgaos'
end

# Capturando detalhe do deputado no orgão
def get_detalhe_deputado_orgao(ide_cadastro)
  "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDetalhesDeputado?ideCadastro=#{ide_cadastro}&numLegislatura="
end

def get_all_pautas_xml(data_ini = '', data_fim = '')
  data_ini ||= '20/10/2013'
  data_fim ||= '31/10/2013'

  Orgao.all.each do |orgao|
    orgao_id = orgao.id_orgao_legislativo
    url = get_pauta_xml_from(orgao_id, data_ini, data_fim)
    system("wget -P #{PAUTAS_BY_ORGAO_PATH} #{url} > #{orgao_id}.xml")
  end
end

def get_pauta_xml_from(orgao_id, data_ini = '', data_fim = '')
  data_ini ||= '20/10/2013'
  data_fim ||= '31/10/2013'
"http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterPauta?IDOrgao=#{orgao_id}&datIni=#{data_ini}&datFim=#{data_fim}"
end

def load_deputados
  deputados_xml = Nokogiri::XML(open(Rails.root.join('data', 'ObterDeputados')))
  deputados_xml.xpath('//deputados/deputado').each do |link|
    partido = Partido.where(:sigla => link.at_xpath('partido').text).first_or_create

    deputado = Deputado.new(
      :ide_cadastro => link.at_xpath('ideCadastro').text,
      :status => link.at_xpath('condicao').text,
      :matricula => link.at_xpath('matricula').text,
      :id_parlamentar => link.at_xpath('idParlamentar').text,
      :nome => link.at_xpath('nome').text,
      :nome_parlamentar => link.at_xpath('nomeParlamentar').text,
      :url_foto => link.at_xpath('urlFoto').text,
      :sexo => link.at_xpath('sexo').text,
      :uf => link.at_xpath('uf').text,
      :partido => partido,
      :gabinete => link.at_xpath('gabinete').text,
      :anexo => link.at_xpath('anexo').text,
      :fone => link.at_xpath('fone').text,
      :email => link.at_xpath('email').text
    )

    deputado.save
    print '.'
  end
  puts
end

def load_orgaos
  orgaos_xml = Nokogiri::XML(open(Rails.root.join('data', 'ObterOrgaos')))
  orgaos_xml.xpath('//orgaos/orgao').each do |link|
    orgao = Orgao.new(
      :name => link['sigla'].strip,
      :sigla => link['sigla'].strip,
      :id_tipo_orgao => link['idTipodeOrgao'],
      :id_orgao_legislativo => link['id'],
      :descricao => link['descricao']
    )

    orgao.save
    print '.'
  end
  puts
end

def load_pautas
  Orgao.all.each do |orgao|
    file_path = Rails.root.join('data', 'orgaos',
"#{orgao.id_orgao_legislativo}.xml")
    orgao_xml = Nokogiri::XML(open(file_path))
  end
end

#%w[get_deputados_xml get_orgaos_xml].each do |m|
#  url = send(m)
#  system("wget -P #{TMP_PATH} #{url}")
#end

#get_all_pautas_xml

load_deputados
load_orgaos
#load_pautas

####################################################
#class CamaraService
#  attr_accessor :deputados, :orgaos, :pautas
#  
#  def obter_deputados 
#    @deputados = []
#    deputados_xml = Nokogiri::XML(open('http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados'))
#
#    deputados_xml.xpath('//deputados/deputado/nomeParlamentar').each do |link|
#      deputado =  Deputado.new
#      deputado.nome =  link.to_s.gsub(/<nomeParlamentar>/, '').gsub(/<\/nomeParlamentar>/, '')
#      @deputados << deputado
#    end
#
#    i = 0
#    deputados_xml.xpath('//deputados/deputado/partido').each do |link|
#      @deputados[i].partido =  link.to_s.gsub(/<partido>/, '').gsub(/<\/partido>/, '')
#      i+=1
#    end
#
#    i = 0
#    deputados_xml.xpath('//deputados/deputado/uf').each do |link|
#      @deputados[i].uf =  link.to_s.gsub(/<uf>/, '').gsub(/<\/uf>/, '')
#      i+=1
#    end
#
#    i = 0
#    deputados_xml.xpath('//deputados/deputado/urlFoto').each do |link|
#      deputados[i].url_foto =  link.to_s.gsub(/<urlFoto>/, '').gsub(/<\/urlFoto>/, '').gsub(/http:\/\/www.camara.gov.br\/internet\/deputado\/bandep\//, '')
#      i+=1
#    end
#
#    @deputados.each do |deputado|
#      deputado.print
#    end
#    puts ''
#  end # end of obter_deputados
#  
#  def obter_orgaos 
#    @orgaos = []
#    orgaos_xml = Nokogiri::XML(open('http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterOrgaos'))
#    
#    orgaos_xml.xpath('//orgaos/orgao/@sigla').each do |link|
#      orgao =  Orgao.new
#      orgao.sigla =  link
#      @orgaos << orgao
#    end
#    
#    i = 0
#    orgaos_xml.xpath('//orgaos/orgao/@descricao').each do |link|
#      @orgaos[i].descricao = link
#      i+=1
#    end
#    
#    i = 0
#    orgaos_xml.xpath('//orgaos/orgao/@id').each do |link|
#      @orgaos[i].id = link
#      i+=1
#    end
#    
#    @orgaos.each do |orgao|
#      orgao.print
#    end
#  end # end of obter_orgaos
#  
#  def obter_pautas(orgaos) 
#    @pautas = []
#        
#    orgaos.each do |orgao|
#      ## colocar logica aqui
#      pautas_xml = Nokogiri::XML(open("http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterPauta?IDOrgao=#{orgao.id}&datIni=20/10/2013&datFim=31/10/2013"))
#      
#      pautas_xml.xpath('//pauta/reuniao/proposicoes/proposicao/sigla').each do |link|
#        pauta =  Pauta.new
#        pauta.sigla = link.to_s.gsub(/<sigla>/, '').gsub(/<\/sigla>/, '')
#        @pautas << pauta
#      end
#    
#      i = 0
#      pautas_xml.xpath('//pauta/reuniao/proposicoes/proposicao/ementa').each do |link|
#        @pautas[i].ementa = link.to_s.gsub(/<ementa>/, '').gsub(/<\/ementa>/, '')
#        i+=1
#      end 
#       
#      @pautas.each do |pauta|
#        pauta.print
#      end
#      
#    end # end each orgaos
#    
#    
#  end # end of obter_pautas
#  
#  
#end
#
#service = CamaraService.new
#service.obter_deputados
#puts ''
#service.obter_orgaos
#puts ''
#service.obter_pautas(service.orgaos)
#
