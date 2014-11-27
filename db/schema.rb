# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141126165823) do

  create_table "deputados", :force => true do |t|
    t.integer  "ide_cadastro"
    t.string   "status"
    t.integer  "matricula"
    t.integer  "id_parlamentar"
    t.string   "nome"
    t.string   "nome_parlamentar"
    t.string   "url_foto"
    t.string   "foto"
    t.string   "sexo"
    t.string   "uf"
    t.integer  "partido_id"
    t.string   "gabinete"
    t.string   "anexo"
    t.string   "fone"
    t.string   "email"
    t.integer  "num_legislatura"
    t.string   "nome_profissao"
    t.date     "data_nascimento"
    t.date     "data_falecimento"
    t.string   "uf_representacao_atual"
    t.string   "situacao_legislatura_atual"
    t.integer  "id_parlamentar_deprecated"
    t.string   "nome_parlamentar_atual"
    t.string   "nome_civil"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "deputados", ["partido_id"], :name => "index_deputados_on_partido_id"

  create_table "events", :force => true do |t|
    t.string   "category"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "goals", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "membro_comissaos", :force => true do |t|
    t.integer  "comissao_id"
    t.integer  "deputado_id"
    t.string   "condicao_membro"
    t.date     "data_entrada"
    t.date     "data_saida"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "membro_comissaos", ["comissao_id"], :name => "index_membro_comissaos_on_comissao_id"
  add_index "membro_comissaos", ["deputado_id"], :name => "index_membro_comissaos_on_deputado_id"

  create_table "orgaos", :force => true do |t|
    t.string   "name"
    t.string   "sigla"
    t.integer  "id_tipo_orgao"
    t.integer  "id_orgao_legislativo"
    t.text     "descricao"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "partidos", :force => true do |t|
    t.string   "name"
    t.string   "sigla"
    t.string   "id_partido"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "periodo_exercicios", :force => true do |t|
    t.integer  "deputado_id"
    t.string   "sigla_uf_representacao"
    t.string   "situacao_exercicio"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.integer  "id_causa_fim_exercicio"
    t.text     "descricao_causa_fim_exercicio"
    t.integer  "id_cadastro_parlamentar_anterior"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "periodo_exercicios", ["deputado_id"], :name => "index_periodo_exercicios_on_deputado_id"

  create_table "proposicaos", :force => true do |t|
    t.integer  "reuniao_id"
    t.string   "sigla"
    t.integer  "id_proposicao"
    t.text     "ementa"
    t.text     "resultado"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "proposicaos", ["reuniao_id"], :name => "index_proposicaos_on_reuniao_id"

  create_table "reuniao_pauta", :force => true do |t|
    t.integer  "orgao_id"
    t.integer  "cod_reuniao"
    t.date     "data"
    t.string   "horario"
    t.string   "local"
    t.string   "estado"
    t.string   "tipo"
    t.string   "titulo_reuniao"
    t.text     "objeto"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "reuniao_pauta", ["orgao_id"], :name => "index_reuniao_pauta_on_orgao_id"

end
