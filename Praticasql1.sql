--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name:  inventarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public." inventarios" (
    idinventario smallint NOT NULL,
    produtoid character(12) NOT NULL,
    funcionarioid smallint NOT NULL,
    dtinventario date NOT NULL,
    qtestoque real NOT NULL,
    txlocal character varying(250),
    dtcadinventario date NOT NULL
);


ALTER TABLE public." inventarios" OWNER TO postgres;

--
-- Name: TABLE " inventarios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public." inventarios" IS 'Cadastro com o levantamento de itens de estoque feitos pelos funcionários.';


--
-- Name: COLUMN " inventarios".idinventario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".idinventario IS 'PK da Tabela [pkinventario]=(idinventario). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN " inventarios".produtoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".produtoid IS 'Parte da CC [uk1inventario]=(produtoid,funcionarioid,dtinventario) e FK [fk1inventario]=(produtoid) apontando para a tabela Produtos.
';


--
-- Name: COLUMN " inventarios".funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".funcionarioid IS 'Parte da CC [uk1inventario]=(produtoid,funcionarioid,dtinventario) e FK [fk2inventario]=(funcionarioid) apontando para a tabela Funcionários.
';


--
-- Name: COLUMN " inventarios".dtinventario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".dtinventario IS 'Parte da CC [uk1inventario]=(produtoid,funcionarioid,dtinventario) é a Data de realização do inventário de estoque.
';


--
-- Name: COLUMN " inventarios".qtestoque; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".qtestoque IS 'Quantidade contabilizada do item de produto.
';


--
-- Name: COLUMN " inventarios".txlocal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".txlocal IS 'Local de realização do Inventário
';


--
-- Name: COLUMN " inventarios".dtcadinventario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public." inventarios".dtcadinventario IS 'Data de geração do registro.
';


--
-- Name: agencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agencias (
    bancoid character(3) NOT NULL,
    idagencia character(6) NOT NULL,
    txnomeagencia character varying(250) NOT NULL,
    logradouroid integer,
    txcomplemento character varying(25),
    nucep character(8) DEFAULT NULL::bpchar,
    dtcadagencia date
);


ALTER TABLE public.agencias OWNER TO postgres;

--
-- Name: TABLE agencias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.agencias IS 'Cadastro das agências bancárias onde os funcionários podem ter uma conta.';


--
-- Name: COLUMN agencias.bancoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.bancoid IS 'Parte da PK [pkagencia]=(bancoid,idagencia) (composta) FK [fk1agencia]=(bancoid) apontando para a tabela bancos. Pode conter letras e números.
';


--
-- Name: COLUMN agencias.idagencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.idagencia IS 'Parte da PK [pkagencia]=(bancoid,idagencia) (composta). Pode conter letras e números.
';


--
-- Name: COLUMN agencias.txnomeagencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.txnomeagencia IS 'Nome da Agência (sem abreviações).
';


--
-- Name: COLUMN agencias.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.logradouroid IS 'ce para a tabela logradouros da cidade onde se localiza a agência bancária.';


--
-- Name: COLUMN agencias.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.).';


--
-- Name: COLUMN agencias.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.nucep IS 'Número do CEP (somente números)';


--
-- Name: COLUMN agencias.dtcadagencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agencias.dtcadagencia IS 'Data de geração do registro.';


--
-- Name: agenciastels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agenciastels (
    idagenciatel integer NOT NULL,
    bancoid character(3) NOT NULL,
    agenciaid character(6) NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadagenciatel date
);


ALTER TABLE public.agenciastels OWNER TO postgres;

--
-- Name: TABLE agenciastels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.agenciastels IS 'Registro dos telefones de cada autor de publicação.';


--
-- Name: COLUMN agenciastels.idagenciatel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agenciastels.idagenciatel IS 'cp da tabela. Número inteiro sequencial crescente de 1 em 1.';


--
-- Name: COLUMN agenciastels.bancoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agenciastels.bancoid IS 'ce (composta) para a tabela agencias.';


--
-- Name: COLUMN agenciastels.agenciaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agenciastels.agenciaid IS 'ce (composta) para a tabela agencias.';


--
-- Name: COLUMN agenciastels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agenciastels.tipotelefoneid IS 'ce para a tabela telefonestipos';


--
-- Name: COLUMN agenciastels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agenciastels.nutelefone IS 'Data de geração do registro.';


--
-- Name: COLUMN agenciastels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agenciastels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: aplicacoesdascontas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aplicacoesdascontas (
    idnuaplicacaodaconta integer NOT NULL,
    aplicacaofinanceiraid integer NOT NULL,
    bancoid character(3) NOT NULL,
    agenciaid character(6) NOT NULL,
    nucontaid character(6) NOT NULL,
    vltaxaaplicacaoconta double precision NOT NULL,
    vlsaldo real NOT NULL,
    dtlancamentoinicial date NOT NULL,
    dtcadaplicconta date NOT NULL
);


ALTER TABLE public.aplicacoesdascontas OWNER TO postgres;

--
-- Name: TABLE aplicacoesdascontas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.aplicacoesdascontas IS 'Registro das aplicações financeiras de cada conta de funcionarios. É o desmembramento de um relacionamento N:M. Tem uma Chave candidata composta.
';


--
-- Name: COLUMN aplicacoesdascontas.idnuaplicacaodaconta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.idnuaplicacaodaconta IS 'PK da Tabela [pkaplicacaodaconta]=(idnuaplicacaodaconta). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN aplicacoesdascontas.aplicacaofinanceiraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.aplicacaofinanceiraid IS 'FK [fk1aplicacaodaconta]=(aplicacaofinanceiraid) para a tabela aplicacoesfinanceiras.
';


--
-- Name: COLUMN aplicacoesdascontas.bancoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.bancoid IS 'FK [fk2aplicacaodaconta]=(bancoid,agenciaid,contaid) (composta) apontando para a tabela contas - pode ter letras.
';


--
-- Name: COLUMN aplicacoesdascontas.agenciaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.agenciaid IS 'FK [fk2aplicacaodaconta]=(bancoid,agenciaid,contaid) (composta) apontando para a tabela contas - pode ter letras).
';


--
-- Name: COLUMN aplicacoesdascontas.nucontaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.nucontaid IS 'FK [fk2aplicacaodaconta]=(bancoid,agenciaid,contaid) (composta) apontando para a tabela contas - pode ter letras).
';


--
-- Name: COLUMN aplicacoesdascontas.vltaxaaplicacaoconta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.vltaxaaplicacaoconta IS 'Valor da Taxa de Retorno da Aplicação na conta.
';


--
-- Name: COLUMN aplicacoesdascontas.vlsaldo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.vlsaldo IS 'Valor da Aplicação da conta.
';


--
-- Name: COLUMN aplicacoesdascontas.dtlancamentoinicial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.dtlancamentoinicial IS 'Data de lançamento inicial de valor na aplicação financeira da conta.
';


--
-- Name: COLUMN aplicacoesdascontas.dtcadaplicconta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesdascontas.dtcadaplicconta IS 'Data de geração do registro.
';


--
-- Name: aplicacoesfinanceiras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aplicacoesfinanceiras (
    idaplicfin smallint NOT NULL,
    txnomeaplicacao character varying(250) NOT NULL,
    txregrasdaaplicacao text,
    vlmintaxaderetorno double precision,
    vlmaxtaxaderetorno double precision,
    dtcadaplicfin date
);


ALTER TABLE public.aplicacoesfinanceiras OWNER TO postgres;

--
-- Name: TABLE aplicacoesfinanceiras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.aplicacoesfinanceiras IS 'Cadastro de aplicações financeiras que podem ser feitas para as contas de funcionarios.';


--
-- Name: COLUMN aplicacoesfinanceiras.idaplicfin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesfinanceiras.idaplicfin IS 'PK da Tabela [pkaplicacaofinanceira]=(idaplicfin). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN aplicacoesfinanceiras.txnomeaplicacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesfinanceiras.txnomeaplicacao IS 'Nome da aplicação financeira';


--
-- Name: COLUMN aplicacoesfinanceiras.txregrasdaaplicacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesfinanceiras.txregrasdaaplicacao IS 'Descrição detalhada das regras de como fazer a aplicação financeira: saldo inicial, datas limites e formas de recuperação.';


--
-- Name: COLUMN aplicacoesfinanceiras.vlmintaxaderetorno; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesfinanceiras.vlmintaxaderetorno IS 'Valor mínimo da Taxa de Retorno da Aplicação Financeira.';


--
-- Name: COLUMN aplicacoesfinanceiras.vlmaxtaxaderetorno; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesfinanceiras.vlmaxtaxaderetorno IS 'Valor máximo da Taxa de Retorno da Aplicação Financeira.';


--
-- Name: COLUMN aplicacoesfinanceiras.dtcadaplicfin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.aplicacoesfinanceiras.dtcadaplicfin IS 'Data de geração do registro';


--
-- Name: areasdeestudo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areasdeestudo (
    idareadeestudo integer NOT NULL,
    txnomearea character varying(250) NOT NULL,
    txdescricaoarea text,
    dtcadareaestudo date NOT NULL
);


ALTER TABLE public.areasdeestudo OWNER TO postgres;

--
-- Name: TABLE areasdeestudo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.areasdeestudo IS 'Cadastro das áreas de estudo de interesse geral, tais como EXATAS, HUMANAS, etc., e suas subdivisões.';


--
-- Name: COLUMN areasdeestudo.idareadeestudo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudo.idareadeestudo IS 'PK da Tabela [pkareadeestudo]=(idareadeestudo). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN areasdeestudo.txnomearea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudo.txnomearea IS 'Nome da area de estudo (ou área de conhecimento).';


--
-- Name: COLUMN areasdeestudo.txdescricaoarea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudo.txdescricaoarea IS 'Descrição detalhada de uma Área de Estudo (ou área de conhecimento).';


--
-- Name: COLUMN areasdeestudo.dtcadareaestudo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudo.dtcadareaestudo IS 'Data de geração do registro.';


--
-- Name: areasdeestudocursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areasdeestudocursos (
    idareaestcurso integer NOT NULL,
    cursoid integer NOT NULL,
    areadeestudoid integer NOT NULL,
    dtcadareaestcurso date NOT NULL
);


ALTER TABLE public.areasdeestudocursos OWNER TO postgres;

--
-- Name: TABLE areasdeestudocursos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.areasdeestudocursos IS 'Registro das áreas de estudos de cada curso. É o desmembramento de um relacionamento N:M.';


--
-- Name: COLUMN areasdeestudocursos.idareaestcurso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudocursos.idareaestcurso IS 'PK da Tabela [pkareadeestudocurso]=(idareaestcurso). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN areasdeestudocursos.cursoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudocursos.cursoid IS 'Parte da CC [uk1areadeestudocurso]=(areadeestudoid,cursoid), FK [fk1areadeestudocurso]=(cursoid) apontando para a tabela Cursos.
';


--
-- Name: COLUMN areasdeestudocursos.areadeestudoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudocursos.areadeestudoid IS 'Parte da CC [uk1areadeestudocurso]=(areadeestudoid,cursoid), FK [fk2areadeestudocurso]=(areadeestudoid) apontando para a tabela Áreas de Estudos (areaestudos).
';


--
-- Name: COLUMN areasdeestudocursos.dtcadareaestcurso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudocursos.dtcadareaestcurso IS 'Data de geração do registro.';


--
-- Name: areasdeestudodisciplinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areasdeestudodisciplinas (
    idareaestdisciplina integer NOT NULL,
    disciplinaid integer NOT NULL,
    areadeestudoid integer NOT NULL,
    dtcadareaestdisc date NOT NULL
);


ALTER TABLE public.areasdeestudodisciplinas OWNER TO postgres;

--
-- Name: TABLE areasdeestudodisciplinas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.areasdeestudodisciplinas IS 'Registro das áreas de estudo de cada disciplina de curso. É o desmembramento de um relacionamento N:M.
';


--
-- Name: COLUMN areasdeestudodisciplinas.idareaestdisciplina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudodisciplinas.idareaestdisciplina IS 'PK da Tabela [pkareadeestudodisciplina]=(idareaestdisciplina). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN areasdeestudodisciplinas.disciplinaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudodisciplinas.disciplinaid IS 'Parte da CC [uk1areadeestudodisciplina]=(areadeestudoid,disciplinaid), FK [fk1areadeestudodisciplina]=(disciplinaid) apontando para a Tabela Disciplinas.
';


--
-- Name: COLUMN areasdeestudodisciplinas.areadeestudoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudodisciplinas.areadeestudoid IS 'Parte da CC [uk1areadeestudodisciplina]=(areadeestudoid,disciplinaid), FK [fk2areadeestudodisciplina]=(areadeestudoid) apontando para a tabela Áreas de Estudos (areaestudos).
';


--
-- Name: COLUMN areasdeestudodisciplinas.dtcadareaestdisc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudodisciplinas.dtcadareaestdisc IS 'Data de geração do registro.';


--
-- Name: areasdeestudolivros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areasdeestudolivros (
    idareaestlivro integer NOT NULL,
    livroid integer NOT NULL,
    areadeestudoid integer NOT NULL,
    nugrauinfluencia numeric DEFAULT NULL::numeric,
    dtcadareaestlivro date NOT NULL
);


ALTER TABLE public.areasdeestudolivros OWNER TO postgres;

--
-- Name: TABLE areasdeestudolivros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.areasdeestudolivros IS 'Registro das áreas de estudos de cada livro. É o desmembramento de um relacionamento N:M.';


--
-- Name: COLUMN areasdeestudolivros.idareaestlivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudolivros.idareaestlivro IS 'PK da Tabela [pkareadeestudolivro]=(idareaestlivro). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN areasdeestudolivros.livroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudolivros.livroid IS 'Parte da CC [uk1areadeestudolivro]=(areadeestudoid,livroid), FK [fk1areadeestudolivro]=(livroid) apontando para a tabela livros.';


--
-- Name: COLUMN areasdeestudolivros.areadeestudoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudolivros.areadeestudoid IS 'Parte da CC [uk1areadeestudolivro]=(areadeestudoid,livroid), FK [fk2areadeestudolivro]=(areadeestudoid) apontando para tabela Áreas de Estudos (areaestudos).';


--
-- Name: COLUMN areasdeestudolivros.nugrauinfluencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudolivros.nugrauinfluencia IS 'Percentagem de cobertura da Área de Estudo no livro (num. inteiro)';


--
-- Name: COLUMN areasdeestudolivros.dtcadareaestlivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.areasdeestudolivros.dtcadareaestlivro IS 'Data de geração do registro.';


--
-- Name: armazens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armazens (
    idarmazem smallint NOT NULL,
    txnomearmazem character varying(50) NOT NULL,
    txdescricaogeral character varying(500),
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(50) DEFAULT NULL::character varying,
    clienteid integer NOT NULL,
    nutelefone character(12) DEFAULT NULL::bpchar,
    nucep character(8) DEFAULT NULL::bpchar,
    qtarea double precision NOT NULL,
    dtcadarmazem date NOT NULL
);


ALTER TABLE public.armazens OWNER TO postgres;

--
-- Name: TABLE armazens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.armazens IS 'Cadastro dos Armazens dos clientes para onde as vendas registradas por um funcionario podem ser entregues.';


--
-- Name: COLUMN armazens.idarmazem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.idarmazem IS 'Pk da Tabela [pkarmazem]=(idarmazem). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN armazens.txnomearmazem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.txnomearmazem IS 'Nome curto ou usual do Armazem. Como ele é identificado informalmente.';


--
-- Name: COLUMN armazens.txdescricaogeral; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.txdescricaogeral IS 'Texto com descrição completa do armazém (capacidade, pé direito médio, etc.).';


--
-- Name: COLUMN armazens.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.logradouroid IS 'FK [fk1armazem]=(logradouroid) apontando para a visão logrcompleto onde está o armazém.';


--
-- Name: COLUMN armazens.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.txcomplemento IS 'Texto com o complemento do logradouro da agência bancária (número, andar, etc.)';


--
-- Name: COLUMN armazens.clienteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.clienteid IS 'FK [fk2armazem]=(clienteid) apontando para a tabela cliente que é dono ou aluga o armazém.';


--
-- Name: COLUMN armazens.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.nutelefone IS 'Número de telefone. Formato OP-DD-TTTT-RRRR, sem o ZERO no início, só numeros.';


--
-- Name: COLUMN armazens.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN armazens.qtarea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.qtarea IS 'Número inteiro indicando a área total.';


--
-- Name: COLUMN armazens.dtcadarmazem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazens.dtcadarmazem IS 'Data de geração do registro.';


--
-- Name: armazenstels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armazenstels (
    idarmazemtel integer NOT NULL,
    armazemid smallint NOT NULL,
    tipotelefoneid smallint,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadarmazemtel date
);


ALTER TABLE public.armazenstels OWNER TO postgres;

--
-- Name: TABLE armazenstels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.armazenstels IS 'Cadastro com os números e tipos de telefones dos armazens dos clientes';


--
-- Name: COLUMN armazenstels.idarmazemtel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazenstels.idarmazemtel IS 'PK da Tabela [pkarmazemtel]=(idarmazemtel). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN armazenstels.armazemid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazenstels.armazemid IS 'FK [fk1armazemtel]=(armazemid) para a tabela armazens.
';


--
-- Name: COLUMN armazenstels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazenstels.tipotelefoneid IS 'FK [fk2armazemtel]=(tipotelefoneid) para a tabela telefonestipos
';


--
-- Name: COLUMN armazenstels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazenstels.nutelefone IS 'Número do telefone referente ao tipo na agência.
';


--
-- Name: COLUMN armazenstels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazenstels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.
';


--
-- Name: COLUMN armazenstels.dtcadarmazemtel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.armazenstels.dtcadarmazemtel IS 'Data de geração do registro.
';


--
-- Name: atividades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atividades (
    idatividade integer NOT NULL,
    txnomeatividade character varying(50) NOT NULL,
    txdescricaoativ character varying(500) NOT NULL,
    dtcadatividade date NOT NULL
);


ALTER TABLE public.atividades OWNER TO postgres;

--
-- Name: TABLE atividades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.atividades IS 'Cadastro com as atividades profissionais desempenhadas por um funcionário.';


--
-- Name: COLUMN atividades.idatividade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atividades.idatividade IS 'PK da Tabela [pkatividade]=(idatividade). Número inteiro sequencial crescente de 1 em 1.';


--
-- Name: COLUMN atividades.txnomeatividade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atividades.txnomeatividade IS 'Nome curto ou usual.';


--
-- Name: COLUMN atividades.txdescricaoativ; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atividades.txdescricaoativ IS 'Descrição detalhada e completa de uma atividade profissional.';


--
-- Name: COLUMN atividades.dtcadatividade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atividades.dtcadatividade IS 'Data de Geração do Registro';


--
-- Name: atribuicoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atribuicoes (
    idatribuicao integer NOT NULL,
    professorid smallint NOT NULL,
    disciplinaid integer NOT NULL,
    qthorasatribuidas numeric(5,0) NOT NULL,
    dtatribuicao date NOT NULL,
    dtcadatribuicao date
);


ALTER TABLE public.atribuicoes OWNER TO postgres;

--
-- Name: TABLE atribuicoes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.atribuicoes IS 'Registro dos Professores de cada uma da Disciplinas. É o desmembramento do relacionamento N:M. Tem a CC composta.';


--
-- Name: COLUMN atribuicoes.idatribuicao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atribuicoes.idatribuicao IS 'PK da tabela [pkatribuicao]=(idatribuicao).';


--
-- Name: COLUMN atribuicoes.professorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atribuicoes.professorid IS 'Parte da CC [uk1atribuicao]=(professorid,disciplinaid), FK [fk1atribuicao]=(professorid) apontando para a tabela professores.';


--
-- Name: COLUMN atribuicoes.disciplinaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atribuicoes.disciplinaid IS 'Parte da CC [uk1atribuicao]=(professorid,disciplinaid), FK [fk2atribuicao]=(disciplinaid) apontando para a tabela disciplinas.';


--
-- Name: COLUMN atribuicoes.qthorasatribuidas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atribuicoes.qthorasatribuidas IS 'Quantidade de horas de uma disciplina atribuídas ao professor para a disciplina';


--
-- Name: COLUMN atribuicoes.dtatribuicao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atribuicoes.dtatribuicao IS 'Data de atribuição da disciplina ao professor';


--
-- Name: COLUMN atribuicoes.dtcadatribuicao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atribuicoes.dtcadatribuicao IS 'Data de geração do registro.';


--
-- Name: atuacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atuacoes (
    idatuacao smallint NOT NULL,
    tarefaprojetoid integer NOT NULL,
    funcionarioid smallint NOT NULL,
    dtinicio date DEFAULT '2014-04-25'::date NOT NULL,
    dttermino date,
    qttempoduracao numeric NOT NULL,
    dtcadatuacao date NOT NULL
);


ALTER TABLE public.atuacoes OWNER TO postgres;

--
-- Name: TABLE atuacoes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.atuacoes IS 'Registro das atuações profissionais dos funcionários nos projetos. É um desmembramento de um N:M e tem uma CCK composta.';


--
-- Name: COLUMN atuacoes.idatuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.idatuacao IS 'PK da tabela [pkatuacao]=(idatuacao). Número inteiro sequencial crescente de 1 em 1.';


--
-- Name: COLUMN atuacoes.tarefaprojetoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.tarefaprojetoid IS 'Parte da CC [uk1atuacao]=(tarefaprojetoid,funcionarioid,dtinicio), FK [fk1atuacao]=(tarefaprojetoid) para a tabela tarefasprojetos.';


--
-- Name: COLUMN atuacoes.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.funcionarioid IS 'Parte da CC [uk1atuacao]=(tarefaprojetoid,funcionarioid,dtinicio), FK [fk2atuacao]=(funcionarioid) apontando para tabela funcionários.';


--
-- Name: COLUMN atuacoes.dtinicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.dtinicio IS 'Parte da CC [uk1atuacao]=(tarefaprojetoid,funcionarioid,dtinicio), é a Data de início de atuação do Funcionário em uma tarefa de um projeto.';


--
-- Name: COLUMN atuacoes.dttermino; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.dttermino IS 'Data de término de atuação do funcionário em uma tarefa de um projeto.';


--
-- Name: COLUMN atuacoes.qttempoduracao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.qttempoduracao IS 'Quantidade de horas de participação do funcionário em uma tarefa de um projeto.';


--
-- Name: COLUMN atuacoes.dtcadatuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.atuacoes.dtcadatuacao IS 'Data de geração do registro.';


--
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    idautor integer NOT NULL,
    txnomeautor character(90) NOT NULL,
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) NOT NULL,
    dtnascimento date NOT NULL,
    dtcadautor date NOT NULL
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- Name: TABLE autores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.autores IS 'Cadastro dos autores de alguma forma de publicação de conhecimento. Na maioria dos casos são autores de livros.';


--
-- Name: COLUMN autores.idautor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.idautor IS 'PK da Tabela [pkautor]=(idautor). Número inteiro sequencial crescente de 1 em 1.';


--
-- Name: COLUMN autores.txnomeautor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.txnomeautor IS 'Nome completo do autor.';


--
-- Name: COLUMN autores.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.logradouroid IS 'FK [fk1autor]=(logradouroid) apontando para a visão logrcompleto onde está residência do autor.';


--
-- Name: COLUMN autores.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.txcomplemento IS 'Texto com o complemento do logradouro de residência do autor (número, andar, etc.)';


--
-- Name: COLUMN autores.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN autores.dtnascimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.dtnascimento IS 'Data de nascimento do autor';


--
-- Name: COLUMN autores.dtcadautor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autores.dtcadautor IS 'Data de geração do registro.';


--
-- Name: autorestels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autorestels (
    idautortel integer NOT NULL,
    autorid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    dtcadautortel date
);


ALTER TABLE public.autorestels OWNER TO postgres;

--
-- Name: TABLE autorestels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.autorestels IS 'Registro dos telefones de cada autor de publicação.';


--
-- Name: COLUMN autorestels.idautortel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorestels.idautortel IS 'PK da Tabela [pkautortel]=(idautortel). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN autorestels.autorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorestels.autorid IS 'FK [fk1autortel]=(autorid) apontando para a tabela autores
';


--
-- Name: COLUMN autorestels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorestels.tipotelefoneid IS 'FK [fk2autortel]=(tipotelefoneid) para a tabela telefonestipos.
';


--
-- Name: COLUMN autorestels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorestels.nutelefone IS 'Número do telefone (com operadora e DDD - somente os números)';


--
-- Name: COLUMN autorestels.dtcadautortel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorestels.dtcadautortel IS 'Data de geração do registro.';


--
-- Name: autorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autorias (
    idautoria integer NOT NULL,
    livroid integer NOT NULL,
    autorid integer NOT NULL,
    dtcadautoria date NOT NULL
);


ALTER TABLE public.autorias OWNER TO postgres;

--
-- Name: TABLE autorias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.autorias IS 'Registro dos autores de um livro. É o desmembramento de um relacionamento N:M. A Chave Primária é composta.';


--
-- Name: COLUMN autorias.idautoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorias.idautoria IS 'PK da Tabela [pkautoria]=(idautoria). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN autorias.livroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorias.livroid IS 'Parte de uma CC composta [uk1autoria]=(livroid,autorid), FK [fk1autoria]=(livroid) apontando para a tabela livros.
';


--
-- Name: COLUMN autorias.autorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorias.autorid IS 'Parte de uma CC composta [uk1autoria]=(livroid,autorid), FK [fk2autoria]=(autorid) apontando para a tabela autores
';


--
-- Name: COLUMN autorias.dtcadautoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.autorias.dtcadautoria IS 'Data de geração do registro.';


--
-- Name: bairros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bairros (
    idbairro integer NOT NULL,
    txnomebairro character varying(120) NOT NULL,
    cidadeid integer NOT NULL,
    dtcadbairro date NOT NULL
);


ALTER TABLE public.bairros OWNER TO postgres;

--
-- Name: TABLE bairros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bairros IS 'Cadastro dos bairros das cidades.';


--
-- Name: COLUMN bairros.idbairro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairros.idbairro IS 'PK da Tabela [pkbairro]=(idbairro). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN bairros.txnomebairro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairros.txnomebairro IS 'Texto com o nome do bairro da cidade.';


--
-- Name: COLUMN bairros.cidadeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairros.cidadeid IS 'FK [fk1bairro]=(cidadeid) apontando para a tabela cidades onde se localiza o bairro.
';


--
-- Name: COLUMN bairros.dtcadbairro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairros.dtcadbairro IS 'Data de geração do registro.
';


--
-- Name: bairroslogradouros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bairroslogradouros (
    "idbairrologradouro	" integer NOT NULL,
    "bairroid	" integer,
    "logradouroid	" integer,
    "dtcadbairrologradouro	" date
);


ALTER TABLE public.bairroslogradouros OWNER TO postgres;

--
-- Name: TABLE bairroslogradouros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bairroslogradouros IS 'Tabela de Ligação entre bairros e logradouros (relacionamento N:M).';


--
-- Name: COLUMN bairroslogradouros."idbairrologradouro	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairroslogradouros."idbairrologradouro	" IS 'PK da Tabela [pkbairrologradouro]=(idbairrologradouro). Número sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN bairroslogradouros."bairroid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairroslogradouros."bairroid	" IS 'FK [fk1bairrologradouro]=(bairroid), apontando para tabela bairros.
';


--
-- Name: COLUMN bairroslogradouros."logradouroid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairroslogradouros."logradouroid	" IS 'FK [fk2bairrologradouro]=(logradouroid), apontando para a visão logrcompleto.
';


--
-- Name: COLUMN bairroslogradouros."dtcadbairrologradouro	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bairroslogradouros."dtcadbairrologradouro	" IS 'Data de geração do registro.
';


--
-- Name: bancos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bancos (
    idbanco character(3) NOT NULL,
    txnomebanco character varying(100) NOT NULL,
    dtfundacao date NOT NULL,
    aocompetencia character(1) NOT NULL,
    logradourosedeid integer,
    txcomplemento character varying(50),
    nucepsede character(8),
    dtcadbanco date NOT NULL,
    nucnpjbanco character(15),
    txsigla character varying(25),
    website character varying(250),
    aosituacao character(1),
    aohistorico character(1),
    qtagencias smallint,
    aocapitalaberto character(1)
);


ALTER TABLE public.bancos OWNER TO postgres;

--
-- Name: TABLE bancos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bancos IS 'Cadastro dos bancos do sistema financeiro onde funcionarios podem ter contas.';


--
-- Name: COLUMN bancos.idbanco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.idbanco IS 'PK da Tabela [pkbanco]=(idbanco). Código do Banco na Federação Brasileira de Bancos.
';


--
-- Name: COLUMN bancos.txnomebanco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.txnomebanco IS 'Nome completo do banco (razão social sem abreviações).';


--
-- Name: COLUMN bancos.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.dtfundacao IS 'Data de fundação do banco.';


--
-- Name: COLUMN bancos.aocompetencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.aocompetencia IS '(F)ederal, (E)stadual, (I)nterestadual, (D)istrital, (P)rivado, (C)ooperativo';


--
-- Name: COLUMN bancos.logradourosedeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.logradourosedeid IS 'FK [fk1banco]=(logradourosedeid) apontando para a visão logrcompleto com o código do logradouro da sede do banco.';


--
-- Name: COLUMN bancos.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.txcomplemento IS 'Número do imóvel, localização referencial (outros imóveis próximos).';


--
-- Name: COLUMN bancos.nucepsede; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.nucepsede IS 'Número do CEP';


--
-- Name: COLUMN bancos.dtcadbanco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.dtcadbanco IS 'Data de geração do registro';


--
-- Name: COLUMN bancos.nucnpjbanco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.nucnpjbanco IS 'Número do CNPJ do Banco.';


--
-- Name: COLUMN bancos.txsigla; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.txsigla IS 'Uma sigla que está associada ao banco.';


--
-- Name: COLUMN bancos.website; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.website IS 'Endereço do WebSite do banco (se houver).';


--
-- Name: COLUMN bancos.aosituacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.aosituacao IS 'Indica se o banco é P-Público, V-Privado, C-Cooperativo, E-Extinto, etc.';


--
-- Name: COLUMN bancos.aohistorico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.aohistorico IS 'Indica se o Banco está: A-Ativo, C-Comprado, F-Fundido, L-Liquidado, etc.';


--
-- Name: COLUMN bancos.qtagencias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.qtagencias IS 'Quantidade de agências do banco (estimativo).';


--
-- Name: COLUMN bancos.aocapitalaberto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bancos.aocapitalaberto IS 'S|N – indicando se banco negocia participação com ações no mercado.
';


--
-- Name: bibliografias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bibliografias (
    idbibliografia integer NOT NULL,
    disciplinaid smallint NOT NULL,
    livroid integer NOT NULL,
    aotipo character(1) NOT NULL,
    dtadocaodolivro date NOT NULL,
    dtcadbibliografia date
);


ALTER TABLE public.bibliografias OWNER TO postgres;

--
-- Name: TABLE bibliografias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.bibliografias IS 'Registro dos livros da bilbiografia das disciplinas de um curso.É o desmembramento de um N:M. Tem a PK composta.
';


--
-- Name: COLUMN bibliografias.idbibliografia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bibliografias.idbibliografia IS 'PK da Tabela [pkbibliografia]=(idbibliografia). Número inteiro sequencial iniciando de 1.
';


--
-- Name: COLUMN bibliografias.disciplinaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bibliografias.disciplinaid IS 'CC [uk1bibliografia]=(disciplinaid,livroid) (composta) e FK [fk1bibliografia]=(disciplinaid) apontando para a tabela disciplinas.
';


--
-- Name: COLUMN bibliografias.livroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bibliografias.livroid IS 'CC [uk1bibliografia]=(disciplinaid,livroid) (composta) e FK [fk2bibliografia]=(livroid) apontando para tabela livros.
';


--
-- Name: COLUMN bibliografias.aotipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bibliografias.aotipo IS 'Letra indicando o tipo de bibliografia (B)ásico ou (C)omplementar
';


--
-- Name: COLUMN bibliografias.dtadocaodolivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bibliografias.dtadocaodolivro IS 'Data que o livro passou a fazer parte da bibliografia da disciplina.';


--
-- Name: COLUMN bibliografias.dtcadbibliografia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.bibliografias.dtcadbibliografia IS 'Data de geração do registro.';


--
-- Name: capacitacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capacitacoes (
    idcapacitacao smallint NOT NULL,
    cursoid smallint NOT NULL,
    funcionarioid smallint NOT NULL,
    dtcapacitacao date NOT NULL,
    dtregistro date NOT NULL,
    dtcadcapacitacao date NOT NULL,
    nucertificado smallint
);


ALTER TABLE public.capacitacoes OWNER TO postgres;

--
-- Name: TABLE capacitacoes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.capacitacoes IS 'Registro dos cursos concluídos pelos funcionários. É o desmembramento do relacionamento N:M. Tem uma cp composta.';


--
-- Name: COLUMN capacitacoes.idcapacitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.idcapacitacao IS 'PK da Tabela [pkcapacitacao]=(idcapacitacao). Número inteiro sequencial iniciando de 1
';


--
-- Name: COLUMN capacitacoes.cursoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.cursoid IS 'CC [uk1capacitacao]=(cursoid,funcionarioid) (composta) e FK [fk1capacitacao]=(cursoid) apontando para a tabela cursos.
';


--
-- Name: COLUMN capacitacoes.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.funcionarioid IS 'CC [uk1capacitacao]=(cursoid,funcionarioid) (composta) e FK [fk2capacitacao]=(funcionarioid) apontando para a tabela funcionário.
';


--
-- Name: COLUMN capacitacoes.dtcapacitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.dtcapacitacao IS 'Data de capacitação do funcionário (quando terminou o curso).
';


--
-- Name: COLUMN capacitacoes.dtregistro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.dtregistro IS 'Data de registro do diploma do funcionário (em órgão público competente).';


--
-- Name: COLUMN capacitacoes.dtcadcapacitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.dtcadcapacitacao IS 'Data de geração do registro.
';


--
-- Name: COLUMN capacitacoes.nucertificado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.capacitacoes.nucertificado IS 'Número do Certificado emitido para o curso concluído.
';


--
-- Name: veiculos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculos (
    idveiculo smallint NOT NULL,
    ukplaca character(7),
    "tipoveiculoid	" smallint NOT NULL,
    modeloid smallint DEFAULT NULL::numeric,
    funcionarioid integer,
    aotipocarro character(1),
    txapelido character varying(60),
    qtcapacidade smallint NOT NULL,
    nuanofabricacao character(4) NOT NULL,
    aocategoria character(1),
    dtcadveiculo date NOT NULL
);


ALTER TABLE public.veiculos OWNER TO postgres;

--
-- Name: TABLE veiculos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.veiculos IS 'Cadastro de Veículos. É uma superentidade com herança para carros e ônibus.';


--
-- Name: COLUMN veiculos.idveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.idveiculo IS 'PK da Tabela [pkveiculo]=(idveiculo).
';


--
-- Name: COLUMN veiculos.ukplaca; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.ukplaca IS 'Chave Candidata [uk1veiculo]=(ukplaca). Placa do veículo (somente letras e números).
';


--
-- Name: COLUMN veiculos."tipoveiculoid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos."tipoveiculoid	" IS 'FK [fk1veiculo]=(tipoveiculoid) para a tabela veiculotipos (Tipos de Veículos).
';


--
-- Name: COLUMN veiculos.modeloid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.modeloid IS 'FK [fk2veiculo]=(modeloid) para a tabela veiculosmodelo (Modelos de Veículos).
';


--
-- Name: COLUMN veiculos.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.funcionarioid IS 'FK [fk3veiculo]=(funcionarioid) para a tabela funcionarios (funcionário proprietário do carro).
';


--
-- Name: COLUMN veiculos.aotipocarro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.aotipocarro IS 'Indica o tipo do veículo do Funcionário (P=Principal e S=Secundário).';


--
-- Name: COLUMN veiculos.txapelido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.txapelido IS 'Nome de apelido do ônibus';


--
-- Name: COLUMN veiculos.qtcapacidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.qtcapacidade IS 'Quantidade de acentos no veículo.';


--
-- Name: COLUMN veiculos.nuanofabricacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.nuanofabricacao IS 'Ano de fabricação do veículo.';


--
-- Name: COLUMN veiculos.aocategoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.aocategoria IS 'C-Carro | O-Ônibus | A-Outro.';


--
-- Name: COLUMN veiculos.dtcadveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculos.dtcadveiculo IS 'Data de Geração do Registro.';


--
-- Name: carros; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.carros AS
 SELECT veiculos.idveiculo AS cpcarro,
    veiculos.ukplaca,
    veiculos.modeloid AS modeloveiculoid,
    veiculos.funcionarioid,
    veiculos.aotipocarro,
    veiculos.qtcapacidade,
    veiculos.nuanofabricacao,
    veiculos.dtcadveiculo AS dtcarro
   FROM public.veiculos
  WHERE (veiculos.aocategoria = 'C'::bpchar);


ALTER VIEW public.carros OWNER TO postgres;

--
-- Name: cidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidades (
    idcidade integer NOT NULL,
    txnomecidade character varying(250) DEFAULT NULL::character varying,
    txformaacesso text,
    qtpopulacao double precision,
    qtarea double precision,
    dtfundacao date,
    dtcadcidade date NOT NULL,
    estadodopaisid character(2)
);


ALTER TABLE public.cidades OWNER TO postgres;

--
-- Name: TABLE cidades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cidades IS 'Cadastro das cidades. A partir delas os bairros e por fim os logradouros.';


--
-- Name: COLUMN cidades.idcidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.idcidade IS 'PK da Tabela [pkcidade]=(idcidade).
';


--
-- Name: COLUMN cidades.txnomecidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.txnomecidade IS 'Nome completo da cidade';


--
-- Name: COLUMN cidades.txformaacesso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.txformaacesso IS 'Descrição das formas de acesso à cidade (hidrovias, estrada, ferrovias, etc).
';


--
-- Name: COLUMN cidades.qtpopulacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.qtpopulacao IS 'População estimada';


--
-- Name: COLUMN cidades.qtarea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.qtarea IS 'Area total municipal.';


--
-- Name: COLUMN cidades.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.dtfundacao IS 'Data de Fundação da Cidade';


--
-- Name: COLUMN cidades.dtcadcidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.dtcadcidade IS 'Data de geração do registro';


--
-- Name: COLUMN cidades.estadodopaisid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cidades.estadodopaisid IS 'FK [fk1cidade]=(estadodopaisid) apontando para tabela estadosdospaises (estados, comarcas ou condados de uma união federativa de estados).
';


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    idcliente integer NOT NULL,
    txnomecliente character varying(250) NOT NULL,
    txrazaosocial character varying(250) DEFAULT NULL::character varying,
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) NOT NULL,
    vllimitecompra double precision NOT NULL,
    aosituacao character(1),
    dtcadcliente date NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: TABLE clientes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.clientes IS 'Cadastro dos Clientes de uma empresa.';


--
-- Name: COLUMN clientes.idcliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.idcliente IS 'PK da Tabela [pkcliente]=(idcliente)
';


--
-- Name: COLUMN clientes.txnomecliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.txnomecliente IS 'Nome usual completo (sem abreviações) do cliente.
';


--
-- Name: COLUMN clientes.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.txrazaosocial IS 'Razão social completa do Cliente.';


--
-- Name: COLUMN clientes.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.logradouroid IS 'FK [fk1cliente]=(logradouroid) apontando para a visão logrcompleto onde está a sede comercial do cliente
';


--
-- Name: COLUMN clientes.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN clientes.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.nucep IS 'Número do CEP (somente números)';


--
-- Name: COLUMN clientes.vllimitecompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.vllimitecompra IS 'Valor limite de compra para o cliente';


--
-- Name: COLUMN clientes.aosituacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.aosituacao IS 'Atributo Operacional indicando a Situação do Cliente (A-Ativo ou B-Bloqueado).';


--
-- Name: COLUMN clientes.dtcadcliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.dtcadcliente IS 'Data de geração do registro.';


--
-- Name: clientestels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientestels (
    idclientetel numeric NOT NULL,
    clienteid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    dtcadclientetel date,
    txnomecontato character varying(50)
);


ALTER TABLE public.clientestels OWNER TO postgres;

--
-- Name: TABLE clientestels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.clientestels IS 'Registros dos telefones de cada cliente.';


--
-- Name: COLUMN clientestels.idclientetel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientestels.idclientetel IS 'PK da Tabela [pkclientetel]=(idclientetel). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN clientestels.clienteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientestels.clienteid IS 'FK [fk1clientetel]=(clienteid) apontando para a tabela Clientes
';


--
-- Name: COLUMN clientestels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientestels.tipotelefoneid IS 'FK [fk2clientetel]=(tipotelefoneid) apontando para a tabela telefonestipos
';


--
-- Name: COLUMN clientestels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientestels.nutelefone IS 'Número do telefone (com operadora, DDD e somente os números)';


--
-- Name: COLUMN clientestels.dtcadclientetel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientestels.dtcadclientetel IS 'Data de geração do registro.
';


--
-- Name: COLUMN clientestels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientestels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
    idconsulta integer NOT NULL,
    funcionarioid smallint,
    medicoid smallint NOT NULL,
    dthoraconsulta timestamp without time zone NOT NULL,
    dthorarealizada timestamp without time zone,
    planodesaudeid integer,
    aosituacaoconsulta character(1) NOT NULL,
    dtcadconsulta date NOT NULL
);


ALTER TABLE public.consultas OWNER TO postgres;

--
-- Name: TABLE consultas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.consultas IS 'Registros das consultas marcadas para os médicos atenderem os funcionarios. As consultas podem ser pagas por planos de saúde dos funcionários.
';


--
-- Name: COLUMN consultas.idconsulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.idconsulta IS 'PK da Tabela [pkconsulta]=(idconsulta). Número inteiro sequencial crescente de 1 em 1.
';


--
-- Name: COLUMN consultas.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.funcionarioid IS 'FK [fk1consulta]=(funcionarioid) apontando para a Tabela funcionarios.
';


--
-- Name: COLUMN consultas.medicoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.medicoid IS 'FK [fk2consulta]=(medicoid) apontando para a tabela medicos.
';


--
-- Name: COLUMN consultas.dthoraconsulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.dthoraconsulta IS 'Data e hora da consulta (programada).';


--
-- Name: COLUMN consultas.dthorarealizada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.dthorarealizada IS 'Data e hora da realização da consulta';


--
-- Name: COLUMN consultas.planodesaudeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.planodesaudeid IS 'FK [fk3consulta]=(planodesaudeid) apontando para a tabela planosdesaude
';


--
-- Name: COLUMN consultas.aosituacaoconsulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.aosituacaoconsulta IS 'Atributo Operacional indicando Agendada, Realizada ou Cancelada';


--
-- Name: COLUMN consultas.dtcadconsulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.consultas.dtcadconsulta IS 'Data de geração do registro';


--
-- Name: contas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contas (
    bancoid character(5) NOT NULL,
    agenciaid character(6) NOT NULL,
    idnuconta character(6) NOT NULL,
    funcionarioid smallint,
    dtcadconta date,
    vlsaldo double precision
);


ALTER TABLE public.contas OWNER TO postgres;

--
-- Name: TABLE contas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.contas IS 'Cadastro das contas bancárias dos funcionarios. A PK desta tabela é composta: bancoid,agenciaid,idnuconta (formam a idconta).';


--
-- Name: COLUMN contas.bancoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contas.bancoid IS 'PK [pkconta]=(bancoid,agenciaid,idnuconta) (composta). FK [fk1conta]=(bancoid,agenciaid) (composta) apontando para a tabela agencias.
';


--
-- Name: COLUMN contas.agenciaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contas.agenciaid IS 'PK [pkconta]=(bancoid,agenciaid,idnuconta) (composta). FK [fk1conta]=(bancoid,agenciaid) (composta) apontando para a tabela agencias.
';


--
-- Name: COLUMN contas.idnuconta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contas.idnuconta IS 'PK [pkconta]=(bancoid,agenciaid,idnuconta) (composta). Sequência que identifica a conta (na agencia do banco), pode conter letras.
';


--
-- Name: COLUMN contas.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contas.funcionarioid IS 'FK [fk2conta]=(funcionarioid) apontando para o Funcionario que é o titular da conta.
';


--
-- Name: COLUMN contas.dtcadconta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contas.dtcadconta IS 'Data de criação do registro.';


--
-- Name: COLUMN contas.vlsaldo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.contas.vlsaldo IS 'Valor do saldo da conta atualizado a cada movimentação de valor.
';


--
-- Name: cores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cores (
    idcor integer NOT NULL,
    txnomecor character varying(250) NOT NULL,
    nupantone integer NOT NULL,
    dtcadcor date NOT NULL
);


ALTER TABLE public.cores OWNER TO postgres;

--
-- Name: TABLE cores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cores IS 'Cadastro de cores pantone usados para veículos.';


--
-- Name: COLUMN cores.idcor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cores.idcor IS 'PK da Tabela [pkcor]=(idcor).
';


--
-- Name: COLUMN cores.txnomecor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cores.txnomecor IS 'Nome completo da cor segundo a tabela Pantone';


--
-- Name: COLUMN cores.nupantone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cores.nupantone IS 'Número Pantone.';


--
-- Name: COLUMN cores.dtcadcor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cores.dtcadcor IS 'Data de geração do registro';


--
-- Name: corescarros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corescarros (
    carroid integer NOT NULL,
    corid integer NOT NULL,
    "dtcadcorveiculo	" date
);


ALTER TABLE public.corescarros OWNER TO postgres;

--
-- Name: TABLE corescarros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.corescarros IS 'Tabela de Ligação entre cores e carros[visão] (relacionamento N;M).';


--
-- Name: COLUMN corescarros.carroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.corescarros.carroid IS 'PK [pkcorcarro]=(carroid,corid) (composta). FK [fk1corcarro]=(carroid) apontando para a tabela veiculos (visão -> carros).
';


--
-- Name: COLUMN corescarros.corid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.corescarros.corid IS 'PK [pkcorcarro]=(carroid,corid) (composta). FK [fk2corcarro]=(corid) apontando para a tabela cores.
';


--
-- Name: COLUMN corescarros."dtcadcorveiculo	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.corescarros."dtcadcorveiculo	" IS 'Data de geração do registro.
';


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    idcurso integer NOT NULL,
    txnomecurso character varying(250) NOT NULL,
    "instituicaoid	" integer,
    qtcargahoraria integer NOT NULL,
    dtcadcurso date NOT NULL
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- Name: TABLE cursos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cursos IS 'Cadastro de cursos de uma instituição.';


--
-- Name: COLUMN cursos.idcurso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cursos.idcurso IS 'PK da Tabela [pkcurso]=(idcurso)
';


--
-- Name: COLUMN cursos.txnomecurso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cursos.txnomecurso IS 'Nome completo (sem abreviações).';


--
-- Name: COLUMN cursos."instituicaoid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cursos."instituicaoid	" IS 'FK [fk1curso]=(instituicaoid) apontando para a tabela Instituições de Ensino.
';


--
-- Name: COLUMN cursos.qtcargahoraria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cursos.qtcargahoraria IS 'Quantidade de Horas na carga horária do curso.';


--
-- Name: COLUMN cursos.dtcadcurso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cursos.dtcadcurso IS 'Data de Geração dos Registro.';


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    iddepto character(3) NOT NULL,
    txnomedepto character varying(36) NOT NULL,
    funcionariogerenteid smallint DEFAULT NULL::numeric,
    deptosuperiorid character(3) DEFAULT NULL::bpchar,
    txlocalizacao character varying(80) DEFAULT NULL::character varying,
    qtareatotal smallint DEFAULT NULL::numeric,
    dtcriacaodepto date,
    dtcaddepartamento date NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: TABLE departamentos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.departamentos IS 'Cadastro dos departamentos da empresa onde os funcionarios trabalham.';


--
-- Name: COLUMN departamentos.iddepto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.iddepto IS 'PK da Tabela [pkdepartamento]=(iddepto). Sequencia de UMA letra e dois números, informados pelo usuário.
';


--
-- Name: COLUMN departamentos.txnomedepto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.txnomedepto IS 'Nome usual completo (sem abreviações)';


--
-- Name: COLUMN departamentos.funcionariogerenteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.funcionariogerenteid IS 'FK [fk1departamento]=(funcionariogerenteid) apontando para a tabela funcionarios (gerente do departamento).
';


--
-- Name: COLUMN departamentos.deptosuperiorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.deptosuperiorid IS 'FK [fk2departamento]=(deptosuperiorid) apontando para a tabela departamentos. Código do departamento superior na empresa.
';


--
-- Name: COLUMN departamentos.txlocalizacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.txlocalizacao IS 'Descrição da localização do departamento (Bloco, andar, sala,etc)';


--
-- Name: COLUMN departamentos.qtareatotal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.qtareatotal IS 'Quantidade da área ocupada pelo departamento';


--
-- Name: COLUMN departamentos.dtcriacaodepto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.dtcriacaodepto IS 'Data da criação do departamento na empresa';


--
-- Name: COLUMN departamentos.dtcaddepartamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentos.dtcaddepartamento IS 'Data de geração do registro.';


--
-- Name: departamentostels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentostels (
    iddeptotel integer NOT NULL,
    deptoid character(3) NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    dtcaddeptotel date,
    txnomecontato character varying(30)
);


ALTER TABLE public.departamentostels OWNER TO postgres;

--
-- Name: TABLE departamentostels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.departamentostels IS 'Registro com os telefones de cada departamento.';


--
-- Name: COLUMN departamentostels.iddeptotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentostels.iddeptotel IS 'PK da Tabela [pkdeptotel]=(iddeptotel).
';


--
-- Name: COLUMN departamentostels.deptoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentostels.deptoid IS 'FK [fk1deptotel]=(deptoid) apontando para a tabela Departamentos
';


--
-- Name: COLUMN departamentostels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentostels.tipotelefoneid IS 'FK [fk2deptotel]=(tipotelefoneid) apontando para a tabela telefonestipos.
';


--
-- Name: COLUMN departamentostels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentostels.nutelefone IS 'Número do telefone com operadora+DDD+número sem traços ou parenteses.
';


--
-- Name: COLUMN departamentostels.dtcaddeptotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentostels.dtcaddeptotel IS 'Data de geração do registro.
';


--
-- Name: COLUMN departamentostels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.departamentostels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: disciplinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplinas (
    iddisciplina integer NOT NULL,
    cursoid smallint NOT NULL,
    txnomedisciplina character varying(250) NOT NULL,
    txementa character varying(250) DEFAULT NULL::character varying,
    qthoras smallint NOT NULL,
    dtcaddisciplina date NOT NULL,
    txcriterioavaliacao character varying(500)
);


ALTER TABLE public.disciplinas OWNER TO postgres;

--
-- Name: TABLE disciplinas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.disciplinas IS 'Cadastro das disciplinas oferecidas em um curso';


--
-- Name: COLUMN disciplinas.iddisciplina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.iddisciplina IS 'Pk da Tabela [pkdisciplina]=(iddisciplina).
';


--
-- Name: COLUMN disciplinas.cursoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.cursoid IS 'FK [fk1disciplina]=(cursoid) apontando para a tabela cursos
';


--
-- Name: COLUMN disciplinas.txnomedisciplina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.txnomedisciplina IS 'Nome completo da Disciplina';


--
-- Name: COLUMN disciplinas.txementa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.txementa IS 'Texto com a ementa disciplinar';


--
-- Name: COLUMN disciplinas.qthoras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.qthoras IS 'Quantidade de horas-aulas (de 60 min.) que ocupa e disciplina.';


--
-- Name: COLUMN disciplinas.dtcaddisciplina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.dtcaddisciplina IS 'Data de Geração do registro.';


--
-- Name: COLUMN disciplinas.txcriterioavaliacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.disciplinas.txcriterioavaliacao IS 'Texto com a descrição do critério de avaliação da disciplina.';


--
-- Name: duplicatas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.duplicatas (
    idduplicata integer NOT NULL,
    "nfvendaid	" integer NOT NULL,
    dtvencimento date NOT NULL,
    dtpagamento date,
    vlduplicata double precision,
    vldesconto double precision NOT NULL,
    vlliquido double precision NOT NULL,
    vlmulta double precision NOT NULL,
    dtcadduplicata date NOT NULL
);


ALTER TABLE public.duplicatas OWNER TO postgres;

--
-- Name: TABLE duplicatas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.duplicatas IS 'Cadastro das Duplicatas que devem ser recebidas pelas vendas feitas em uma empresa.';


--
-- Name: COLUMN duplicatas.idduplicata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.idduplicata IS 'PK da Tabela [pkduplicata]=(idduplicata). Sequencial crescente positivo.
';


--
-- Name: COLUMN duplicatas."nfvendaid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas."nfvendaid	" IS 'FK [fk1duplicata]=(nfvendaid) apontando para a Nota Fiscal da qual se gera a Duplicata.
';


--
-- Name: COLUMN duplicatas.dtvencimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.dtvencimento IS 'Data de vencimento da duplicata.';


--
-- Name: COLUMN duplicatas.dtpagamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.dtpagamento IS 'Data de pagamento da duplicata.';


--
-- Name: COLUMN duplicatas.vlduplicata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.vlduplicata IS 'Valor da Duplicata.';


--
-- Name: COLUMN duplicatas.vldesconto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.vldesconto IS 'Valor de Desconto.';


--
-- Name: COLUMN duplicatas.vlliquido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.vlliquido IS 'Valor Líquido da Duplicata.';


--
-- Name: COLUMN duplicatas.vlmulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.vlmulta IS 'Valor da Multa.';


--
-- Name: COLUMN duplicatas.dtcadduplicata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.duplicatas.dtcadduplicata IS 'Data de Geração do registro.';


--
-- Name: editoras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editoras (
    ideditora integer NOT NULL,
    txnomeeditora character(70) NOT NULL,
    txrazaosocial character varying(250) DEFAULT NULL::character varying,
    nucnpj character(16),
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    aoporteeditora character(1),
    aoabrangencia character(1),
    dtfundacao date,
    dtcadeditora date NOT NULL
);


ALTER TABLE public.editoras OWNER TO postgres;

--
-- Name: TABLE editoras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.editoras IS 'Cadastro das Editoras de Livros, Revistas e/ou periódicos.';


--
-- Name: COLUMN editoras.ideditora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.ideditora IS 'PK da Tabela [pkeditora]=(ideditora).
';


--
-- Name: COLUMN editoras.txnomeeditora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.txnomeeditora IS 'Nome usual da editora (sem abreviações ).';


--
-- Name: COLUMN editoras.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.txrazaosocial IS 'Razão social completa.';


--
-- Name: COLUMN editoras.nucnpj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.nucnpj IS 'Número do CNPJ da Editora (somente números).';


--
-- Name: COLUMN editoras.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.logradouroid IS 'FK [fk1editora]=(logradouroid) apontando para a visão logrcompleto.
';


--
-- Name: COLUMN editoras.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.).';


--
-- Name: COLUMN editoras.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.nucep IS 'Número do CEP (somente números)';


--
-- Name: COLUMN editoras.aoporteeditora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.aoporteeditora IS 'P|M|G – Porte da editora (Pequena|Média|Grande).';


--
-- Name: COLUMN editoras.aoabrangencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.aoabrangencia IS 'L|E|N|I - Abrangência da editora (Local|Estadual|Nacional|Internacional)';


--
-- Name: COLUMN editoras.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.dtfundacao IS 'Data de fundação da editora.';


--
-- Name: COLUMN editoras.dtcadeditora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editoras.dtcadeditora IS 'Data de geração do registro';


--
-- Name: editorastels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editorastels (
    ideditoratel integer NOT NULL,
    editoraid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character(30),
    dtcadeditoratel date
);


ALTER TABLE public.editorastels OWNER TO postgres;

--
-- Name: TABLE editorastels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.editorastels IS 'Registros de telefones de cada editora.';


--
-- Name: COLUMN editorastels.ideditoratel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editorastels.ideditoratel IS 'PK da Tabela [pkeditoratel]=(ideditoratel).
';


--
-- Name: COLUMN editorastels.editoraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editorastels.editoraid IS 'FK [fk1editoratel]=(editoraid) apontando para a Tabela Editoras.
';


--
-- Name: COLUMN editorastels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editorastels.tipotelefoneid IS 'FK [fk2editoratel]=(tipotelefoneid) apontando para a tabela telefonestipos.
';


--
-- Name: COLUMN editorastels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editorastels.nutelefone IS 'Número do telefone com operadora+DDD+número sem traços ou parenteses.';


--
-- Name: COLUMN editorastels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.editorastels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresas (
    idempresa integer NOT NULL,
    txnomeusual character varying(150) NOT NULL,
    txrazaosocial character varying(250) NOT NULL,
    nucnpj character(16),
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    setoratuacaoid integer DEFAULT NULL::numeric,
    aoporteempresa character(1),
    dtfundacao date,
    dtcadempresa date NOT NULL
);


ALTER TABLE public.empresas OWNER TO postgres;

--
-- Name: TABLE empresas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.empresas IS 'Cadastro de empresas onde os funcionarios trabalham ou trabalharam.';


--
-- Name: COLUMN empresas.idempresa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.idempresa IS 'PK da Tabela [pkempresa]=(idempresa).
';


--
-- Name: COLUMN empresas.txnomeusual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.txnomeusual IS 'Nome usual completo (sem abreviações).';


--
-- Name: COLUMN empresas.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.txrazaosocial IS 'Razão social completa';


--
-- Name: COLUMN empresas.nucnpj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.nucnpj IS 'Número do CNPJ da Empresa (somente números).';


--
-- Name: COLUMN empresas.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.logradouroid IS 'FK [fk1empresa]=(logradouroid) apontando para a visão logrcompleto onde está a empresa
';


--
-- Name: COLUMN empresas.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN empresas.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN empresas.setoratuacaoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.setoratuacaoid IS 'FK [fk2empresa]=(setoratuacaoid) apontando a tabela de setoresdeatuacao.
';


--
-- Name: COLUMN empresas.aoporteempresa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.aoporteempresa IS 'P|M|G – Porte da empresa (Pequena | Média | Grande).';


--
-- Name: COLUMN empresas.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.dtfundacao IS 'Data de fundação da empresa.';


--
-- Name: COLUMN empresas.dtcadempresa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresas.dtcadempresa IS 'Data de geração do registro.';


--
-- Name: empresastels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresastels (
    idempresatel integer NOT NULL,
    empresaid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadempresatel date
);


ALTER TABLE public.empresastels OWNER TO postgres;

--
-- Name: TABLE empresastels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.empresastels IS 'Registros dos telefones de cada empresa.';


--
-- Name: COLUMN empresastels.idempresatel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresastels.idempresatel IS 'PK da Tabela [pkempresatel]=(idempresatel).
';


--
-- Name: COLUMN empresastels.empresaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresastels.empresaid IS 'FK [fk1empresatel]=(empresaid) apontando para a tabela empresas.
';


--
-- Name: COLUMN empresastels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresastels.tipotelefoneid IS 'FK [fk2empresatel]=(tipotelefoneid) apontando para a tabela telefonestipos
';


--
-- Name: COLUMN empresastels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresastels.nutelefone IS 'Número do telefone (somente os números).';


--
-- Name: COLUMN empresastels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresastels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: COLUMN empresastels.dtcadempresatel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.empresastels.dtcadempresatel IS 'Data de Geração do Registro';


--
-- Name: especialidadesmedicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidadesmedicas (
    idespecialidade integer NOT NULL,
    txnomeespecialidade character varying(200) NOT NULL,
    txdescricaoespecialidade text,
    dtcadespecmedica date NOT NULL
);


ALTER TABLE public.especialidadesmedicas OWNER TO postgres;

--
-- Name: TABLE especialidadesmedicas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.especialidadesmedicas IS 'Cadastro das Especialidades Médicas.';


--
-- Name: COLUMN especialidadesmedicas.idespecialidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.especialidadesmedicas.idespecialidade IS 'PK da Tabela [pkespecialidade]=(idespecialidade).
';


--
-- Name: COLUMN especialidadesmedicas.txnomeespecialidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.especialidadesmedicas.txnomeespecialidade IS 'Nome usual completo (sem abreviações).';


--
-- Name: COLUMN especialidadesmedicas.txdescricaoespecialidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.especialidadesmedicas.txdescricaoespecialidade IS 'Descrição completa das principais atribuições da especialidade (sem abreviações).';


--
-- Name: COLUMN especialidadesmedicas.dtcadespecmedica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.especialidadesmedicas.dtcadespecmedica IS 'Data de geração do registro.';


--
-- Name: estadosdospaises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estadosdospaises (
    idestadodopais character(3) NOT NULL,
    "txnomeestado	" character varying(250) NOT NULL,
    txnomecapital character varying(250) NOT NULL,
    qtareatotal integer,
    qtcidades smallint,
    qtpopulacao integer,
    dtcadestadodopais date NOT NULL,
    paisid character(3)
);


ALTER TABLE public.estadosdospaises OWNER TO postgres;

--
-- Name: TABLE estadosdospaises; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.estadosdospaises IS 'Cadastro dos Estados dos Paises';


--
-- Name: COLUMN estadosdospaises.idestadodopais; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.idestadodopais IS 'PK da Tabela [pkestadodopais]=(idestadodopais). Sigla do estado da união como identificado no Brasil.
';


--
-- Name: COLUMN estadosdospaises."txnomeestado	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises."txnomeestado	" IS 'Nome (por extenso) do estado da união.';


--
-- Name: COLUMN estadosdospaises.txnomecapital; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.txnomecapital IS 'Nome da Capital do Estado';


--
-- Name: COLUMN estadosdospaises.qtareatotal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.qtareatotal IS 'Área total (em Km2) do estado.';


--
-- Name: COLUMN estadosdospaises.qtcidades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.qtcidades IS 'Quantidade de Cidades do estado.';


--
-- Name: COLUMN estadosdospaises.qtpopulacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.qtpopulacao IS 'Quantidade de pessoas que residem no estado';


--
-- Name: COLUMN estadosdospaises.dtcadestadodopais; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.dtcadestadodopais IS 'Data de Cadastro do Estado.';


--
-- Name: COLUMN estadosdospaises.paisid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estadosdospaises.paisid IS 'FK [fk1estadodopais]=(paisid) para tabela paises
';


--
-- Name: fabricantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fabricantes (
    idfabricante integer NOT NULL,
    txnomefabricante character varying(250) NOT NULL,
    txrazaosocial character varying(250) NOT NULL,
    nucnpj character(16),
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    setoratuacaoid smallint,
    aoportefabricante character(1),
    dtfundacao date,
    dtcadfabricante date NOT NULL
);


ALTER TABLE public.fabricantes OWNER TO postgres;

--
-- Name: TABLE fabricantes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fabricantes IS 'Cadastro dos Fabricantes.';


--
-- Name: COLUMN fabricantes.idfabricante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.idfabricante IS 'PK da Tabela [pkfabricante]=(idfabricante).
';


--
-- Name: COLUMN fabricantes.txnomefabricante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.txnomefabricante IS 'Nome usual completo (sem abreviações).';


--
-- Name: COLUMN fabricantes.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.txrazaosocial IS 'Razão social completa.';


--
-- Name: COLUMN fabricantes.nucnpj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.nucnpj IS 'Número do CNPJ do fabricante (somente números).';


--
-- Name: COLUMN fabricantes.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.logradouroid IS 'FK [fk1fabricante]=(logradouroid) apontando para a visão logrcompleto onde está sede ou fábrica.
';


--
-- Name: COLUMN fabricantes.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN fabricantes.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.nucep IS 'Número do CEP.';


--
-- Name: COLUMN fabricantes.setoratuacaoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.setoratuacaoid IS 'FK [fk2fabricante]=(setoratuacaoid) apontando o setor de atuação da fabricante.
';


--
-- Name: COLUMN fabricantes.aoportefabricante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.aoportefabricante IS 'P|M|G – Porte do fabricante (Pequena | Média | Grande).';


--
-- Name: COLUMN fabricantes.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.dtfundacao IS 'Data de fundação (criação da empresa) do fabricante.';


--
-- Name: COLUMN fabricantes.dtcadfabricante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantes.dtcadfabricante IS 'Data de geração do registro.';


--
-- Name: fabricantestels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fabricantestels (
    idfabricantetel integer NOT NULL,
    fabricanteid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadfabrictel date
);


ALTER TABLE public.fabricantestels OWNER TO postgres;

--
-- Name: TABLE fabricantestels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fabricantestels IS 'Registros dos telefones dos fabricantes.';


--
-- Name: COLUMN fabricantestels.idfabricantetel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantestels.idfabricantetel IS 'PK da Tabela [pkfabricantetel]=(idfabricantetel).
';


--
-- Name: COLUMN fabricantestels.fabricanteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantestels.fabricanteid IS 'FK [fk1fabricantetel]=(fabricanteid) apontando para a tabela fabricantes.
';


--
-- Name: COLUMN fabricantestels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantestels.tipotelefoneid IS 'FK [fk2fabricantetel]=(tipotelefoneid) apontando para a tabela telefonestipos
';


--
-- Name: COLUMN fabricantestels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantestels.nutelefone IS 'Número do telefone com operadora e DDD (somente os números).';


--
-- Name: COLUMN fabricantestels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantestels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: COLUMN fabricantestels.dtcadfabrictel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fabricantestels.dtcadfabrictel IS 'Data de geração do registro';


--
-- Name: faturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faturas (
    idfatura integer NOT NULL,
    nunfcompraid integer,
    dtvencimento date,
    dtpagamento date,
    vlfatura double precision NOT NULL,
    vldesconto double precision NOT NULL,
    vlliquido double precision NOT NULL,
    vlmulta double precision NOT NULL,
    dtcadfatura date NOT NULL
);


ALTER TABLE public.faturas OWNER TO postgres;

--
-- Name: TABLE faturas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.faturas IS 'Cadastro das faturas. A partir delas os bairros e por fim os logradouros.';


--
-- Name: COLUMN faturas.idfatura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.idfatura IS 'PK da Tabela [pkfatura]=(idfatura). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN faturas.nunfcompraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.nunfcompraid IS 'FK [fk1fatura]=(nunfcompraid) apontando para a Nota Fiscal da qual se gera a fatura..
';


--
-- Name: COLUMN faturas.dtvencimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.dtvencimento IS 'Data de vencimento da fatura.';


--
-- Name: COLUMN faturas.dtpagamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.dtpagamento IS 'Data de pagamento da Fatura.';


--
-- Name: COLUMN faturas.vlfatura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.vlfatura IS 'Valor da Fatura.';


--
-- Name: COLUMN faturas.vldesconto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.vldesconto IS 'Valor de Desconto.';


--
-- Name: COLUMN faturas.vlliquido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.vlliquido IS 'Valor Líquido da Fatura';


--
-- Name: COLUMN faturas.vlmulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.vlmulta IS 'Valor da Multa por atraso de pagamento da Fatura.';


--
-- Name: COLUMN faturas.dtcadfatura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.faturas.dtcadfatura IS 'Data de Geração do Registro';


--
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedores (
    idfornecedor integer NOT NULL,
    txnomefornecedor character varying(250) DEFAULT NULL::character varying,
    txrazaosocial character varying(250) DEFAULT NULL::character varying,
    nucnpj character(15),
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    nusedes numeric DEFAULT NULL::numeric,
    vllimitecompra double precision NOT NULL,
    setoratuacaoid smallint,
    aoportefornecedor character(1),
    dtfundacao date,
    dtcadfornecedor date NOT NULL
);


ALTER TABLE public.fornecedores OWNER TO postgres;

--
-- Name: TABLE fornecedores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fornecedores IS 'Cadastro dos Fornecedores de uma empresa.';


--
-- Name: COLUMN fornecedores.idfornecedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.idfornecedor IS 'PK da Tabela [pkfornecedor]=(idfornecedor).
';


--
-- Name: COLUMN fornecedores.txnomefornecedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.txnomefornecedor IS 'Nome usual completo (sem abreviações)';


--
-- Name: COLUMN fornecedores.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.txrazaosocial IS 'Razão social completa.';


--
-- Name: COLUMN fornecedores.nucnpj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.nucnpj IS 'Número do Cadastro Nacional de Pessoas Jurídicas - Atribuído pelo Ministério da Economia.
';


--
-- Name: COLUMN fornecedores.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.logradouroid IS 'FK [fk1fornecedor]=(logradouroid) apontando para a visão logrcompleto onde está o Fornecedor.
';


--
-- Name: COLUMN fornecedores.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN fornecedores.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN fornecedores.nusedes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.nusedes IS 'Número de sedes que o fornecedor possui (loja central e filiais).';


--
-- Name: COLUMN fornecedores.vllimitecompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.vllimitecompra IS 'Valor Limite para compra com o Fornecedor.';


--
-- Name: COLUMN fornecedores.setoratuacaoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.setoratuacaoid IS 'FK [fk2fornecedor]=(setoratuacaoid) para a tabela setoresdeatuacao (setor de atuação do fornecedor).
';


--
-- Name: COLUMN fornecedores.aoportefornecedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.aoportefornecedor IS 'P|M|G – Porte do fornecedor (Pequena | Média | Grande).';


--
-- Name: COLUMN fornecedores.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.dtfundacao IS 'Data de fundação do fornecedor.';


--
-- Name: COLUMN fornecedores.dtcadfornecedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedores.dtcadfornecedor IS 'Data de geração do registro.';


--
-- Name: fornecedorestels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedorestels (
    idfornecedortel integer NOT NULL,
    fornecedorid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadfornecedortel date
);


ALTER TABLE public.fornecedorestels OWNER TO postgres;

--
-- Name: TABLE fornecedorestels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fornecedorestels IS 'Registro dos Telefones dos fornecedores.';


--
-- Name: COLUMN fornecedorestels.idfornecedortel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedorestels.idfornecedortel IS 'PK da Tabela [pkfornecedortel]=(idfornecedortel).
';


--
-- Name: COLUMN fornecedorestels.fornecedorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedorestels.fornecedorid IS 'FK [fk1fornecedortel]=(fornecedorid) apontando para a tabela fornecedores.
';


--
-- Name: COLUMN fornecedorestels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedorestels.tipotelefoneid IS 'FK [fk2fornecedortel]=(tipotelefoneid) apontando para a tabela telefonestipos
';


--
-- Name: COLUMN fornecedorestels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedorestels.nutelefone IS 'Número do telefone (somente números).';


--
-- Name: COLUMN fornecedorestels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedorestels.txnomecontato IS 'Nomes das pessoas que atendem como contato no telefone.';


--
-- Name: COLUMN fornecedorestels.dtcadfornecedortel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecedorestels.dtcadfornecedortel IS 'Data de geração do registro.';


--
-- Name: fornecimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecimentos (
    idfornecimento integer NOT NULL,
    produtoid character(12) DEFAULT (0)::numeric NOT NULL,
    fornecedorid integer NOT NULL,
    dtcadfornecimento date NOT NULL
);


ALTER TABLE public.fornecimentos OWNER TO postgres;

--
-- Name: TABLE fornecimentos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fornecimentos IS 'Registro com os produtos fornecidos por cada fornecedor.';


--
-- Name: COLUMN fornecimentos.idfornecimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecimentos.idfornecimento IS 'PK da Tabela [pkfornecimento]=(idfornecimento). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN fornecimentos.produtoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecimentos.produtoid IS 'FK [fk1fornecimento]=(produtoid) para a tabela produtos. Forma com fkfornecedor uma UK.
';


--
-- Name: COLUMN fornecimentos.fornecedorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecimentos.fornecedorid IS 'FK [fk2fornecimento]=(fornecedorid) para a tabela fornecedores. Forma com fkproduto uma UK.
';


--
-- Name: COLUMN fornecimentos.dtcadfornecimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fornecimentos.dtcadfornecimento IS 'Data de geração do registro.';


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
    idfuncionario smallint NOT NULL,
    txprenomes character varying(40) NOT NULL,
    txsobrenome character varying(20) NOT NULL,
    deptoid character(3) DEFAULT NULL::bpchar,
    funcaoid integer DEFAULT NULL::numeric,
    "grauescolaridadeid	" integer DEFAULT NULL::numeric,
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nuramal character(4) DEFAULT NULL::bpchar,
    dtcontratacao date,
    aosexo character(1) DEFAULT NULL::bpchar,
    dtnascimento date,
    txresenha text,
    vlsalario double precision DEFAULT NULL::numeric,
    vlbonus double precision DEFAULT NULL::numeric,
    vlcomissao double precision DEFAULT NULL::numeric,
    nucep character(8) NOT NULL,
    dtcadfuncionario date NOT NULL
);


ALTER TABLE public.funcionarios OWNER TO postgres;

--
-- Name: TABLE funcionarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.funcionarios IS 'Cadastro dos Funcionários';


--
-- Name: COLUMN funcionarios.idfuncionario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.idfuncionario IS 'PK da Tabela [pkfuncionario]=(idfuncionario).
';


--
-- Name: COLUMN funcionarios.txprenomes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.txprenomes IS 'Nomes do funcionário sem abreviações e sem o sobrenome.';


--
-- Name: COLUMN funcionarios.txsobrenome; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.txsobrenome IS 'Sobrenome completo (sem abreviações).';


--
-- Name: COLUMN funcionarios.deptoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.deptoid IS 'FK [fk1funcionario]=(deptoid) apontando para a tabelas Departamentos.
';


--
-- Name: COLUMN funcionarios.funcaoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.funcaoid IS 'FK [fk2funcionario]=(funcaoid) apontando para a tabela Funções.
';


--
-- Name: COLUMN funcionarios."grauescolaridadeid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios."grauescolaridadeid	" IS 'FK [fk3funcionario]=(grauescolaridadeid) com o código do nível de educação (escolaridade)
';


--
-- Name: COLUMN funcionarios.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.logradouroid IS 'FK [fk4funcionario]=(logradouroid) para a visão logrcompleto onde está a moradia do Funcionário.
';


--
-- Name: COLUMN funcionarios.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN funcionarios.nuramal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.nuramal IS 'Número do ramal telefônico do funcionario.';


--
-- Name: COLUMN funcionarios.dtcontratacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.dtcontratacao IS 'Data de contratação';


--
-- Name: COLUMN funcionarios.aosexo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.aosexo IS 'Atributo Operacional indicando o Sexo como Masculino e Feminino.';


--
-- Name: COLUMN funcionarios.dtnascimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.dtnascimento IS 'Data de nascimento';


--
-- Name: COLUMN funcionarios.txresenha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.txresenha IS 'Texto descrevendo a personalidade e dinâmica profissional do funcionário.';


--
-- Name: COLUMN funcionarios.vlsalario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.vlsalario IS 'Valor do Salário Base do Funcionário.';


--
-- Name: COLUMN funcionarios.vlbonus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.vlbonus IS 'Valor do Bônus de ganho (se não houver deve ser 0-Zero).';


--
-- Name: COLUMN funcionarios.vlcomissao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.vlcomissao IS 'Valor da comissão (se não houver deve ser 0-Zero).';


--
-- Name: COLUMN funcionarios.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN funcionarios.dtcadfuncionario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionarios.dtcadfuncionario IS 'Data de geração do registro.';


--
-- Name: funcionariosplanos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionariosplanos (
    idfuncionarioplano integer NOT NULL,
    funcionarioid smallint NOT NULL,
    planodesaudeid integer NOT NULL,
    dtvinculacao date NOT NULL,
    dtdesligamento date NOT NULL,
    dtcadfuncplano date
);


ALTER TABLE public.funcionariosplanos OWNER TO postgres;

--
-- Name: TABLE funcionariosplanos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.funcionariosplanos IS 'Registro dos planos de saúde dos funcionários.';


--
-- Name: COLUMN funcionariosplanos.idfuncionarioplano; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariosplanos.idfuncionarioplano IS 'PK da Tabela [pkfuncionarioplano]=(idfuncionarioplano). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN funcionariosplanos.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariosplanos.funcionarioid IS 'FK [fk1funcionarioplano]=(funcionarioid) apontando para a tabela funcionarios.
';


--
-- Name: COLUMN funcionariosplanos.planodesaudeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariosplanos.planodesaudeid IS 'FK [fk2funcionarioplano]=(planodesaudeid) apontando para a tabela
';


--
-- Name: COLUMN funcionariosplanos.dtvinculacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariosplanos.dtvinculacao IS 'Data de vinculação do funcionário ao plano de saúde.';


--
-- Name: COLUMN funcionariosplanos.dtdesligamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariosplanos.dtdesligamento IS 'Data de desligamento do funcionário ao plano de saúde.';


--
-- Name: COLUMN funcionariosplanos.dtcadfuncplano; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariosplanos.dtcadfuncplano IS 'Data de geração do registro.';


--
-- Name: funcionariostels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionariostels (
    idfuncionariotel integer NOT NULL,
    funcionarioid smallint NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    "dtcadfuncionariotel	" date
);


ALTER TABLE public.funcionariostels OWNER TO postgres;

--
-- Name: TABLE funcionariostels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.funcionariostels IS 'Registros dos telefones de cada funcionário.';


--
-- Name: COLUMN funcionariostels.idfuncionariotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariostels.idfuncionariotel IS 'PK da Tabela [pkfuncionariotel]=(idfuncionariotel).

.';


--
-- Name: COLUMN funcionariostels.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariostels.funcionarioid IS 'FK [fk1funcionariotel]=(funcionarioid) apontando para a tabela funcionarios.
';


--
-- Name: COLUMN funcionariostels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariostels.tipotelefoneid IS 'FK [fk2funcionariotel]=(tipotelefoneid) apontando para a tabela telefonestipos.
';


--
-- Name: COLUMN funcionariostels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariostels.nutelefone IS 'Número do telefone (somente números).';


--
-- Name: COLUMN funcionariostels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariostels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: COLUMN funcionariostels."dtcadfuncionariotel	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcionariostels."dtcadfuncionariotel	" IS 'Data de geração do registro.';


--
-- Name: funcoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcoes (
    idfuncao smallint NOT NULL,
    txnomefuncao character varying(60) NOT NULL,
    txdescricaofuncao text,
    qtanosprefuncao smallint,
    dtcadfuncao date NOT NULL
);


ALTER TABLE public.funcoes OWNER TO postgres;

--
-- Name: TABLE funcoes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.funcoes IS 'Cadastro das funções que podem ser exercidas por funcionários.';


--
-- Name: COLUMN funcoes.idfuncao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcoes.idfuncao IS 'Pk da Tabela [pkfuncao]=(idfuncao)
';


--
-- Name: COLUMN funcoes.txnomefuncao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcoes.txnomefuncao IS 'Nome completo e sem abreviações.';


--
-- Name: COLUMN funcoes.txdescricaofuncao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcoes.txdescricaofuncao IS 'Descrição completa das principais atribuições da função do profissional (sem abreviações)';


--
-- Name: COLUMN funcoes.qtanosprefuncao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcoes.qtanosprefuncao IS 'Quantidade de anos na empresa para assumir a função.';


--
-- Name: COLUMN funcoes.dtcadfuncao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.funcoes.dtcadfuncao IS 'Data de Geração do Registro.';


--
-- Name: grausdeescolaridade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grausdeescolaridade (
    idgrauescolaridade smallint NOT NULL,
    txnomecomum character varying(30) NOT NULL,
    qtanosdeestudo smallint NOT NULL,
    dtcadgrauescolaridade date NOT NULL
);


ALTER TABLE public.grausdeescolaridade OWNER TO postgres;

--
-- Name: TABLE grausdeescolaridade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.grausdeescolaridade IS 'Cadastro dos Níveis de Escolaridade (Educação).';


--
-- Name: COLUMN grausdeescolaridade.idgrauescolaridade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.grausdeescolaridade.idgrauescolaridade IS 'PK da Tabela [pkgraudeescolaridade]=(idgraudeescolaridade).
';


--
-- Name: COLUMN grausdeescolaridade.txnomecomum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.grausdeescolaridade.txnomecomum IS 'Nome do nível de educação (sem abreviações).';


--
-- Name: COLUMN grausdeescolaridade.qtanosdeestudo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.grausdeescolaridade.qtanosdeestudo IS 'Quantidade de anos de estudo para alcançar o grau de escolaridade.';


--
-- Name: COLUMN grausdeescolaridade.dtcadgrauescolaridade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.grausdeescolaridade.dtcadgrauescolaridade IS 'Data de Geração do Registro';


--
-- Name: habilitacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilitacoes (
    idhabilitacao smallint NOT NULL,
    cursoid smallint NOT NULL,
    professorid smallint NOT NULL,
    dthabilitacao date NOT NULL,
    dtcapacitacao date NOT NULL,
    dtcadhabilitacao date NOT NULL
);


ALTER TABLE public.habilitacoes OWNER TO postgres;

--
-- Name: TABLE habilitacoes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.habilitacoes IS 'Registro dos Cursos que cada professor tem habilitação para atuar.';


--
-- Name: COLUMN habilitacoes.idhabilitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.habilitacoes.idhabilitacao IS 'PK da Tabela [pkhabilitacao]=(idhabilitacao). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN habilitacoes.cursoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.habilitacoes.cursoid IS 'Parte da UK [uk1habilitacao]=(cursoid,professorid,dthabilitacao) e FK [fk1habilitacao]=(cursoid) indicando o código do curso.
';


--
-- Name: COLUMN habilitacoes.professorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.habilitacoes.professorid IS 'Parte da UK [uk1habilitacao]=(cursoid,professorid,dthabilitacao) e FK [fk2habilitacao]=(professorid) indicando o código do professo.
';


--
-- Name: COLUMN habilitacoes.dthabilitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.habilitacoes.dthabilitacao IS 'Parte da UK [uk1habilitacao]=(cursoid,professorid,dthabilitacao) é a Data de habilitação do professor para ministrar a disciplina.
';


--
-- Name: COLUMN habilitacoes.dtcapacitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.habilitacoes.dtcapacitacao IS 'Data quando o professor conseguiu a capacitação para ministrar a disciplina.';


--
-- Name: COLUMN habilitacoes.dtcadhabilitacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.habilitacoes.dtcadhabilitacao IS 'Data de geração do registro';


--
-- Name: historicoprofissional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historicoprofissional (
    "idhistprof	" smallint NOT NULL,
    funcionarioid smallint NOT NULL,
    empresaid smallint DEFAULT NULL::numeric,
    atividadeid smallint NOT NULL,
    dtinicio date NOT NULL,
    dttermino date NOT NULL,
    dtcadhistprof date NOT NULL
);


ALTER TABLE public.historicoprofissional OWNER TO postgres;

--
-- Name: TABLE historicoprofissional; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.historicoprofissional IS 'Registro do histórico profissional de um funcionário.';


--
-- Name: COLUMN historicoprofissional."idhistprof	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional."idhistprof	" IS 'PK da Tabela [pkhistprof]=(idhistprof)
';


--
-- Name: COLUMN historicoprofissional.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional.funcionarioid IS 'FK [fk1histprof]=(funcionarioid) para tabela funcionários.
';


--
-- Name: COLUMN historicoprofissional.empresaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional.empresaid IS 'FK [fk2histprof]=(empresaid) para tabela empresas.
';


--
-- Name: COLUMN historicoprofissional.atividadeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional.atividadeid IS 'FK [fk3histprof]=(atividadeid) para tabela atividades.
';


--
-- Name: COLUMN historicoprofissional.dtinicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional.dtinicio IS 'Data de inicio de atividade do funcionário na empresa (na atividade)';


--
-- Name: COLUMN historicoprofissional.dttermino; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional.dttermino IS 'Data de termino de atividade do funcionário na empresa (na atividade)';


--
-- Name: COLUMN historicoprofissional.dtcadhistprof; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.historicoprofissional.dtcadhistprof IS 'Data de Geração do Registro';


--
-- Name: idiomas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idiomas (
    ididioma smallint NOT NULL,
    txnomeidioma character varying(30) NOT NULL,
    txdescricao text NOT NULL,
    dtcadidioma date NOT NULL
);


ALTER TABLE public.idiomas OWNER TO postgres;

--
-- Name: TABLE idiomas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.idiomas IS 'Cadastro dos Idiomas (linguas) praticados no mundo atualmente (2020).';


--
-- Name: COLUMN idiomas.ididioma; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomas.ididioma IS 'PK da Tabela [pkidioma]=(ididioma).
';


--
-- Name: COLUMN idiomas.txnomeidioma; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomas.txnomeidioma IS 'Nome oficial do idioma reconhecido na ONU.';


--
-- Name: COLUMN idiomas.txdescricao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomas.txdescricao IS 'Texto com descrição da estrutura do idioma. Morfologia, sintaxe principal, etc.';


--
-- Name: COLUMN idiomas.dtcadidioma; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomas.dtcadidioma IS 'Data da geração do registro na tabela.';


--
-- Name: idiomasfalados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idiomasfalados (
    ididiomafalado smallint NOT NULL,
    idiomaid smallint NOT NULL,
    paisid character(3) NOT NULL,
    dtcadidiomafalado date NOT NULL
);


ALTER TABLE public.idiomasfalados OWNER TO postgres;

--
-- Name: TABLE idiomasfalados; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.idiomasfalados IS 'Cadastro dos idiomas falados em cada pais.';


--
-- Name: COLUMN idiomasfalados.ididiomafalado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomasfalados.ididiomafalado IS 'PK da Tabela [pkidiomafalado]=(ididiomafalado).
';


--
-- Name: COLUMN idiomasfalados.idiomaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomasfalados.idiomaid IS 'FK [fk1idiomafalado]=(idiomaid) para a tabela idiomas.
';


--
-- Name: COLUMN idiomasfalados.paisid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomasfalados.paisid IS 'FK [fk2idiomafalado]=(paisid) para a tabela idiomas.
';


--
-- Name: COLUMN idiomasfalados.dtcadidiomafalado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.idiomasfalados.dtcadidiomafalado IS 'Data de geração do registro.
';


--
-- Name: instituicoesdeensino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituicoesdeensino (
    "idinstituicaodeensino	" smallint NOT NULL,
    txnomeinstituicao character varying(200) NOT NULL,
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    aotipoinstituicao character(1),
    dtfundacao date,
    nucep character(8) DEFAULT NULL::bpchar,
    "dtcadinstituicaodeensino	" date NOT NULL
);


ALTER TABLE public.instituicoesdeensino OWNER TO postgres;

--
-- Name: TABLE instituicoesdeensino; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.instituicoesdeensino IS 'Cadastro de Instituições de Ensino.';


--
-- Name: COLUMN instituicoesdeensino."idinstituicaodeensino	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino."idinstituicaodeensino	" IS 'PK da Tabela [pkinstituicaodeensino]=(idinstituicaodeensino).
';


--
-- Name: COLUMN instituicoesdeensino.txnomeinstituicao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino.txnomeinstituicao IS 'Nome usual completo (sem abreviações)';


--
-- Name: COLUMN instituicoesdeensino.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino.logradouroid IS 'FK [fk1instituicaodeensino]=(logradouroid) para a visão logrcompleto onde está a instituição de ensino.
';


--
-- Name: COLUMN instituicoesdeensino.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN instituicoesdeensino.aotipoinstituicao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino.aotipoinstituicao IS 'G-pública (Gratuíta) | P-Particular.';


--
-- Name: COLUMN instituicoesdeensino.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino.dtfundacao IS 'Data de fundação da instituição de ensino.';


--
-- Name: COLUMN instituicoesdeensino.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN instituicoesdeensino."dtcadinstituicaodeensino	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensino."dtcadinstituicaodeensino	" IS 'Data de geração do registro.';


--
-- Name: instituicoesdeensinotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituicoesdeensinotels (
    idinstituicaodeensinotel smallint NOT NULL,
    "instituicaoid	" smallint NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    "dtcadinstituicaoensinotel	" date
);


ALTER TABLE public.instituicoesdeensinotels OWNER TO postgres;

--
-- Name: TABLE instituicoesdeensinotels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.instituicoesdeensinotels IS 'Registros dos telefones das Instituições de Ensino.';


--
-- Name: COLUMN instituicoesdeensinotels.idinstituicaodeensinotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensinotels.idinstituicaodeensinotel IS 'PK da Tabela [pkinstituicaoensinotel]=(idinstituicaoensinotel)
';


--
-- Name: COLUMN instituicoesdeensinotels."instituicaoid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensinotels."instituicaoid	" IS 'FK [fk1instituicaoensinotel]=(instituicaoid) para a tabela instituições de ensino.
';


--
-- Name: COLUMN instituicoesdeensinotels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensinotels.tipotelefoneid IS 'FK [fk2instituicaoensinotel]=(tipotelefoneid) para a tabela telefonestipos
';


--
-- Name: COLUMN instituicoesdeensinotels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensinotels.nutelefone IS 'Número do telefone (somente números).';


--
-- Name: COLUMN instituicoesdeensinotels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensinotels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: COLUMN instituicoesdeensinotels."dtcadinstituicaoensinotel	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.instituicoesdeensinotels."dtcadinstituicaoensinotel	" IS 'Data de geração do registro.';


--
-- Name: livros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livros (
    idlivro integer NOT NULL,
    txtitulolivro character varying(90) NOT NULL,
    nuisbn bigint,
    editoraid integer DEFAULT NULL::numeric,
    dtpublicacao date,
    nuanopublicacao character(4) DEFAULT NULL::bpchar,
    qtpaginas smallint,
    qtexemplares smallint DEFAULT NULL::numeric,
    qtexemplaresconsulta numeric DEFAULT NULL::numeric,
    dtcadlivro date NOT NULL
);


ALTER TABLE public.livros OWNER TO postgres;

--
-- Name: TABLE livros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.livros IS 'Cadastro dos Livros que podem ser usados em bibliografias de disciplinas.';


--
-- Name: COLUMN livros.idlivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.idlivro IS 'Pk da Tabela [pklivro]=(idlivro).
';


--
-- Name: COLUMN livros.txtitulolivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.txtitulolivro IS 'Texto com o título do acervo';


--
-- Name: COLUMN livros.nuisbn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.nuisbn IS 'Número do ISBN (International Standard Book Number)';


--
-- Name: COLUMN livros.editoraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.editoraid IS 'FK [fk1livro]=(editoraid) com o código da editora que publicou o livro.
';


--
-- Name: COLUMN livros.dtpublicacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.dtpublicacao IS 'Data de publicação do Livro';


--
-- Name: COLUMN livros.nuanopublicacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.nuanopublicacao IS 'Ano de Publicação do Livro';


--
-- Name: COLUMN livros.qtpaginas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.qtpaginas IS 'Quantidade de páginas que tem o livro (sem contar capa e contracapa.';


--
-- Name: COLUMN livros.qtexemplares; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.qtexemplares IS 'Quantidade total do livro no acervo, é alterada no movimento de retirada';


--
-- Name: COLUMN livros.qtexemplaresconsulta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.qtexemplaresconsulta IS 'Quantidade mínima (em consulta) para o livro no acervo';


--
-- Name: COLUMN livros.dtcadlivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.livros.dtcadlivro IS 'Data de Geração do Registro.';


--
-- Name: logradouros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logradouros (
    idlogradouro integer NOT NULL,
    txnomelogradouro character varying(120) NOT NULL,
    cidadeid integer,
    tipologradouroid integer DEFAULT NULL::numeric,
    aotipodepiso character(1),
    dtcadlogradouro date NOT NULL
);


ALTER TABLE public.logradouros OWNER TO postgres;

--
-- Name: TABLE logradouros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.logradouros IS 'Cadastro dos logradouros.';


--
-- Name: COLUMN logradouros.idlogradouro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradouros.idlogradouro IS 'PK da Tabela [pklogradouro]=(idlogradouro).
';


--
-- Name: COLUMN logradouros.txnomelogradouro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradouros.txnomelogradouro IS 'Texto com o nome do logradouro com o tipo (praça, rua, etc.) indicado.';


--
-- Name: COLUMN logradouros.cidadeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradouros.cidadeid IS 'FK [fk1logradouro]=(cidadeid) para a tabela de Cidades.
';


--
-- Name: COLUMN logradouros.tipologradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradouros.tipologradouroid IS 'FK [fk2logradouro]=(tipologradouroid) para a tabela de Bairros.
';


--
-- Name: COLUMN logradouros.aotipodepiso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradouros.aotipodepiso IS 'Atributo Opoeracional - Valor dentro de uma restrita série de valores. Indica o tipo principal do pavimento do logradouro. 1-terra, 2-paralelepípedo, 3-asfalto.
';


--
-- Name: COLUMN logradouros.dtcadlogradouro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradouros.dtcadlogradouro IS 'Data de geração do registro.';


--
-- Name: logradourostipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logradourostipos (
    idlogradourotipo smallint NOT NULL,
    "txnometipologradouro	" character varying(250) NOT NULL,
    dtcadtipologradouro date NOT NULL
);


ALTER TABLE public.logradourostipos OWNER TO postgres;

--
-- Name: TABLE logradourostipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.logradourostipos IS 'Cadastro dos tipo de logradouros';


--
-- Name: COLUMN logradourostipos.idlogradourotipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradourostipos.idlogradourotipo IS 'PK da Tabela [pktipologradouro]=(idtipologradouro).
';


--
-- Name: COLUMN logradourostipos."txnometipologradouro	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradourostipos."txnometipologradouro	" IS 'Nome identificando o Tipo de Logradouro.
';


--
-- Name: COLUMN logradourostipos.dtcadtipologradouro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.logradourostipos.dtcadtipologradouro IS 'Data de geração do registro.
';


--
-- Name: logrcompleto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.logrcompleto AS
 SELECT logradouros.idlogradouro,
    concat(logradourostipos."txnometipologradouro	", ' ', logradouros.txnomelogradouro) AS txlogrcompleto,
    logradouros.cidadeid,
    logradouros.aotipodepiso,
    logradouros.dtcadlogradouro
   FROM (public.logradouros
     JOIN public.logradourostipos ON ((logradouros.tipologradouroid = logradourostipos.idlogradourotipo)))
  ORDER BY logradouros.idlogradouro;


ALTER VIEW public.logrcompleto OWNER TO postgres;

--
-- Name: VIEW logrcompleto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW public.logrcompleto IS 'Concatenação de dados das tabelas logradouros e logradourostipos';


--
-- Name: matriculas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matriculas (
    idmatricula integer NOT NULL,
    "turmaid	" smallint NOT NULL,
    funcionarioid smallint NOT NULL,
    dtmatricula date NOT NULL,
    dtvalidade date NOT NULL,
    dtcadmatricula date NOT NULL
);


ALTER TABLE public.matriculas OWNER TO postgres;

--
-- Name: TABLE matriculas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.matriculas IS 'Cadastro das matrículas dos funcionários em disciplinas que foram atribuídas aos professores. Tem uma chave primária simples, sequencial.';


--
-- Name: COLUMN matriculas.idmatricula; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.matriculas.idmatricula IS 'PK da Tabela [pkmatricula]=(idmatricula).
';


--
-- Name: COLUMN matriculas."turmaid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.matriculas."turmaid	" IS 'FK [fk1matricula]=(turmaid) com o código do atribuicao (que relaciona professores com disciplinas).
';


--
-- Name: COLUMN matriculas.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.matriculas.funcionarioid IS 'FK [fk2matricula]=(funcionarioid) com o código do funcionario.
';


--
-- Name: COLUMN matriculas.dtmatricula; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.matriculas.dtmatricula IS 'Data de Matrícula (pode ser diferente de dtcadmatricula).
';


--
-- Name: COLUMN matriculas.dtvalidade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.matriculas.dtvalidade IS 'Data de Validade da Matrícula (duração do vinculo funcionário-disciplina).';


--
-- Name: COLUMN matriculas.dtcadmatricula; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.matriculas.dtcadmatricula IS 'Data de geração do registro.';


--
-- Name: medicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicos (
    idmedico integer NOT NULL,
    txnomemedico character varying(200) NOT NULL,
    nucrm integer NOT NULL,
    especialidadeid smallint NOT NULL,
    "instituicaodeensinoid	" smallint,
    logradouromoradiaid integer DEFAULT NULL::numeric,
    txcomplementomoradia character varying(50) DEFAULT NULL::character varying,
    "logradouroclinicaid	" integer DEFAULT NULL::numeric,
    txcomplementoclinica character varying(50) DEFAULT NULL::character varying,
    aosituacao character(1),
    dtcadmedico date NOT NULL,
    nucepmoradia character(8),
    nucepclinica character(8)
);


ALTER TABLE public.medicos OWNER TO postgres;

--
-- Name: TABLE medicos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicos IS 'Cadastro de médicos.';


--
-- Name: COLUMN medicos.idmedico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.idmedico IS 'PK da Tabela [pkmedico]=(idmedico).
';


--
-- Name: COLUMN medicos.txnomemedico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.txnomemedico IS 'Nome completo e sem abreviação';


--
-- Name: COLUMN medicos.nucrm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.nucrm IS 'Número do registro do médico no Conselho Regional dos médicos.';


--
-- Name: COLUMN medicos.especialidadeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.especialidadeid IS 'FK [fk1medico]=(especialidadeid) com o código da especialidade médica
';


--
-- Name: COLUMN medicos."instituicaodeensinoid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos."instituicaodeensinoid	" IS 'FK [fk2medico]=(instituicaodeensinoid) com o código da instituição de ensino onde o médico se formou.
';


--
-- Name: COLUMN medicos.logradouromoradiaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.logradouromoradiaid IS 'FK [fk3medico]=(logradouromoradiaid) com o código do Logradouro de moradia do Médico
';


--
-- Name: COLUMN medicos.txcomplementomoradia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.txcomplementomoradia IS 'Texto com o complemento do logradouro de moradia do médico (número, andar, etc.)';


--
-- Name: COLUMN medicos."logradouroclinicaid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos."logradouroclinicaid	" IS 'FK [fk4medico]=(logradouroclinicaid) com o código do Logradouro da Clínica Principal do Médico.
';


--
-- Name: COLUMN medicos.txcomplementoclinica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.txcomplementoclinica IS 'Texto com o complemento do logradouro da clínica do médico (número, andar, etc.)';


--
-- Name: COLUMN medicos.aosituacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.aosituacao IS 'Atributo operacional com valor (A)tivado | (D)esativado';


--
-- Name: COLUMN medicos.dtcadmedico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.dtcadmedico IS 'Data de geração do registro.';


--
-- Name: COLUMN medicos.nucepmoradia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.nucepmoradia IS 'Número do CEP do Logradouro da Moradia do médico (somente números)';


--
-- Name: COLUMN medicos.nucepclinica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicos.nucepclinica IS 'Número do CEP do logradouro da clínica onde trabalhar o médico. Somente números.';


--
-- Name: medicostels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicostels (
    idmedicotel integer NOT NULL,
    medicoid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadmedicotel date
);


ALTER TABLE public.medicostels OWNER TO postgres;

--
-- Name: TABLE medicostels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicostels IS 'Registro dos Telefones dos medicos.';


--
-- Name: COLUMN medicostels.idmedicotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicostels.idmedicotel IS 'PK da Tabela [pkmedicotel]=(idmedicotel).
';


--
-- Name: COLUMN medicostels.medicoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicostels.medicoid IS 'FK [fk1medicotel]=(medicoid) para a tabela medicos.
';


--
-- Name: COLUMN medicostels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicostels.tipotelefoneid IS 'FK [fk2medicotel]=(tipotelefoneid) para a tabela telefonestipos
';


--
-- Name: COLUMN medicostels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicostels.nutelefone IS 'Número do telefone (somente números).';


--
-- Name: COLUMN medicostels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicostels.txnomecontato IS 'Nomes das pessoas que atendem como contato no telefone.';


--
-- Name: COLUMN medicostels.dtcadmedicotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicostels.dtcadmedicotel IS 'Data de geração do registro';


--
-- Name: movimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimentos (
    idmovimento integer NOT NULL,
    livroid integer DEFAULT NULL::numeric,
    funcionarioid smallint DEFAULT NULL::numeric,
    dtmovimento date,
    tipomovimentoid smallint DEFAULT NULL::numeric,
    dtprevistadevolucao date,
    dtrealdevolucao date,
    dtcadmovimento date NOT NULL
);


ALTER TABLE public.movimentos OWNER TO postgres;

--
-- Name: TABLE movimentos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.movimentos IS 'Registro de movimentos de livros realizados pelos funcionários.';


--
-- Name: COLUMN movimentos.idmovimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.idmovimento IS 'PK da Tabela [pkmovimento]=(idmovimento).
';


--
-- Name: COLUMN movimentos.livroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.livroid IS 'FK [fk1movimento]=(livroid) para a tabela livros (registrado no movimento).
';


--
-- Name: COLUMN movimentos.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.funcionarioid IS 'FK [fk2movimento]=(funcionarioid) para a tabela funcionarios (que faz o movimento).
';


--
-- Name: COLUMN movimentos.dtmovimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.dtmovimento IS 'Data de realização do movimento';


--
-- Name: COLUMN movimentos.tipomovimentoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.tipomovimentoid IS 'FK [fk3movimento]=(tipomovimentoid) para a tabela movimentostipos.
';


--
-- Name: COLUMN movimentos.dtprevistadevolucao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.dtprevistadevolucao IS 'Data prevista de devolução do livro';


--
-- Name: COLUMN movimentos.dtrealdevolucao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.dtrealdevolucao IS 'Data real da devolução';


--
-- Name: COLUMN movimentos.dtcadmovimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentos.dtcadmovimento IS 'Data de Geração do Registro.';


--
-- Name: movimentostipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimentostipos (
    idtipomovimento smallint NOT NULL,
    txnometipomov character varying(80) NOT NULL,
    aopermiteretirada character(1) NOT NULL,
    dtcadmovimtipo date NOT NULL
);


ALTER TABLE public.movimentostipos OWNER TO postgres;

--
-- Name: TABLE movimentostipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.movimentostipos IS 'Cadastro dos tipos de movimentos.';


--
-- Name: COLUMN movimentostipos.idtipomovimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentostipos.idtipomovimento IS 'PK da Tabela [pktipomovimento]=(idtipomovimento).
';


--
-- Name: COLUMN movimentostipos.txnometipomov; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentostipos.txnometipomov IS 'Nome do tipo de movimento (sem abreviações).';


--
-- Name: COLUMN movimentostipos.aopermiteretirada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentostipos.aopermiteretirada IS 'S|N para “permite” ou “não permite” retirada de exemplares do tipo da biblioteca.';


--
-- Name: COLUMN movimentostipos.dtcadmovimtipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.movimentostipos.dtcadmovimtipo IS 'Data de Geração do Registro.';


--
-- Name: nfcompras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfcompras (
    idnunfcompra integer NOT NULL,
    fornecedorid integer,
    funcionarioid smallint DEFAULT NULL::numeric,
    dtnfcompra date,
    vltotalnfcompra double precision,
    aosituacao character(1) DEFAULT NULL::bpchar,
    txcomentarios character varying(1000) DEFAULT NULL::character varying,
    dtcadnfcompra date NOT NULL
);


ALTER TABLE public.nfcompras OWNER TO postgres;

--
-- Name: TABLE nfcompras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.nfcompras IS 'Cadastro das Notas Fiscais de Compras. É a entidade forte entre nf_compras e nf_compras_itens.';


--
-- Name: COLUMN nfcompras.idnunfcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.idnunfcompra IS 'PK da Tabela [pknunfcompra]=(idnunfcompra).
';


--
-- Name: COLUMN nfcompras.fornecedorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.fornecedorid IS 'FK [fk1nunfcompra]=(fornecedorid) com o código do fornecedor da Nota de Compra
';


--
-- Name: COLUMN nfcompras.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.funcionarioid IS 'FK [fk2nunfcompra]=(funcionarioid) com o código do funcionário.
';


--
-- Name: COLUMN nfcompras.dtnfcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.dtnfcompra IS 'Data de realização da venda que gera a nota de venda.';


--
-- Name: COLUMN nfcompras.vltotalnfcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.vltotalnfcompra IS 'Valor total da Nota de Compra';


--
-- Name: COLUMN nfcompras.aosituacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.aosituacao IS 'Indicador da situação da Nota como "A" (a pagar) ou "P" (paga).';


--
-- Name: COLUMN nfcompras.txcomentarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.txcomentarios IS 'Comentário geral sobre a Nota de Compra';


--
-- Name: COLUMN nfcompras.dtcadnfcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcompras.dtcadnfcompra IS 'Data de Geração do Registro.';


--
-- Name: nfcomprasitens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfcomprasitens (
    nunfcompraid integer NOT NULL,
    produtoid character(12) DEFAULT (0)::numeric NOT NULL,
    qtcomprada numeric NOT NULL,
    vlunitario double precision NOT NULL
);


ALTER TABLE public.nfcomprasitens OWNER TO postgres;

--
-- Name: TABLE nfcomprasitens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.nfcomprasitens IS 'Cadastro das Notas Fiscais de Compras. É a entidade fraca entre nf_compras e nf_compras_itens.';


--
-- Name: COLUMN nfcomprasitens.nunfcompraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcomprasitens.nunfcompraid IS 'Parte da PK [pknfcompraitem]=(nunfcompraid,produtoid) (composta) e FK [fk1nfcompraitem]=(nunfcompraid) com o código da nota fiscal de venda
';


--
-- Name: COLUMN nfcomprasitens.produtoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcomprasitens.produtoid IS 'Parte da PK [pknfcompraitem]=(nunfcompraid,produtoid) (composta) e FK [fk2nfcompraitem]=(produtoid) apontando para a tabela Produtos.
';


--
-- Name: COLUMN nfcomprasitens.qtcomprada; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcomprasitens.qtcomprada IS 'Quantidade de produto vendida';


--
-- Name: COLUMN nfcomprasitens.vlunitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfcomprasitens.vlunitario IS 'Valor unitário do produto na Nota de venda (pode ser ? do valor do estoque)
';


--
-- Name: nfvendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfvendas (
    idnunfvenda integer NOT NULL,
    clienteid integer DEFAULT NULL::numeric,
    funcionarioid smallint DEFAULT NULL::numeric,
    armazemid smallint DEFAULT NULL::numeric,
    vltotalnfvenda double precision,
    dtvenda date DEFAULT '2014-04-25'::date NOT NULL,
    dtemissao date NOT NULL,
    dtcadnfvenda date NOT NULL
);


ALTER TABLE public.nfvendas OWNER TO postgres;

--
-- Name: TABLE nfvendas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.nfvendas IS 'Cadastro das Notas Fiscais de Vendas. É a entidade forte entre nf_vendas e nf_vendas_itens.';


--
-- Name: COLUMN nfvendas.idnunfvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.idnunfvenda IS 'PK da Tabela [pknunfvenda]=(idnunfvenda).
';


--
-- Name: COLUMN nfvendas.clienteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.clienteid IS 'FK [fk1nunfvenda]=(clienteid) para a tabela clientes (para o qual se faz a venda).
';


--
-- Name: COLUMN nfvendas.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.funcionarioid IS 'FK [fk2nunfvenda]=(funcionarioid) para a tabela funcionarios.
';


--
-- Name: COLUMN nfvendas.armazemid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.armazemid IS 'FK [fk3nunfvenda]=(armazemid) para a tabela armazens.
';


--
-- Name: COLUMN nfvendas.vltotalnfvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.vltotalnfvenda IS 'Valor total da nota fiscal de venda.';


--
-- Name: COLUMN nfvendas.dtvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.dtvenda IS 'Data de realização da venda que gera a nota de venda.';


--
-- Name: COLUMN nfvendas.dtemissao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.dtemissao IS 'Data de emissão da nota de venda.';


--
-- Name: COLUMN nfvendas.dtcadnfvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendas.dtcadnfvenda IS 'Data de Geração do Registfro.';


--
-- Name: nfvendasitens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfvendasitens (
    nunfvendaid integer NOT NULL,
    produtoid character(12) DEFAULT (0)::numeric NOT NULL,
    qtvendida integer NOT NULL,
    vlunitario double precision NOT NULL
);


ALTER TABLE public.nfvendasitens OWNER TO postgres;

--
-- Name: TABLE nfvendasitens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.nfvendasitens IS 'Cadastro das Notas Fiscais de Vendas. É a entidade fraca entre nf_vendas e nf_vendas_itens.';


--
-- Name: COLUMN nfvendasitens.nunfvendaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendasitens.nunfvendaid IS 'Parte da PK [pknfvendaitem]=(nunfvendaid,idprodutoid) (composta) e FK [fk1nfvendaitem]=(nunfvenda) com o código da nota fiscal de venda
';


--
-- Name: COLUMN nfvendasitens.produtoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendasitens.produtoid IS 'Parte da PK [pknfvendaitem]=(nunfvendaid,idprodutoid) (composta) e FK [fk2nfvendaitem]=(idprodutoid) apontando para a tabela Produtos.
';


--
-- Name: COLUMN nfvendasitens.qtvendida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendasitens.qtvendida IS 'Quantidade de produto vendida';


--
-- Name: COLUMN nfvendasitens.vlunitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nfvendasitens.vlunitario IS 'Valor unitário do produto na Nota de venda (pode ser ? do valor do estoque)';


--
-- Name: ocorrencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ocorrencias (
    idocorrencia integer NOT NULL,
    sinistroid integer NOT NULL,
    veiculoid integer NOT NULL,
    "numeroapoliceid	" integer NOT NULL,
    logradouroprincipalid integer NOT NULL,
    logradourosecundarioid integer,
    txlogradouroocorrencia character varying(250) NOT NULL,
    dtcadocorrencia date NOT NULL
);


ALTER TABLE public.ocorrencias OWNER TO postgres;

--
-- Name: TABLE ocorrencias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.ocorrencias IS 'Registros da ocorrência de Sinistros nos veículos segurados de uma seguradora.';


--
-- Name: COLUMN ocorrencias.idocorrencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.idocorrencia IS 'PK da Tabela [pkocorrencia]=(idocorrencia).
';


--
-- Name: COLUMN ocorrencias.sinistroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.sinistroid IS 'FK [fk1ocorrencia]=(sinistroid) indicando o código do sinistro
';


--
-- Name: COLUMN ocorrencias.veiculoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.veiculoid IS 'FK [fk2ocorrencia]=(veiculoid) indicando o código do veículo que sofreu o sinistro
';


--
-- Name: COLUMN ocorrencias."numeroapoliceid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias."numeroapoliceid	" IS 'FK [fk3ocorrencia]=(numeroapoliceid) para a tabela seguros (que cobre o sinistro do veículo).
';


--
-- Name: COLUMN ocorrencias.logradouroprincipalid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.logradouroprincipalid IS 'FK [fk4ocorrencia]=(logradouroprincipalid) com o código do Logradouro principal da ocorrência do sinistro.
';


--
-- Name: COLUMN ocorrencias.logradourosecundarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.logradourosecundarioid IS 'FK [fk5ocorrencia]=(logradourosecundarioid) com o código do Logradouro secundário da ocorrência do sinistro
';


--
-- Name: COLUMN ocorrencias.txlogradouroocorrencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.txlogradouroocorrencia IS 'Texto descrevendo os logradouros e localidade da ocorrência do sinistro.';


--
-- Name: COLUMN ocorrencias.dtcadocorrencia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ocorrencias.dtcadocorrencia IS 'Data de geração do registro.';


--
-- Name: oficinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oficinas (
    idoficina integer NOT NULL,
    txrazaosocial character varying(100) NOT NULL,
    nucnpj character(14),
    txapelido character varying(30),
    logradouroid integer,
    dtfundacao date,
    dtcadoficina date
);


ALTER TABLE public.oficinas OWNER TO postgres;

--
-- Name: TABLE oficinas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.oficinas IS 'Cadastro das Oficinas que prestam serviços para reparos em veículos.';


--
-- Name: COLUMN oficinas.idoficina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.idoficina IS 'PK da Tabela [pkoficina]=(idoficina).
';


--
-- Name: COLUMN oficinas.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.txrazaosocial IS 'Razão Social completa da Oficina segundo o cadastro do CNPJ';


--
-- Name: COLUMN oficinas.nucnpj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.nucnpj IS 'Número do CNPJ (Cadastro Nacional de Pessoas Jurídicas)';


--
-- Name: COLUMN oficinas.txapelido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.txapelido IS 'Nome de apelido da Oficina';


--
-- Name: COLUMN oficinas.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.logradouroid IS 'FK [fk1oficina]=(logradouroid) para a visão logrcompleto onde está a Oficina.
';


--
-- Name: COLUMN oficinas.dtfundacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.dtfundacao IS 'Data de fundação ou criação da oficina.';


--
-- Name: COLUMN oficinas.dtcadoficina; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinas.dtcadoficina IS 'Data de geração do registro.';


--
-- Name: oficinastels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oficinastels (
    idoficinatel integer NOT NULL,
    oficinaid integer NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadoficinatel date
);


ALTER TABLE public.oficinastels OWNER TO postgres;

--
-- Name: TABLE oficinastels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.oficinastels IS 'Registro dos Telefones das oficinas.';


--
-- Name: COLUMN oficinastels.idoficinatel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinastels.idoficinatel IS 'PK da Tabela [pkoficinatel]=(idoficinatel).
';


--
-- Name: COLUMN oficinastels.oficinaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinastels.oficinaid IS 'FK [fk1oficinatel]=(oficinaid) apontando para a tabela oficinas.
';


--
-- Name: COLUMN oficinastels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinastels.tipotelefoneid IS 'FK [fk2oficinatel]=(tipotelefoneid) apontando para a tabela telefonestipos
';


--
-- Name: COLUMN oficinastels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinastels.nutelefone IS 'Número do telefone (somente números).';


--
-- Name: COLUMN oficinastels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinastels.txnomecontato IS 'Nomes das pessoas que atendem como contato no telefone.';


--
-- Name: COLUMN oficinastels.dtcadoficinatel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.oficinastels.dtcadoficinatel IS 'Data de geração do registro.
';


--
-- Name: onibus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.onibus WITH (security_barrier='false') AS
 SELECT veiculos.idveiculo AS cponibus,
    veiculos.ukplaca,
    veiculos.modeloid AS modeloveiculoid,
    veiculos.txapelido,
    veiculos.qtcapacidade,
    veiculos.nuanofabricacao,
    veiculos.dtcadveiculo AS dtcadonibus
   FROM public.veiculos
  WHERE (veiculos.aocategoria = 'O'::bpchar);


ALTER VIEW public.onibus OWNER TO postgres;

--
-- Name: paises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paises (
    idpais character(3) NOT NULL,
    txnomepais character varying(200),
    dtcadpais date NOT NULL,
    txidiomafalado character varying
);


ALTER TABLE public.paises OWNER TO postgres;

--
-- Name: TABLE paises; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.paises IS 'Cadastro de Paises do planeta.';


--
-- Name: COLUMN paises.idpais; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paises.idpais IS 'PK da Tabela [pkpais]=(idpais).
';


--
-- Name: COLUMN paises.txnomepais; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paises.txnomepais IS 'Nome completo do país.
';


--
-- Name: COLUMN paises.dtcadpais; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paises.dtcadpais IS 'Data de geração do registro.
';


--
-- Name: COLUMN paises.txidiomafalado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.paises.txidiomafalado IS 'Texto com o nome do idioma falado no país.';


--
-- Name: palavraschaves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.palavraschaves (
    idpalavra integer NOT NULL,
    txnomepalavra character varying(30) NOT NULL,
    dtcadpalavrachave date NOT NULL
);


ALTER TABLE public.palavraschaves OWNER TO postgres;

--
-- Name: TABLE palavraschaves; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.palavraschaves IS 'Cadastro das palavras-chaves para pesquisa por palavras de exemplares de um acervo de uma biblioteca.';


--
-- Name: COLUMN palavraschaves.idpalavra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.palavraschaves.idpalavra IS 'PK da Tabela [pkpalavra]=(idpalavra).
';


--
-- Name: COLUMN palavraschaves.txnomepalavra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.palavraschaves.txnomepalavra IS 'Palavra-chave de pesquisa complete e se abreviações';


--
-- Name: COLUMN palavraschaves.dtcadpalavrachave; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.palavraschaves.dtcadpalavrachave IS 'Data de Geração do Registro.';


--
-- Name: palavraslivros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.palavraslivros (
    palavraid integer NOT NULL,
    livroid integer NOT NULL,
    dtcadpalchavelivro date NOT NULL
);


ALTER TABLE public.palavraslivros OWNER TO postgres;

--
-- Name: TABLE palavraslivros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.palavraslivros IS 'Registro das palavras-chaves de cada exemplar de um acervo.';


--
-- Name: COLUMN palavraslivros.palavraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.palavraslivros.palavraid IS 'Parte da PK [pkpalavralivro]=(palavraid,livroid) e FK [fk1palavralivro]=(palavraid) para a tabela palavraschaves.
';


--
-- Name: COLUMN palavraslivros.livroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.palavraslivros.livroid IS 'Parte da PK [pkpalavralivro]=(palavraid,livroid) e FK [fk2palavralivro]=(livroid) para a tabela livros
';


--
-- Name: COLUMN palavraslivros.dtcadpalchavelivro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.palavraslivros.dtcadpalchavelivro IS 'Data de geração do registro.
';


--
-- Name: passagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passagens (
    idpassagem integer NOT NULL,
    viagemid integer NOT NULL,
    onibusid smallint NOT NULL,
    nupoltrona integer NOT NULL,
    funcionarioid smallint DEFAULT NULL::numeric NOT NULL,
    dtcadpassagem date
);


ALTER TABLE public.passagens OWNER TO postgres;

--
-- Name: TABLE passagens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.passagens IS 'Cadastro das passagens vendidas para funcionários em cada ônibus para cada viagem.';


--
-- Name: COLUMN passagens.idpassagem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.passagens.idpassagem IS 'PK da Tabela [pkpassagem]=(idpassagem).
';


--
-- Name: COLUMN passagens.viagemid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.passagens.viagemid IS 'FK [fk1passagem]=(viagemid) com o código da viagem para o qual se vende a passagem
';


--
-- Name: COLUMN passagens.onibusid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.passagens.onibusid IS 'FK [fk2passagem]=(onibusid) com o código do ônibus para o qual se vende a passagem
';


--
-- Name: COLUMN passagens.nupoltrona; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.passagens.nupoltrona IS 'Indica o número da poltrona do ônibus que é alocada na venda da passagem
';


--
-- Name: COLUMN passagens.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.passagens.funcionarioid IS 'FK [fk3passagem]=(funcionarioid) com o código do funcionário que compra a passagem.
';


--
-- Name: COLUMN passagens.dtcadpassagem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.passagens.dtcadpassagem IS 'Data de geração do registro.';


--
-- Name: pedcompras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedcompras (
    idpedcompra integer NOT NULL,
    fornecedorid integer,
    funcionarioid smallint,
    dtpedcompra date,
    txcomentarios character varying(1000) DEFAULT NULL::character varying,
    vltotalpedcompra double precision,
    aosituacao character(1) DEFAULT NULL::bpchar,
    dtcadpedcompra date NOT NULL
);


ALTER TABLE public.pedcompras OWNER TO postgres;

--
-- Name: TABLE pedcompras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.pedcompras IS 'Cadastro das Ordens de Compras. É a entidade forte entre ord_compras e ord_compras_itens.';


--
-- Name: COLUMN pedcompras.idpedcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.idpedcompra IS 'PK da Tabela [pkpedcompra]=(idpedcompra).
';


--
-- Name: COLUMN pedcompras.fornecedorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.fornecedorid IS 'FK [fk1pedcompra]=(fornecedorid) para a tabela fornecedores (do Pedido de compra).
';


--
-- Name: COLUMN pedcompras.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.funcionarioid IS 'FK [fk2pedcompra]=(funcionarioid) para a tabela funcionários (que emitem o Pedido de Compra).
';


--
-- Name: COLUMN pedcompras.dtpedcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.dtpedcompra IS 'Data de realização do pedido de venda.';


--
-- Name: COLUMN pedcompras.txcomentarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.txcomentarios IS 'Texto com comentários complementares do pedido de compra.';


--
-- Name: COLUMN pedcompras.vltotalpedcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.vltotalpedcompra IS 'Valor total do Pedido  de compra';


--
-- Name: COLUMN pedcompras.aosituacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.aosituacao IS 'Atributo Operacional indicando: (A)berto|(E)ntregue|(P)ago.';


--
-- Name: COLUMN pedcompras.dtcadpedcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcompras.dtcadpedcompra IS 'Data de geração do registro.';


--
-- Name: pedcomprasitens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedcomprasitens (
    idpedcompraitem integer NOT NULL,
    pedcompraid integer NOT NULL,
    produtoid character(12) NOT NULL,
    qtpedcompra numeric NOT NULL,
    vlunitario double precision NOT NULL
);


ALTER TABLE public.pedcomprasitens OWNER TO postgres;

--
-- Name: TABLE pedcomprasitens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.pedcomprasitens IS 'Cadastro das Ordens de Compras. É a entidade fraca entre pedcompras e pedcompras_itens.';


--
-- Name: COLUMN pedcomprasitens.idpedcompraitem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcomprasitens.idpedcompraitem IS 'PK da Tabela [pkpedcompraitem]=(idpedcompraitem).

';


--
-- Name: COLUMN pedcomprasitens.pedcompraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcomprasitens.pedcompraid IS 'Parte da UK [uk1pedcompraitem]=(pedcompraid,produtoid) (composta) e FK [fk1pedcompraitem]=(pedcompraid) para a tabela pedcompras
';


--
-- Name: COLUMN pedcomprasitens.produtoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcomprasitens.produtoid IS 'Parte da UK [uk1pedcompraitem]=(pedcompraid,produtoid) (composta) e FK [fk2pedcompraitem]=(produtoid) para a tabela produtos.
';


--
-- Name: COLUMN pedcomprasitens.qtpedcompra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcomprasitens.qtpedcompra IS 'Quantidade de produtos da compra';


--
-- Name: COLUMN pedcomprasitens.vlunitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedcomprasitens.vlunitario IS 'Valor unitário negociado com o fornecedor';


--
-- Name: pedvendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedvendas (
    idpedvenda smallint NOT NULL,
    clienteid integer,
    funcionarioid smallint,
    dtpedvenda date,
    txcomentarios character varying(1000) DEFAULT NULL::character varying,
    vltotalpedvenda double precision,
    aosituacao character(1) DEFAULT NULL::bpchar,
    dtcadpedvenda date NOT NULL
);


ALTER TABLE public.pedvendas OWNER TO postgres;

--
-- Name: TABLE pedvendas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.pedvendas IS 'Cadastro dos Pedidos de Vendas. É a entidade forte entre pedvendas e pedvendasitens.';


--
-- Name: COLUMN pedvendas.idpedvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.idpedvenda IS 'PK da Tabela [pkpedvenda]=(idpedvenda).
';


--
-- Name: COLUMN pedvendas.clienteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.clienteid IS 'FK [fk1pedvenda]=(clienteid) para a tabela clientes.
';


--
-- Name: COLUMN pedvendas.funcionarioid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.funcionarioid IS 'FK [fk2pedvenda]=(funcionarioid) para a tabela funcionarios.
';


--
-- Name: COLUMN pedvendas.dtpedvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.dtpedvenda IS 'Data de realização do Pedido de Venda';


--
-- Name: COLUMN pedvendas.txcomentarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.txcomentarios IS 'Texto com comentarios complementares do pedido de venda.';


--
-- Name: COLUMN pedvendas.vltotalpedvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.vltotalpedvenda IS 'Valor total do pedido de venda';


--
-- Name: COLUMN pedvendas.aosituacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.aosituacao IS 'Atributo Operacional indicando: (A)berto|(E)ntregue|(P)ago';


--
-- Name: COLUMN pedvendas.dtcadpedvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendas.dtcadpedvenda IS 'Data de geração do registro.';


--
-- Name: pedvendasitens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedvendasitens (
    idpedvendaitem smallint NOT NULL,
    pedvendaid smallint NOT NULL,
    produtoid character(12) NOT NULL,
    qtvenda numeric NOT NULL,
    vlunitario double precision NOT NULL
);


ALTER TABLE public.pedvendasitens OWNER TO postgres;

--
-- Name: TABLE pedvendasitens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.pedvendasitens IS 'Cadastro dos Pedidos de Vendas. É a entidade fraca entre pedvendas e pedvendasitens.
';


--
-- Name: COLUMN pedvendasitens.idpedvendaitem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendasitens.idpedvendaitem IS 'PK da Tabela [pkpedvendaitem]=(idpedvendaitem).
';


--
-- Name: COLUMN pedvendasitens.pedvendaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendasitens.pedvendaid IS 'Parte da UK [uk1pedvendaitem]=(pedvendaid,produtoid) e FK [fk1pedvendaitem]=(pedvendaid) para a tabela pedvendas
';


--
-- Name: COLUMN pedvendasitens.produtoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendasitens.produtoid IS 'Parte da UK [uk1pedvendaitem]=(pedvendaid,produtoid) e FK [fk2pedvendaitem]=(produtoid) para a tabela produtos.
';


--
-- Name: COLUMN pedvendasitens.qtvenda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendasitens.qtvenda IS 'Quantidade da venda';


--
-- Name: COLUMN pedvendasitens.vlunitario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pedvendasitens.vlunitario IS 'Valor unitário negociado com o cliente';


--
-- Name: planosdesaude; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planosdesaude (
    idplanodesaude integer NOT NULL,
    txnomeplano character varying(200) NOT NULL,
    txrazaosocial character varying(250) DEFAULT NULL::character varying,
    nucnpj character(15),
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    dtcadplanosaude date NOT NULL
);


ALTER TABLE public.planosdesaude OWNER TO postgres;

--
-- Name: TABLE planosdesaude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.planosdesaude IS 'Cadastro dos planos de saúde.';


--
-- Name: COLUMN planosdesaude.idplanodesaude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.idplanodesaude IS 'PK da Tabela [pkplanodesaude]=(idplanodesaude).
';


--
-- Name: COLUMN planosdesaude.txnomeplano; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.txnomeplano IS 'Nome completo e usual para o plano de saúde';


--
-- Name: COLUMN planosdesaude.txrazaosocial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.txrazaosocial IS 'Razão social completa.';


--
-- Name: COLUMN planosdesaude.nucnpj; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.nucnpj IS 'Número no Cadastro Nacional de Pessoas Jurídicas (empresas), atribuído pelo ministério da economia.
';


--
-- Name: COLUMN planosdesaude.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.logradouroid IS 'FK [fk1planodesaude]=(logradouroid) para a visão logrcompleto onde está o escritório do Plano de Saúde.
';


--
-- Name: COLUMN planosdesaude.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN planosdesaude.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.nucep IS 'Número do CEP';


--
-- Name: COLUMN planosdesaude.dtcadplanosaude; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaude.dtcadplanosaude IS 'Data de Geração do Registro.';


--
-- Name: planosdesaudemedicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planosdesaudemedicos (
    "idplanosaudemed	" integer NOT NULL,
    planodesaudeid integer NOT NULL,
    medicoid integer NOT NULL,
    dtassociacao date NOT NULL,
    dtcadplanomedico date NOT NULL,
    dtdesligamento date
);


ALTER TABLE public.planosdesaudemedicos OWNER TO postgres;

--
-- Name: TABLE planosdesaudemedicos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.planosdesaudemedicos IS 'Cadastro dos planos de saúde - Médicos.';


--
-- Name: COLUMN planosdesaudemedicos."idplanosaudemed	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudemedicos."idplanosaudemed	" IS 'PK da Tabela [pkplanosaudemed]=(idplanosaudemed).
';


--
-- Name: COLUMN planosdesaudemedicos.planodesaudeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudemedicos.planodesaudeid IS 'FK [fk1planosaudemed]=(planodesaudeid) para a tabela planosdesaude.
';


--
-- Name: COLUMN planosdesaudemedicos.medicoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudemedicos.medicoid IS 'FK [fk2planosaudemed]=(medicoid) para a tabela medicos.
';


--
-- Name: COLUMN planosdesaudemedicos.dtassociacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudemedicos.dtassociacao IS 'Data de associação do médico ao plano de saúde.';


--
-- Name: COLUMN planosdesaudemedicos.dtcadplanomedico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudemedicos.dtcadplanomedico IS 'Data de geração do registro.
';


--
-- Name: COLUMN planosdesaudemedicos.dtdesligamento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudemedicos.dtdesligamento IS 'Data de desligamento de um médico como participante como atendente de um Plano de Saúde.
';


--
-- Name: planosdesaudetels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planosdesaudetels (
    idplanostel smallint NOT NULL,
    planodesaudeid smallint NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadplanotel date
);


ALTER TABLE public.planosdesaudetels OWNER TO postgres;

--
-- Name: TABLE planosdesaudetels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.planosdesaudetels IS 'Registro dos telefones de cada Plano de Saúde.';


--
-- Name: COLUMN planosdesaudetels.idplanostel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudetels.idplanostel IS 'PK da Tabela [pkplanotel]=(idplanostel).
';


--
-- Name: COLUMN planosdesaudetels.planodesaudeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudetels.planodesaudeid IS 'FK [fk1planotel]=(planodesaudeid) para a tabela planos de saúde
';


--
-- Name: COLUMN planosdesaudetels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudetels.tipotelefoneid IS 'FK [fk2planotel]=(tipotelefoneid) para a tabela telefonestipos
';


--
-- Name: COLUMN planosdesaudetels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudetels.nutelefone IS 'Número do telefone (somente os números)';


--
-- Name: COLUMN planosdesaudetels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudetels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: COLUMN planosdesaudetels.dtcadplanotel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.planosdesaudetels.dtcadplanotel IS 'Data de geração do registro.';


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    idproduto character(12) NOT NULL,
    txnomeproduto character varying(128) DEFAULT NULL::character varying,
    vlpreco numeric(9,2) DEFAULT NULL::numeric,
    vlprecopromocao numeric(9,2) DEFAULT NULL::numeric,
    vlprecominimo numeric(9,2),
    qtestoque numeric(8,0),
    qtdiaspromocao smallint DEFAULT NULL::numeric,
    txdescricaocompleta character varying(2000) DEFAULT NULL::character varying,
    dtcadproduto date NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: TABLE produtos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.produtos IS 'Cadastro dos produtos que são feitos e vendidos pela empresa onde o funcionário trabalha.';


--
-- Name: COLUMN produtos.idproduto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.idproduto IS 'PK da Tabela [pkproduto]=(idproduto).
';


--
-- Name: COLUMN produtos.txnomeproduto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.txnomeproduto IS 'Nome completo e usual';


--
-- Name: COLUMN produtos.vlpreco; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.vlpreco IS 'Valor do preço';


--
-- Name: COLUMN produtos.vlprecopromocao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.vlprecopromocao IS 'Valor do preço de venda para promoção (com desconto máximo)';


--
-- Name: COLUMN produtos.vlprecominimo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.vlprecominimo IS 'Valor do preço mínimo (contabilizando os custos de produção)';


--
-- Name: COLUMN produtos.qtestoque; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.qtestoque IS 'Quantidade do produto em estoque (até 99999.99)';


--
-- Name: COLUMN produtos.qtdiaspromocao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.qtdiaspromocao IS 'Quant. De dias para execução de uma promoção do produto';


--
-- Name: COLUMN produtos.txdescricaocompleta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.txdescricaocompleta IS 'Texto com a descrição complete do produto.';


--
-- Name: COLUMN produtos.dtcadproduto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.produtos.dtcadproduto IS 'Data de geração do registro.';


--
-- Name: professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professores (
    idprofessor smallint NOT NULL,
    txnomeprofessor character varying(250) NOT NULL,
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    dtnascimento date,
    dtcadprofessor date
);


ALTER TABLE public.professores OWNER TO postgres;

--
-- Name: TABLE professores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.professores IS 'Professores de uma Instituição de ensino';


--
-- Name: COLUMN professores.idprofessor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.idprofessor IS 'PK da Tabela [pkprofessor]=(idprofessor).
';


--
-- Name: COLUMN professores.txnomeprofessor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.txnomeprofessor IS 'Nome completo e sem abreviações';


--
-- Name: COLUMN professores.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.logradouroid IS 'FK [fk1professor]=(logradouroid) para a visão logrcompleto onde está a residência do Professor.
';


--
-- Name: COLUMN professores.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.txcomplemento IS 'Texto com o complemento do logradouro comercial do cliente (número, andar, etc.)';


--
-- Name: COLUMN professores.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN professores.dtnascimento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.dtnascimento IS 'Data de Nascimento';


--
-- Name: COLUMN professores.dtcadprofessor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professores.dtcadprofessor IS 'Data de geração do registro.';


--
-- Name: professorestels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professorestels (
    idprofessortel integer NOT NULL,
    professorid smallint NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    dtcadprofessortel date
);


ALTER TABLE public.professorestels OWNER TO postgres;

--
-- Name: TABLE professorestels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.professorestels IS 'Registro dos telefones de cada professor.';


--
-- Name: COLUMN professorestels.idprofessortel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professorestels.idprofessortel IS 'PK da Tabela [pkprofessortel]=(idprofessortel).
';


--
-- Name: COLUMN professorestels.professorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professorestels.professorid IS 'FK [fk1professortel]=(professorid) para a tabela professores
';


--
-- Name: COLUMN professorestels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professorestels.tipotelefoneid IS 'FK [fk2professortel]=(tipotelefoneid) para a tabela telefonestipos
';


--
-- Name: COLUMN professorestels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professorestels.nutelefone IS 'Número do telefone (somente os números)';


--
-- Name: COLUMN professorestels.dtcadprofessortel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.professorestels.dtcadprofessortel IS 'Data de geração do registro.';


--
-- Name: projetos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projetos (
    idprojeto character(6) NOT NULL,
    txnomeprojeto character varying(90) DEFAULT ''::character varying NOT NULL,
    deptoid character(3) DEFAULT NULL::bpchar,
    funcionarioresponsavelid smallint DEFAULT NULL::numeric,
    vlestimado numeric(13,2),
    dtinicio date,
    dttermino date,
    "projetosuperiorid	" character(6) DEFAULT NULL::bpchar,
    dtcadprojeto date NOT NULL
);


ALTER TABLE public.projetos OWNER TO postgres;

--
-- Name: TABLE projetos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.projetos IS 'Cadastro dos projetos que são desenvolvidos pelos funcionários de uma empresa.';


--
-- Name: COLUMN projetos.idprojeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.idprojeto IS 'PK da Tabela [pkprojeto]=(idprojeto).
';


--
-- Name: COLUMN projetos.txnomeprojeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.txnomeprojeto IS 'Nome completo e sem abreviações.';


--
-- Name: COLUMN projetos.deptoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.deptoid IS 'FK [fk1projeto]=(deptoid) com o código do departamento que lidera ou coordena o projeto
';


--
-- Name: COLUMN projetos.funcionarioresponsavelid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.funcionarioresponsavelid IS 'FK [fk2projeto]=(funcionarioresponsavelid) com o código do funcionário responsável pelo projeto
';


--
-- Name: COLUMN projetos.vlestimado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.vlestimado IS 'Valor estimado do projeto.';


--
-- Name: COLUMN projetos.dtinicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.dtinicio IS 'Data de inicio do projeto (após conclusão de estudos de viabilidade).';


--
-- Name: COLUMN projetos.dttermino; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.dttermino IS 'Data de término do projeto (após a declaração de aceite dos interessados).';


--
-- Name: COLUMN projetos."projetosuperiorid	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos."projetosuperiorid	" IS 'FK [fk3projeto]=(projetosuperiorid) com o código de projeto superior (havendo subordinação).
';


--
-- Name: COLUMN projetos.dtcadprojeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.projetos.dtcadprojeto IS 'Data de geração do registro.';


--
-- Name: rotasviarias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rotasviarias (
    idrota numeric NOT NULL,
    txnomerota character varying(60) NOT NULL,
    txdescrperiodo character varying(250) NOT NULL,
    cidadeorigemid smallint DEFAULT NULL::numeric,
    cidadedestinoid smallint DEFAULT NULL::numeric,
    dtcadrotaviaria date NOT NULL
);


ALTER TABLE public.rotasviarias OWNER TO postgres;

--
-- Name: TABLE rotasviarias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.rotasviarias IS 'Cadastro das rotas viárias de viagens entre cidades.';


--
-- Name: COLUMN rotasviarias.idrota; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rotasviarias.idrota IS 'PK da Tabela [pkrota]=(idrota).
';


--
-- Name: COLUMN rotasviarias.txnomerota; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rotasviarias.txnomerota IS 'Nome completo e sem abreviações.';


--
-- Name: COLUMN rotasviarias.txdescrperiodo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rotasviarias.txdescrperiodo IS 'Texto com a descrição do período de ocorrência de viagens na rota viária';


--
-- Name: COLUMN rotasviarias.cidadeorigemid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rotasviarias.cidadeorigemid IS 'FK [fk1rota]=(cidadeorigemid) com o código da cidade de origem da rota viária
';


--
-- Name: COLUMN rotasviarias.cidadedestinoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rotasviarias.cidadedestinoid IS 'FK [fk2rota]=(cidadedestinoid) com o código da cidade de destino da rota viária
';


--
-- Name: COLUMN rotasviarias.dtcadrotaviaria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.rotasviarias.dtcadrotaviaria IS 'Data de geração do registro.';


--
-- Name: roteiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roteiros (
    idroteiro integer NOT NULL,
    rotaid numeric NOT NULL,
    cidadeid smallint NOT NULL,
    nuordem character(3),
    dtcadroteiro date
);


ALTER TABLE public.roteiros OWNER TO postgres;

--
-- Name: TABLE roteiros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.roteiros IS 'Cadastro dos roteiros de cada Rota Viária. É a lista de cidades por onde um ônibus passa em uma rota.';


--
-- Name: COLUMN roteiros.idroteiro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roteiros.idroteiro IS 'PK da Tabela [pkroteiro]=(idroteiro). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN roteiros.rotaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roteiros.rotaid IS 'FK [fk1roteiro]=(rotaid) apontando para a tabela rotas_viarias e parte da PK composta da Tabela.
';


--
-- Name: COLUMN roteiros.cidadeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roteiros.cidadeid IS 'FK [fk2roteiro]=(cidadeid) apontando para a tabela cidades e parte da PK composta da Tabela.
';


--
-- Name: COLUMN roteiros.nuordem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roteiros.nuordem IS 'Número indicando a ordem das cidades dentro de uma rota viária.';


--
-- Name: COLUMN roteiros.dtcadroteiro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roteiros.dtcadroteiro IS 'Data de geração do registro.';


--
-- Name: seguradoras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguradoras (
    idseguradora smallint NOT NULL,
    txnomeseguradora character varying(250) NOT NULL,
    logradouroid integer DEFAULT NULL::numeric,
    txcomplemento character varying(25) DEFAULT NULL::character varying,
    nucep character(8) DEFAULT NULL::bpchar,
    dtcadseguradora date NOT NULL
);


ALTER TABLE public.seguradoras OWNER TO postgres;

--
-- Name: TABLE seguradoras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.seguradoras IS 'Cadastro das Seguradoras de valores.';


--
-- Name: COLUMN seguradoras.idseguradora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradoras.idseguradora IS 'PK da Tabela [pkseguradora]=(idseguradora).
';


--
-- Name: COLUMN seguradoras.txnomeseguradora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradoras.txnomeseguradora IS 'Nome completo e sem abreviações.';


--
-- Name: COLUMN seguradoras.logradouroid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradoras.logradouroid IS 'FK [fk1seguradora]=(logradouroid) para a visão logrcompleto onde está a sede da seguradora.
';


--
-- Name: COLUMN seguradoras.txcomplemento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradoras.txcomplemento IS 'Texto com o complemento do logradouro da seguradora (número, andar, etc.)';


--
-- Name: COLUMN seguradoras.nucep; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradoras.nucep IS 'Número do CEP (somente números).';


--
-- Name: COLUMN seguradoras.dtcadseguradora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradoras.dtcadseguradora IS 'Data de geração do registro.';


--
-- Name: seguradorastels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguradorastels (
    idseguradoratel smallint NOT NULL,
    seguradoraid smallint NOT NULL,
    tipotelefoneid smallint DEFAULT NULL::numeric,
    nutelefone character(15) NOT NULL,
    txnomecontato character varying(30),
    dtcadseguradoratel date
);


ALTER TABLE public.seguradorastels OWNER TO postgres;

--
-- Name: TABLE seguradorastels; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.seguradorastels IS 'Cadastro dos telefones de cada Seguradora.';


--
-- Name: COLUMN seguradorastels.idseguradoratel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradorastels.idseguradoratel IS 'PK da Tabela [pkseguradoratel]=(idseguradoratel).
';


--
-- Name: COLUMN seguradorastels.seguradoraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradorastels.seguradoraid IS 'FK [fk1seguradoratel]=(seguradoraid) apontando para a tabela Seguradoras.
';


--
-- Name: COLUMN seguradorastels.tipotelefoneid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradorastels.tipotelefoneid IS 'FK [fk2seguradoratel]=(tipotelefoneid) apontando para a tabela telefonestipos.
';


--
-- Name: COLUMN seguradorastels.nutelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradorastels.nutelefone IS 'Número do telefone (somente os números)';


--
-- Name: COLUMN seguradorastels.txnomecontato; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradorastels.txnomecontato IS 'Nome de uma pessoa que atende como contato no telefone.';


--
-- Name: COLUMN seguradorastels.dtcadseguradoratel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguradorastels.dtcadseguradoratel IS 'Data de geração do registro.';


--
-- Name: seguros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguros (
    "idnumeroapolice	" integer NOT NULL,
    veiculoid integer NOT NULL,
    seguradoraid smallint NOT NULL,
    dtcontratacao date NOT NULL,
    dtlimitecobertura date NOT NULL,
    vlcobertura numeric(8,2) NOT NULL,
    dtcadseguro date NOT NULL
);


ALTER TABLE public.seguros OWNER TO postgres;

--
-- Name: TABLE seguros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.seguros IS 'Cadastro dos Seguros assumidos para cada Seguradora.';


--
-- Name: COLUMN seguros."idnumeroapolice	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros."idnumeroapolice	" IS 'PK da Tabela [pkseguro]=(idnumeroapolice) (assumindo que as seguradoras tenham um cadastro único de apólices de seguros)
';


--
-- Name: COLUMN seguros.veiculoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros.veiculoid IS 'FK [fk1seguro]=(veiculoid) com o código do veículo (pode ser carro ou ônibus).
';


--
-- Name: COLUMN seguros.seguradoraid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros.seguradoraid IS 'FK [fk2seguro]=(seguradoraid) apontando para a tabela Seguradoras.
';


--
-- Name: COLUMN seguros.dtcontratacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros.dtcontratacao IS 'Data de contratação do Seguro na Seguradora.';


--
-- Name: COLUMN seguros.dtlimitecobertura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros.dtlimitecobertura IS 'Data limite da cobertura do seguro.';


--
-- Name: COLUMN seguros.vlcobertura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros.vlcobertura IS 'Valor da cobertura da apólice de seguro.';


--
-- Name: COLUMN seguros.dtcadseguro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.seguros.dtcadseguro IS 'Data de geração do registro.';


--
-- Name: servicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicos (
    idservico integer NOT NULL,
    txnomeservico character varying(90),
    txdescricao character varying(250),
    vlestimado double precision,
    dtcadservico date
);


ALTER TABLE public.servicos OWNER TO postgres;

--
-- Name: TABLE servicos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.servicos IS 'Cadastro dos serviços oferecidos pelas oficinas que cobrem os sinistros das seguradoras.';


--
-- Name: COLUMN servicos.idservico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicos.idservico IS 'PK da Tabela [pkservico]=(idservico).
';


--
-- Name: COLUMN servicos.txnomeservico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicos.txnomeservico IS 'Nome simples do serviço com palavras sem abreviações.';


--
-- Name: COLUMN servicos.txdescricao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicos.txdescricao IS 'Descrição do que é feito no serviço. Palavras sem abreviações.';


--
-- Name: COLUMN servicos.vlestimado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicos.vlestimado IS 'Valor aproximado do serviço.';


--
-- Name: COLUMN servicos.dtcadservico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicos.dtcadservico IS 'Data de geração do registro.';


--
-- Name: servicosfeitospor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicosfeitospor (
    idservicofeitopor integer NOT NULL,
    oficinaid integer NOT NULL,
    servicoid integer NOT NULL,
    txdescricaocomplementar character varying(250),
    nudiasprevistos smallint,
    dtcadfeitopor date
);


ALTER TABLE public.servicosfeitospor OWNER TO postgres;

--
-- Name: TABLE servicosfeitospor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.servicosfeitospor IS 'Registros dos Serviços feitos pelas oficinas.';


--
-- Name: COLUMN servicosfeitospor.idservicofeitopor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosfeitospor.idservicofeitopor IS 'PK da Tabela [pkservicofeitopor]=(idservicofeitopor). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN servicosfeitospor.oficinaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosfeitospor.oficinaid IS 'FK [fk1servicofeitopor]=(oficinaid) para tabela oficinas (que realiza um serviço).
';


--
-- Name: COLUMN servicosfeitospor.servicoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosfeitospor.servicoid IS 'FK [fk2servicofeitopor]=(servicoid) para tabela serviços (prestados por uma oficina).
';


--
-- Name: COLUMN servicosfeitospor.txdescricaocomplementar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosfeitospor.txdescricaocomplementar IS 'Descrição complementar do serviço prestado (se preciso).
';


--
-- Name: COLUMN servicosfeitospor.nudiasprevistos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosfeitospor.nudiasprevistos IS 'Prazo inicialmente previsto para o serviço.
';


--
-- Name: COLUMN servicosfeitospor.dtcadfeitopor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosfeitospor.dtcadfeitopor IS 'Data de geração do registro.';


--
-- Name: servicosprestados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicosprestados (
    idservicoprestado integer NOT NULL,
    servicofeitoporid integer,
    veiculoid integer,
    txdescricaoproblema character varying(250),
    txdescricaosolucao character varying(250),
    vlestimado double precision,
    dtprevinicio date,
    dtprevtermino date,
    vlcobrado double precision DEFAULT NULL::numeric,
    dtrealinicio date,
    dtrealtermino date,
    dtcadservicoprestado date
);


ALTER TABLE public.servicosprestados OWNER TO postgres;

--
-- Name: TABLE servicosprestados; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.servicosprestados IS 'Registro com os serviços de manutenção feitos em cada ônibus ou carro.';


--
-- Name: COLUMN servicosprestados.idservicoprestado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.idservicoprestado IS 'PK da Tabela [pkservicoprestado]=(idservicoprestado)
';


--
-- Name: COLUMN servicosprestados.servicofeitoporid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.servicofeitoporid IS 'FK [fk1servicoprestado]=(servicofeitoporid) apontando para a tabela servicos que são feitos nos veículos (ônibus ou carros).
';


--
-- Name: COLUMN servicosprestados.veiculoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.veiculoid IS 'FK [fk2servicoprestado]=(veiculoid) com o código do veículo (ônibus ou carros) no qual se faz um serviço.
';


--
-- Name: COLUMN servicosprestados.txdescricaoproblema; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.txdescricaoproblema IS 'Descrição do problema apresentado pelo veículo (sem abreviações).
';


--
-- Name: COLUMN servicosprestados.txdescricaosolucao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.txdescricaosolucao IS 'Descrição da solução indicada para o veículo (sem abreviações).
';


--
-- Name: COLUMN servicosprestados.vlestimado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.vlestimado IS 'Valor estimado do serviço realizado no veículo.
';


--
-- Name: COLUMN servicosprestados.dtprevinicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.dtprevinicio IS 'Data prevista para inicio da prestação de serviço.
';


--
-- Name: COLUMN servicosprestados.dtprevtermino; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.dtprevtermino IS 'Data prevista para término da prestação de serviço.
';


--
-- Name: COLUMN servicosprestados.vlcobrado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.vlcobrado IS 'Valor final cobrado pela prestação do serviço feito pela oficina no veículo.
';


--
-- Name: COLUMN servicosprestados.dtrealinicio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.dtrealinicio IS 'Data de inicio da prestação do serviço.
';


--
-- Name: COLUMN servicosprestados.dtrealtermino; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.dtrealtermino IS 'Data de término da prestação do serviço.
';


--
-- Name: COLUMN servicosprestados.dtcadservicoprestado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.servicosprestados.dtcadservicoprestado IS 'Data de geração do registro.
';


--
-- Name: setoresdeatuacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setoresdeatuacao (
    idsetoratuacao smallint NOT NULL,
    txnomesetordeatuacao character varying(90) NOT NULL,
    txdescricaosetordeatuacao character varying(250) NOT NULL,
    dtcadsetordeatuacao date NOT NULL
);


ALTER TABLE public.setoresdeatuacao OWNER TO postgres;

--
-- Name: TABLE setoresdeatuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.setoresdeatuacao IS 'Cadastro dos setores de atuação das empresas onde funcionários já trabalharam.';


--
-- Name: COLUMN setoresdeatuacao.idsetoratuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.setoresdeatuacao.idsetoratuacao IS 'PK da Tabela [pksetoratuacao]=(idsetoratuacao).
';


--
-- Name: COLUMN setoresdeatuacao.txnomesetordeatuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.setoresdeatuacao.txnomesetordeatuacao IS 'Nome completo e sem abreviações';


--
-- Name: COLUMN setoresdeatuacao.txdescricaosetordeatuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.setoresdeatuacao.txdescricaosetordeatuacao IS 'Texto descrevendo o que se desenvolve no setor de atuação.';


--
-- Name: COLUMN setoresdeatuacao.dtcadsetordeatuacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.setoresdeatuacao.dtcadsetordeatuacao IS 'Data de geração do registro.';


--
-- Name: sinistros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinistros (
    idsinistro integer NOT NULL,
    txnomesinistro character varying(90) NOT NULL,
    txdescricaosinistro character varying(250) NOT NULL,
    dtcadsinistro date NOT NULL
);


ALTER TABLE public.sinistros OWNER TO postgres;

--
-- Name: TABLE sinistros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.sinistros IS 'Cadastro dos Sinistros (acidentes) que podem ocorrer nos veículos segurados de uma seguradora.';


--
-- Name: COLUMN sinistros.idsinistro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sinistros.idsinistro IS 'PK da Tabela [pksinistro]=(idsinistro).
';


--
-- Name: COLUMN sinistros.txnomesinistro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sinistros.txnomesinistro IS 'Denominação formal do sinistro.';


--
-- Name: COLUMN sinistros.txdescricaosinistro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sinistros.txdescricaosinistro IS 'Descrição completa do sinistro (usando termos jurídicos).';


--
-- Name: COLUMN sinistros.dtcadsinistro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sinistros.dtcadsinistro IS 'Data de geração do registro.';


--
-- Name: tarefas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarefas (
    idtarefa smallint NOT NULL,
    txnometarefa character(40) NOT NULL,
    txdescricaotarefa character varying(250) NOT NULL,
    qthoraspadrao smallint DEFAULT NULL::numeric,
    dtcadtarefa date
);


ALTER TABLE public.tarefas OWNER TO postgres;

--
-- Name: TABLE tarefas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tarefas IS 'Cadastro das tarefas que podem ser desenvolvidas pelos funcionários em projetos.';


--
-- Name: COLUMN tarefas.idtarefa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefas.idtarefa IS 'PK da Tabela [pktarefa]=(idtarefa).
';


--
-- Name: COLUMN tarefas.txnometarefa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefas.txnometarefa IS 'Nome curto da ação de projeto (sem abreviações).';


--
-- Name: COLUMN tarefas.txdescricaotarefa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefas.txdescricaotarefa IS 'Descrição completa de uma ação que é usada em projetos.';


--
-- Name: COLUMN tarefas.qthoraspadrao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefas.qthoraspadrao IS 'Quantidade de Horas padrão para a ação em qualquer projeto.';


--
-- Name: COLUMN tarefas.dtcadtarefa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefas.dtcadtarefa IS 'Data de geração do registro.';


--
-- Name: tarefasprojetos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarefasprojetos (
    idtarefaprojeto integer NOT NULL,
    projetoid character(6) NOT NULL,
    tarefaid smallint NOT NULL,
    qthorasenvolvidas integer NOT NULL,
    nuordem smallint DEFAULT NULL::numeric,
    dtcadtarefaprojeto date
);


ALTER TABLE public.tarefasprojetos OWNER TO postgres;

--
-- Name: TABLE tarefasprojetos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tarefasprojetos IS 'Registro das tarefas que são necessárisa em cada projeto.';


--
-- Name: COLUMN tarefasprojetos.idtarefaprojeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefasprojetos.idtarefaprojeto IS 'PK da Tabela [pktarefaprojeto]=(idtarefaprojeto).
';


--
-- Name: COLUMN tarefasprojetos.projetoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefasprojetos.projetoid IS 'FK [fk1tarefaprojeto]=(projetoid) indicando o código do projeto que tem a tarefa.
';


--
-- Name: COLUMN tarefasprojetos.tarefaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefasprojetos.tarefaid IS 'FK [fk2tarefaprojeto]=(tarefaid) indicando o código da tarefa do projeto
';


--
-- Name: COLUMN tarefasprojetos.qthorasenvolvidas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefasprojetos.qthorasenvolvidas IS 'Quantidade de horas comprometidas da tarefa no projeto
';


--
-- Name: COLUMN tarefasprojetos.nuordem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefasprojetos.nuordem IS 'Número de ordem da tarefa dentro do projeto.';


--
-- Name: COLUMN tarefasprojetos.dtcadtarefaprojeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarefasprojetos.dtcadtarefaprojeto IS 'Data de geração do registro.';


--
-- Name: telefonestipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefonestipos (
    idtipotelefone smallint NOT NULL,
    "txdescricaotipotel	" character varying(250) NOT NULL,
    dtcadtipotelefone date NOT NULL
);


ALTER TABLE public.telefonestipos OWNER TO postgres;

--
-- Name: TABLE telefonestipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.telefonestipos IS 'Cadastro dos tipos de telefones (fixo, celular, empresarial, etc.).';


--
-- Name: COLUMN telefonestipos.idtipotelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.telefonestipos.idtipotelefone IS 'PK da Tabela [pktipotelefone]=(idtipotelefone).
';


--
-- Name: COLUMN telefonestipos."txdescricaotipotel	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.telefonestipos."txdescricaotipotel	" IS 'Texto descrevendo o tipo de telefone (sem abreviações).';


--
-- Name: COLUMN telefonestipos.dtcadtipotelefone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.telefonestipos.dtcadtipotelefone IS 'Data da geração do registro.';


--
-- Name: titulacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titulacoes (
    idtitulacao integer NOT NULL,
    professorid smallint NOT NULL,
    grauescolaridadeid smallint NOT NULL,
    instituicaoid smallint,
    dttitulacao date NOT NULL,
    dtcadtitulacao date NOT NULL
);


ALTER TABLE public.titulacoes OWNER TO postgres;

--
-- Name: TABLE titulacoes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.titulacoes IS 'Registro dos Títulos alcançados pelos professores.';


--
-- Name: COLUMN titulacoes.idtitulacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.titulacoes.idtitulacao IS 'PK da Tabela [pktitulacao]=(idtitulacao). Número inteiro sequencial crescente de 5 em 5.
';


--
-- Name: COLUMN titulacoes.professorid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.titulacoes.professorid IS 'FK [fk1titulacao]=(professorid) para a tabela de Professores.
';


--
-- Name: COLUMN titulacoes.grauescolaridadeid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.titulacoes.grauescolaridadeid IS 'FK [fk2titulacao]=(grauescolaridadeid) para grausdeescolaridade.
';


--
-- Name: COLUMN titulacoes.instituicaoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.titulacoes.instituicaoid IS 'FK [fk3titulacao]=(instituicaoid) para a tabela instituicoesensino.
';


--
-- Name: COLUMN titulacoes.dttitulacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.titulacoes.dttitulacao IS 'Data de Registro do Título apresentado pela Instituição de Ensino onde o professor se titulou.
';


--
-- Name: COLUMN titulacoes.dtcadtitulacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.titulacoes.dtcadtitulacao IS 'Data de geração do registro.
';


--
-- Name: turmas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turmas (
    idturma smallint NOT NULL,
    nuanosemestre character(5),
    atribuicaoid smallint,
    dtcadturma date
);


ALTER TABLE public.turmas OWNER TO postgres;

--
-- Name: TABLE turmas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.turmas IS 'Cadastro das turmas disponibilizadas para aulas de disciplinas atribuidas aos professores.
';


--
-- Name: COLUMN turmas.idturma; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.turmas.idturma IS 'PK da Tabela [pkturma]=(idturma). Sequencial possitivo.
';


--
-- Name: COLUMN turmas.nuanosemestre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.turmas.nuanosemestre IS 'Ano e Semestre quando a turma existe.
';


--
-- Name: COLUMN turmas.atribuicaoid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.turmas.atribuicaoid IS 'FK [fk1turma]=(atribuicaoid) para a tabela atribuicoes
';


--
-- Name: COLUMN turmas.dtcadturma; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.turmas.dtcadturma IS 'Data de geração do registro.
';


--
-- Name: veiculosmarcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculosmarcas (
    idmarcaveiculo integer NOT NULL,
    txnomemarca character varying(90) NOT NULL,
    fabricanteid smallint NOT NULL,
    "dtcadmarcaveiculo	" date NOT NULL
);


ALTER TABLE public.veiculosmarcas OWNER TO postgres;

--
-- Name: TABLE veiculosmarcas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.veiculosmarcas IS 'Cadastro das marcas de veículos desenvolvidos por fabricantes.';


--
-- Name: COLUMN veiculosmarcas.idmarcaveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmarcas.idmarcaveiculo IS 'PK da Tabela [pkmarcaveiculo]=(idmarcaveiculo).
';


--
-- Name: COLUMN veiculosmarcas.txnomemarca; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmarcas.txnomemarca IS 'Nome completo e sem abreviações';


--
-- Name: COLUMN veiculosmarcas.fabricanteid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmarcas.fabricanteid IS 'FK [fk1marcaveiculo]=(fabricanteid) com o código do fabricante da marca.
';


--
-- Name: COLUMN veiculosmarcas."dtcadmarcaveiculo	"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmarcas."dtcadmarcaveiculo	" IS 'Data de Geração do Registro.';


--
-- Name: veiculosmodelos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculosmodelos (
    idmodeloveiculo integer NOT NULL,
    marcaid integer NOT NULL,
    txdescricaomodelo character varying(250) NOT NULL,
    aotipocombustivel character(1) NOT NULL,
    dtcadmodeloveiculo date NOT NULL
);


ALTER TABLE public.veiculosmodelos OWNER TO postgres;

--
-- Name: TABLE veiculosmodelos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.veiculosmodelos IS 'Cadastro de modelos de veículos';


--
-- Name: COLUMN veiculosmodelos.idmodeloveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmodelos.idmodeloveiculo IS 'PK da Tabela [pkmodeloveiculo]=(idmodeloveiculo).
';


--
-- Name: COLUMN veiculosmodelos.marcaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmodelos.marcaid IS 'FK [fk1modeloveiculo]=(marcaveiculoid) com o código da marca de veiculos feitos por fabricantes.
';


--
-- Name: COLUMN veiculosmodelos.txdescricaomodelo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmodelos.txdescricaomodelo IS 'Texto com a descrição do modelo';


--
-- Name: COLUMN veiculosmodelos.aotipocombustivel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmodelos.aotipocombustivel IS 'Atributo Operacional: tipo de combustível Álcool, Gasolina, Diesel, GáS ou Flex';


--
-- Name: COLUMN veiculosmodelos.dtcadmodeloveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculosmodelos.dtcadmodeloveiculo IS 'Data de Geração doRegistro.';


--
-- Name: veiculostipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculostipos (
    idtipoveiculo smallint NOT NULL,
    txdescricaotpveiculo character varying(250) NOT NULL,
    dtcadtipoveiculo date NOT NULL
);


ALTER TABLE public.veiculostipos OWNER TO postgres;

--
-- Name: TABLE veiculostipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.veiculostipos IS 'Cadastro dos Tipos de Veículos';


--
-- Name: COLUMN veiculostipos.idtipoveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculostipos.idtipoveiculo IS 'PK da Tabela [pktipoveiculo]=(idtipoveiculo).
';


--
-- Name: COLUMN veiculostipos.txdescricaotpveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculostipos.txdescricaotpveiculo IS 'Texto descrevendo o tipo de veiculo (rodoviário, náutico, aéreo, etc)';


--
-- Name: COLUMN veiculostipos.dtcadtipoveiculo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.veiculostipos.dtcadtipoveiculo IS 'Data de geração do registro.';


--
-- Name: viagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viagens (
    idviagem integer NOT NULL,
    rotaid integer DEFAULT NULL::numeric,
    dtsaidaviagem date NOT NULL,
    hrsaida time without time zone NOT NULL,
    dtchegadaviagem date NOT NULL,
    hrchegadaprev time without time zone,
    dtcadviagem date
);


ALTER TABLE public.viagens OWNER TO postgres;

--
-- Name: TABLE viagens; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.viagens IS 'Cadastro de viagens feitas pelos ônibus';


--
-- Name: COLUMN viagens.idviagem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.idviagem IS 'PK da Tabela [pkviagem]=(idviagem).
';


--
-- Name: COLUMN viagens.rotaid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.rotaid IS 'FK [fk1viagem]=(rotaid) com o código da rota viária da viagem.
';


--
-- Name: COLUMN viagens.dtsaidaviagem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.dtsaidaviagem IS 'Data de realização da viagem';


--
-- Name: COLUMN viagens.hrsaida; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.hrsaida IS 'Hora de saída da viagem.';


--
-- Name: COLUMN viagens.dtchegadaviagem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.dtchegadaviagem IS 'Data prevista de chegada da viagem';


--
-- Name: COLUMN viagens.hrchegadaprev; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.hrchegadaprev IS 'Hora de chegada prevista ao destino da viagem.
';


--
-- Name: COLUMN viagens.dtcadviagem; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.viagens.dtcadviagem IS 'Data de geração do registro.
';


--
-- Data for Name:  inventarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: agencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('001', '6632X ', 'Nove de Julho', 10, '452', '01478529', '2010-10-05');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('001', '6633X ', 'Antonio Mori', 10, '745', '14521521', '2010-10-05');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('001', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('002', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('003', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('004', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('007', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('021', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('023', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('025', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('033', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('037', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('041', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('046', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('047', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('070', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('075', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('077', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('082', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('102', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('104', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('107', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('121', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('184', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('208', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('212', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('218', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('224', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('237', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('260', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('263', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('265', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('318', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('320', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('341', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('389', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('422', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('473', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('479', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('505', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('604', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('611', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('612', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('623', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('637', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('643', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('653', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('654', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('655', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('707', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('719', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('721', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('735', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('738', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('741', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('745', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('746', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('748', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('756', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');
INSERT INTO public.agencias (bancoid, idagencia, txnomeagencia, logradouroid, txcomplemento, nucep, dtcadagencia) VALUES ('M09', '0001X ', 'Matriz', 620, '14564 - Bloco 1', '04452160', '2020-09-15');


--
-- Data for Name: agenciastels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (5, '001', '0001X ', 15, '33231646       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (10, '001', '6632X ', 15, '33290139       ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (15, '001', '6633X ', 15, '33274026       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (20, '002', '0001X ', 15, '33285194       ', 'Debora', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (25, '003', '0001X ', 15, '33262928       ', 'Cecília', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (30, '004', '0001X ', 15, '33270788       ', 'Hipócrates', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (35, '007', '0001X ', 15, '33270383       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (40, '021', '0001X ', 15, '33287310       ', 'Ptolomeu', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (45, '023', '0001X ', 15, '33227230       ', 'Luiza', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (50, '025', '0001X ', 15, '33289590       ', 'Ptolomeu', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (55, '033', '0001X ', 15, '33239576       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (60, '037', '0001X ', 15, '33261159       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (65, '041', '0001X ', 15, '33230472       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (70, '046', '0001X ', 15, '33288658       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (75, '047', '0001X ', 15, '33263947       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (80, '070', '0001X ', 15, '33265541       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (85, '075', '0001X ', 15, '33234553       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (90, '077', '0001X ', 15, '33298468       ', 'Maximus', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (95, '082', '0001X ', 15, '33268350       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (100, '102', '0001X ', 15, '33243211       ', 'Luciano', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (105, '104', '0001X ', 15, '33272114       ', 'Hipócrates', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (110, '107', '0001X ', 15, '33275653       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (115, '121', '0001X ', 15, '33229769       ', 'Ptolomeu', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (120, '184', '0001X ', 15, '3323772        ', 'Luiza', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (125, '208', '0001X ', 15, '33222318       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (130, '212', '0001X ', 15, '33298902       ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (135, '218', '0001X ', 15, '33280918       ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (140, '224', '0001X ', 15, '3325276        ', 'Alberta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (145, '237', '0001X ', 15, '33287869       ', 'Alberta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (150, '260', '0001X ', 15, '33278808       ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (155, '263', '0001X ', 15, '33224071       ', 'Luciano', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (160, '265', '0001X ', 15, '332613         ', 'Debora', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (165, '318', '0001X ', 15, '33238174       ', 'Debora', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (170, '320', '0001X ', 15, '33215462       ', 'Hipócrates', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (175, '341', '0001X ', 15, '33231994       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (180, '389', '0001X ', 15, '33269757       ', 'Luciano', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (185, '422', '0001X ', 15, '33224617       ', 'Maximus', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (190, '473', '0001X ', 15, '33238619       ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (195, '479', '0001X ', 15, '33210173       ', 'Luciano', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (200, '505', '0001X ', 15, '33269319       ', 'Ptolomeu', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (205, '604', '0001X ', 15, '33294751       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (210, '611', '0001X ', 15, '3323218        ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (215, '612', '0001X ', 15, '33217446       ', 'Cecília', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (220, '623', '0001X ', 15, '33212431       ', 'Cecília', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (225, '637', '0001X ', 15, '33297755       ', 'Luiza', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (230, '643', '0001X ', 15, '33235180       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (235, '653', '0001X ', 15, '33260508       ', 'Cecília', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (240, '654', '0001X ', 15, '3322885        ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (245, '655', '0001X ', 15, '33273292       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (250, '707', '0001X ', 15, '33215143       ', 'Debora', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (255, '719', '0001X ', 15, '33293489       ', 'Alberta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (260, '721', '0001X ', 15, '33266241       ', 'Hipócrates', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (265, '735', '0001X ', 15, '33217967       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (270, '738', '0001X ', 15, '3321069        ', 'Marta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (275, '741', '0001X ', 15, '33263485       ', 'Alberta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (280, '745', '0001X ', 15, '33250535       ', 'Debora', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (285, '746', '0001X ', 15, '33272014       ', 'Laerte', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (290, '748', '0001X ', 15, '33233277       ', 'Maximus', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (295, '756', '0001X ', 15, '33229506       ', 'Alberta', '2023-01-30');
INSERT INTO public.agenciastels (idagenciatel, bancoid, agenciaid, tipotelefoneid, nutelefone, txnomecontato, dtcadagenciatel) VALUES (300, 'M09', '0001X ', 15, '33256594       ', 'Laerte', '2023-01-30');


--
-- Data for Name: aplicacoesdascontas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aplicacoesfinanceiras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aplicacoesfinanceiras (idaplicfin, txnomeaplicacao, txregrasdaaplicacao, vlmintaxaderetorno, vlmaxtaxaderetorno, dtcadaplicfin) VALUES (5, 'RDB', 'Investimento de 5000 (mínimo) por um período de 30 dias (mínimo).', 3.5, 5.5, '2016-10-18');
INSERT INTO public.aplicacoesfinanceiras (idaplicfin, txnomeaplicacao, txregrasdaaplicacao, vlmintaxaderetorno, vlmaxtaxaderetorno, dtcadaplicfin) VALUES (10, 'Poupança', 'Investimento de 500 (mínimo) com liquidez diária a partir de 30 dias do depósito inicial.', 1, 1.5, '2016-10-18');


--
-- Data for Name: areasdeestudo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (25, 'Gestão e Administração', '', '2010-12-16');
INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (30, 'Tecnologias da Informação e Comunicação', '', '2010-12-16');
INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (35, 'Astronomia', 'agrupa os estudos de fisica astronomica, geoestatistica quantica aplicada', '2010-10-10');
INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (5, 'Exatas', 'Agrupa as áreas de matemática, física, quimica e engenharias', '2001-01-01');
INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (10, 'Humanas', '', '2001-01-01');
INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (15, 'Biomédicas', '', '2001-01-01');
INSERT INTO public.areasdeestudo (idareadeestudo, txnomearea, txdescricaoarea, dtcadareaestudo) VALUES (20, 'Ciências Ambientais', '', '2001-01-01');


--
-- Data for Name: areasdeestudocursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.areasdeestudocursos (idareaestcurso, cursoid, areadeestudoid, dtcadareaestcurso) VALUES (20, 4, 30, '2001-05-10');
INSERT INTO public.areasdeestudocursos (idareaestcurso, cursoid, areadeestudoid, dtcadareaestcurso) VALUES (5, 1, 15, '2001-06-10');
INSERT INTO public.areasdeestudocursos (idareaestcurso, cursoid, areadeestudoid, dtcadareaestcurso) VALUES (10, 3, 20, '2001-05-10');
INSERT INTO public.areasdeestudocursos (idareaestcurso, cursoid, areadeestudoid, dtcadareaestcurso) VALUES (15, 3, 35, '2001-05-10');
INSERT INTO public.areasdeestudocursos (idareaestcurso, cursoid, areadeestudoid, dtcadareaestcurso) VALUES (12, 1, 10, '2010-10-10');


--
-- Data for Name: areasdeestudodisciplinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (20, 1, 25, '2011-05-10');
INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (25, 1, 35, '2005-05-05');
INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (30, 2, 5, '1980-01-01');
INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (40, 3, 10, '1980-01-01');
INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (15, 1, 20, '2004-02-04');
INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (35, 2, 15, '2010-10-10');
INSERT INTO public.areasdeestudodisciplinas (idareaestdisciplina, disciplinaid, areadeestudoid, dtcadareaestdisc) VALUES (5, 1, 30, '1980-01-01');


--
-- Data for Name: areasdeestudolivros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.areasdeestudolivros (idareaestlivro, livroid, areadeestudoid, nugrauinfluencia, dtcadareaestlivro) VALUES (15, 70, 25, 2, '2010-10-10');
INSERT INTO public.areasdeestudolivros (idareaestlivro, livroid, areadeestudoid, nugrauinfluencia, dtcadareaestlivro) VALUES (5, 20, 5, 10, '2010-10-10');
INSERT INTO public.areasdeestudolivros (idareaestlivro, livroid, areadeestudoid, nugrauinfluencia, dtcadareaestlivro) VALUES (10, 10, 25, 1, '2010-10-10');


--
-- Data for Name: armazens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.armazens (idarmazem, txnomearmazem, txdescricaogeral, logradouroid, txcomplemento, clienteid, nutelefone, nucep, qtarea, dtcadarmazem) VALUES (2, 'Sao Sebastiao', '', 470, ' 1492', 10, '            ', '        ', 50000, '1980-01-01');
INSERT INTO public.armazens (idarmazem, txnomearmazem, txdescricaogeral, logradouroid, txcomplemento, clienteid, nutelefone, nucep, qtarea, dtcadarmazem) VALUES (5, 'Dois Irmaos', '', 470, ' 234', 10, '            ', '        ', 15000, '1980-01-01');
INSERT INTO public.armazens (idarmazem, txnomearmazem, txdescricaogeral, logradouroid, txcomplemento, clienteid, nutelefone, nucep, qtarea, dtcadarmazem) VALUES (15, 'Big Warehouse Bahia', 'Galpão Único com pé direito de 15Metros', 240, '456', 55, '123         ', '12313212', 35000, '2010-10-10');
INSERT INTO public.armazens (idarmazem, txnomearmazem, txdescricaogeral, logradouroid, txcomplemento, clienteid, nutelefone, nucep, qtarea, dtcadarmazem) VALUES (3, 'Rio de Janeiro - 01', 'Galpão Único com pé direito de 15Metros - Lojas Americanas', 470, ' 234', 10, '2174857485  ', '12345678', 20000, '1980-01-01');
INSERT INTO public.armazens (idarmazem, txnomearmazem, txdescricaogeral, logradouroid, txcomplemento, clienteid, nutelefone, nucep, qtarea, dtcadarmazem) VALUES (1, 'Americanas V', 'Galpão Único com pé direito de 15Metros - Lojas Americanas', 100, 'Km 30', 10, '1145124512  ', '12345678', 150000, '2015-12-07');


--
-- Data for Name: armazenstels; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: atividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atividades (idatividade, txnomeatividade, txdescricaoativ, dtcadatividade) VALUES (25, 'Implementação de programas', 'Programação, testes, implantação e treinamento dos usuários', '2010-10-10');
INSERT INTO public.atividades (idatividade, txnomeatividade, txdescricaoativ, dtcadatividade) VALUES (5, 'Estudos de Viabilidade', 'Analisa as condições de exequibilidade de projetos', '2011-06-11');
INSERT INTO public.atividades (idatividade, txnomeatividade, txdescricaoativ, dtcadatividade) VALUES (10, 'Levantamentos de Requisitos', 'Determina as características centrais do Sistema', '2011-06-11');
INSERT INTO public.atividades (idatividade, txnomeatividade, txdescricaoativ, dtcadatividade) VALUES (15, 'Modelagem do sistema', 'Definição de modelos de dados e processos', '2010-10-10');
INSERT INTO public.atividades (idatividade, txnomeatividade, txdescricaoativ, dtcadatividade) VALUES (20, 'Especificação técnica de Dados e processos', 'Definição do Modelo Físico. Determinação dos Modelos de Dados e Processos', '2010-10-10');
INSERT INTO public.atividades (idatividade, txnomeatividade, txdescricaoativ, dtcadatividade) VALUES (30, 'Construção dos Bancos de Dados', 'Implantação do SGBD e construção dos BDs.', '2010-10-10');


--
-- Data for Name: atribuicoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (1, 1, 1, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (2, 1, 2, 12, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (3, 1, 3, 8, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (4, 1, 4, 20, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (5, 2, 1, 15, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (6, 2, 2, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (7, 2, 3, 5, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (8, 2, 4, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (9, 3, 5, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (10, 3, 6, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (11, 3, 7, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (12, 3, 8, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (13, 4, 5, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (14, 4, 6, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (15, 4, 7, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (16, 4, 8, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (17, 5, 5, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (18, 5, 6, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (19, 5, 7, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (20, 5, 8, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (21, 6, 9, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (22, 6, 10, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (23, 7, 9, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (24, 7, 10, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (25, 7, 17, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (26, 7, 18, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (27, 7, 19, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (28, 7, 20, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (29, 7, 21, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (30, 7, 22, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (31, 8, 11, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (32, 8, 12, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (33, 9, 11, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (34, 9, 12, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (35, 10, 11, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (36, 11, 13, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (37, 11, 14, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (38, 12, 13, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (39, 12, 14, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (40, 13, 13, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (41, 13, 14, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (42, 14, 13, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (43, 14, 14, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (44, 15, 15, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (45, 15, 16, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (46, 16, 15, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (47, 16, 16, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (48, 17, 15, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (49, 17, 16, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (50, 18, 15, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (51, 18, 16, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (52, 19, 17, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (53, 19, 18, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (54, 20, 17, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (55, 20, 18, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (56, 21, 17, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (57, 22, 19, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (58, 22, 20, 0, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (59, 23, 19, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (60, 23, 20, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (61, 24, 19, 20, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (62, 24, 20, 20, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (63, 25, 19, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (64, 25, 20, 15, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (65, 27, 21, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (66, 27, 22, 20, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (67, 28, 21, 10, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (68, 28, 22, 15, '1980-01-01', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (69, 29, 1, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (70, 29, 2, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (71, 29, 3, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (72, 29, 4, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (73, 29, 5, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (74, 29, 6, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (75, 29, 7, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (76, 29, 8, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (77, 29, 9, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (78, 29, 10, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (79, 29, 11, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (80, 29, 12, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (81, 29, 13, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (82, 29, 14, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (83, 29, 15, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (84, 29, 16, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (85, 29, 17, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (86, 29, 18, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (87, 29, 19, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (88, 29, 20, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (89, 29, 21, 6, '2013-11-25', NULL);
INSERT INTO public.atribuicoes (idatribuicao, professorid, disciplinaid, qthorasatribuidas, dtatribuicao, dtcadatribuicao) VALUES (90, 29, 22, 6, '2013-11-25', NULL);


--
-- Data for Name: atuacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1, 1, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (2, 2, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (3, 3, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (4, 4, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (5, 5, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (6, 6, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (7, 7, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (8, 8, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (9, 9, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (10, 10, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (11, 11, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (12, 12, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (13, 13, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (14, 14, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (15, 15, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (16, 16, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (17, 17, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (18, 18, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (19, 19, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (20, 20, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (21, 21, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (22, 22, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (23, 23, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (24, 24, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (25, 25, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (26, 26, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (27, 27, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (28, 28, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (29, 29, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (30, 30, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (31, 31, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (32, 32, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (33, 33, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (34, 34, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (35, 35, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (36, 36, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (37, 37, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (38, 38, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (39, 39, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (40, 40, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (41, 41, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (42, 42, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (43, 43, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (44, 44, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (45, 45, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (46, 46, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (47, 47, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (48, 48, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (49, 49, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (50, 50, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (51, 51, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (52, 52, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (53, 53, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (54, 54, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (55, 55, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (56, 56, 10, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (57, 8, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (58, 9, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (59, 10, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (60, 11, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (61, 12, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (62, 13, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (63, 14, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (64, 15, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (65, 16, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (66, 17, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (67, 18, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (68, 19, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (69, 20, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (70, 21, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (71, 22, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (72, 23, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (73, 24, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (74, 25, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (75, 26, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (76, 27, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (77, 28, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (78, 29, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (79, 30, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (80, 31, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (81, 32, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (82, 33, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (83, 34, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (84, 35, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (85, 36, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (86, 37, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (87, 38, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (88, 39, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (89, 40, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (90, 41, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (91, 42, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (92, 43, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (93, 44, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (94, 45, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (95, 46, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (96, 47, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (97, 48, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (98, 49, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (99, 50, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (100, 51, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (101, 52, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (102, 53, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (103, 54, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (104, 55, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (105, 56, 20, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (106, 1, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (107, 2, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (108, 3, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (109, 4, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (110, 5, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (111, 6, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (112, 7, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (113, 8, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (114, 9, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (115, 10, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (116, 11, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (117, 19, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (118, 20, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (119, 21, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (120, 22, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (121, 23, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (122, 24, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (123, 25, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (124, 26, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (125, 27, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (126, 28, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (127, 29, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (128, 30, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (129, 31, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (130, 32, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (131, 33, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (132, 34, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (133, 35, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (134, 36, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (135, 37, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (136, 38, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (137, 39, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (138, 40, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (139, 41, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (140, 42, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (141, 43, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (142, 44, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (143, 45, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (144, 46, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (145, 47, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (146, 48, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (147, 49, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (148, 50, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (149, 51, 30, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (150, 35, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (151, 36, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (152, 37, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (153, 38, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (154, 39, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (155, 40, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (156, 41, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (157, 42, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (158, 43, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (159, 44, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (160, 45, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (161, 46, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (162, 47, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (163, 48, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (164, 49, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (165, 50, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (166, 51, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (167, 52, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (168, 53, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (169, 54, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (170, 55, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (171, 56, 40, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (172, 1, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (173, 2, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (174, 3, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (175, 4, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (176, 5, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (177, 6, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (178, 7, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (179, 8, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (180, 9, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (181, 10, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (182, 11, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (183, 12, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (184, 13, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (185, 14, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (186, 15, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (187, 16, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (188, 17, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (189, 18, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (190, 19, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (191, 20, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (192, 21, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (193, 22, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (194, 23, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (195, 24, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (196, 25, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (197, 26, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (198, 27, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (199, 28, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (200, 29, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (201, 30, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (202, 31, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (203, 32, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (204, 33, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (205, 34, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (206, 35, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (207, 36, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (208, 37, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (209, 38, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (210, 39, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (211, 40, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (212, 41, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (213, 42, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (214, 43, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (215, 44, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (216, 45, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (217, 46, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (218, 47, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (219, 48, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (220, 49, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (221, 50, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (222, 51, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (223, 52, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (224, 53, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (225, 54, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (226, 55, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (227, 56, 50, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (228, 9, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (229, 10, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (230, 11, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (231, 12, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (232, 13, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (233, 14, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (234, 15, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (235, 16, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (236, 17, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (237, 18, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (238, 19, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (239, 20, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (240, 21, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (241, 22, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (242, 23, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (243, 24, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (244, 25, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (245, 26, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (246, 27, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (247, 28, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (248, 29, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (249, 30, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (250, 31, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (251, 32, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (252, 33, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (253, 34, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (254, 35, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (255, 36, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (256, 37, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (257, 38, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (258, 39, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (259, 40, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (260, 41, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (261, 42, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (262, 43, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (263, 44, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (264, 45, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (265, 46, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (266, 47, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (267, 48, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (268, 49, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (269, 50, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (270, 51, 70, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (271, 8, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (272, 9, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (273, 10, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (274, 11, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (275, 12, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (276, 13, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (277, 14, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (278, 15, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (279, 16, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (280, 17, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (281, 18, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (282, 19, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (283, 20, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (284, 21, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (285, 22, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (286, 23, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (287, 24, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (288, 25, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (289, 33, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (290, 34, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (291, 35, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (292, 36, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (293, 37, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (294, 38, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (295, 39, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (296, 40, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (297, 41, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (298, 42, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (299, 43, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (300, 44, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (301, 45, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (302, 46, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (303, 47, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (304, 48, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (305, 49, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (306, 50, 80, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (307, 43, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (308, 44, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (309, 45, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (310, 46, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (311, 47, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (312, 48, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (313, 49, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (314, 50, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (315, 51, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (316, 52, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (317, 53, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (318, 54, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (319, 55, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (320, 56, 90, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (321, 1, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (322, 2, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (323, 3, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (324, 4, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (325, 5, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (326, 6, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (327, 7, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (328, 8, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (329, 9, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (330, 10, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (331, 11, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (332, 12, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (333, 13, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (334, 14, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (335, 15, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (336, 16, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (337, 17, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (338, 18, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (339, 19, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (340, 20, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (341, 21, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (342, 22, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (343, 23, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (344, 24, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (345, 25, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (346, 26, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (347, 27, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (348, 28, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (349, 29, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (350, 30, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (351, 31, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (352, 32, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (353, 33, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (354, 34, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (355, 35, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (356, 36, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (357, 37, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (358, 38, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (359, 39, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (360, 40, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (361, 41, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (362, 42, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (363, 43, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (364, 44, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (365, 45, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (366, 46, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (367, 47, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (368, 48, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (369, 49, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (370, 50, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (371, 51, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (372, 52, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (373, 53, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (374, 54, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (375, 55, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (376, 56, 100, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (377, 37, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (378, 38, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (379, 39, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (380, 40, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (381, 41, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (382, 42, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (383, 43, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (384, 44, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (385, 45, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (386, 46, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (387, 47, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (388, 48, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (389, 49, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (390, 50, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (391, 51, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (392, 52, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (393, 53, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (394, 54, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (395, 55, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (396, 56, 110, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (397, 1, 120, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (398, 2, 120, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (399, 3, 120, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (400, 4, 120, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (401, 12, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (402, 13, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (403, 14, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (404, 15, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (405, 16, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (406, 17, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (407, 18, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (408, 19, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (409, 20, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (410, 21, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (411, 22, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (412, 23, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (413, 24, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (414, 25, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (415, 26, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (416, 27, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (417, 28, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (418, 29, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (419, 30, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (420, 31, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (421, 32, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (422, 33, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (423, 34, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (424, 35, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (425, 36, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (426, 37, 130, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (427, 41, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (428, 42, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (429, 43, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (430, 44, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (431, 45, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (432, 46, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (433, 47, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (434, 48, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (435, 49, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (436, 50, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (437, 51, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (438, 52, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (439, 53, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (440, 54, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (441, 55, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (442, 56, 150, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (443, 9, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (444, 10, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (445, 11, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (446, 12, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (447, 13, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (448, 14, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (449, 15, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (450, 16, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (451, 17, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (452, 18, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (453, 19, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (454, 20, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (455, 21, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (456, 22, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (457, 23, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (458, 24, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (459, 25, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (460, 26, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (461, 27, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (462, 28, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (463, 29, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (464, 30, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (465, 31, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (466, 32, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (467, 33, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (468, 34, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (469, 39, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (470, 40, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (471, 41, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (472, 42, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (473, 43, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (474, 44, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (475, 45, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (476, 46, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (477, 47, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (478, 48, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (479, 49, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (480, 51, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (481, 52, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (482, 53, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (483, 54, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (484, 55, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (485, 56, 170, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (486, 1, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (487, 2, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (488, 3, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (489, 4, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (490, 5, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (491, 6, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (492, 7, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (493, 8, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (494, 9, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (495, 10, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (496, 11, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (497, 12, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (498, 13, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (499, 14, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (500, 29, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (501, 30, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (502, 31, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (503, 32, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (504, 33, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (505, 34, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (506, 35, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (507, 36, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (508, 37, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (509, 38, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (510, 39, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (511, 40, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (512, 41, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (513, 42, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (514, 43, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (515, 44, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (516, 45, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (517, 46, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (518, 47, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (519, 48, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (520, 49, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (521, 50, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (522, 51, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (523, 52, 190, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (524, 9, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (525, 10, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (526, 11, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (527, 12, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (528, 13, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (529, 14, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (530, 15, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (531, 16, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (532, 17, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (533, 18, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (534, 19, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (535, 20, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (536, 21, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (537, 22, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (538, 23, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (539, 24, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (540, 25, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (541, 26, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (542, 27, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (543, 28, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (544, 29, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (545, 30, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (546, 31, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (547, 32, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (548, 33, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (549, 38, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (550, 39, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (551, 40, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (552, 41, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (553, 42, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (554, 43, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (555, 44, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (556, 45, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (557, 46, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (558, 47, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (559, 48, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (560, 49, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (561, 50, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (562, 51, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (563, 52, 200, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (564, 38, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (565, 39, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (566, 40, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (567, 41, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (568, 42, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (569, 43, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (570, 44, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (571, 45, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (572, 46, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (573, 47, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (574, 48, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (575, 49, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (576, 50, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (577, 51, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (578, 52, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (579, 53, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (580, 54, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (581, 55, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (582, 56, 210, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (583, 1, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (584, 9, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (585, 10, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (586, 11, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (587, 12, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (588, 13, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (589, 14, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (590, 15, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (591, 16, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (592, 17, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (593, 18, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (594, 19, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (595, 20, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (596, 21, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (597, 37, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (598, 38, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (599, 39, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (600, 40, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (601, 41, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (602, 42, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (603, 43, 220, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (604, 9, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (605, 10, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (606, 11, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (607, 12, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (608, 13, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (609, 14, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (610, 15, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (611, 16, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (612, 17, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (613, 18, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (614, 19, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (615, 20, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (616, 21, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (617, 22, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (618, 23, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (619, 24, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (620, 45, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (621, 46, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (622, 47, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (623, 48, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (624, 49, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (625, 50, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (626, 51, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (627, 52, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (628, 53, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (629, 54, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (630, 55, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (631, 56, 230, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (632, 1, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (633, 2, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (634, 3, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (635, 4, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (636, 24, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (637, 25, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (638, 26, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (639, 27, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (640, 28, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (641, 29, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (642, 30, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (643, 31, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (644, 32, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (645, 33, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (646, 34, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (647, 35, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (648, 36, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (649, 37, 240, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (650, 1, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (651, 2, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (652, 3, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (653, 4, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (654, 5, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (655, 6, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (656, 7, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (657, 8, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (658, 9, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (659, 10, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (660, 11, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (661, 12, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (662, 13, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (663, 14, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (664, 15, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (665, 37, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (666, 38, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (667, 39, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (668, 40, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (669, 41, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (670, 42, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (671, 43, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (672, 44, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (673, 45, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (674, 46, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (675, 47, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (676, 48, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (677, 49, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (678, 50, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (679, 51, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (680, 52, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (681, 53, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (682, 54, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (683, 55, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (684, 56, 250, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (685, 1, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (686, 2, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (687, 24, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (688, 25, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (689, 26, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (690, 27, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (691, 28, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (692, 29, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (693, 30, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (694, 31, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (695, 32, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (696, 33, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (697, 34, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (698, 35, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (699, 36, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (700, 37, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (701, 38, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (702, 39, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (703, 40, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (704, 41, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (705, 42, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (706, 43, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (707, 44, 260, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (708, 11, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (709, 12, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (710, 13, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (711, 14, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (712, 15, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (713, 16, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (714, 17, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (715, 18, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (716, 19, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (717, 20, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (718, 21, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (719, 22, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (720, 23, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (721, 24, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (722, 25, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (723, 26, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (724, 27, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (725, 28, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (726, 52, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (727, 53, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (728, 54, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (729, 55, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (730, 56, 270, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (731, 1, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (732, 2, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (733, 3, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (734, 4, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (735, 5, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (736, 6, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (737, 7, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (738, 34, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (739, 35, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (740, 36, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (741, 37, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (742, 38, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (743, 39, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (744, 40, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (745, 41, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (746, 42, 280, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (747, 12, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (748, 13, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (749, 14, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (750, 15, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (751, 16, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (752, 17, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (753, 18, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (754, 19, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (755, 20, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (756, 21, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (757, 22, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (758, 23, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (759, 24, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (760, 25, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (761, 26, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (762, 27, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (763, 28, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (764, 29, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (765, 30, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (766, 31, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (767, 32, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (768, 33, 290, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (769, 1, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (770, 2, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (771, 3, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (772, 4, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (773, 5, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (774, 6, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (775, 7, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (776, 8, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (777, 9, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (778, 10, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (779, 11, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (780, 12, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (781, 13, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (782, 14, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (783, 15, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (784, 16, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (785, 17, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (786, 18, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (787, 19, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (788, 20, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (789, 21, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (790, 22, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (791, 23, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (792, 24, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (793, 25, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (794, 26, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (795, 27, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (796, 28, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (797, 29, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (798, 30, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (799, 31, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (800, 32, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (801, 33, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (802, 34, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (803, 35, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (804, 36, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (805, 37, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (806, 38, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (807, 39, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (808, 40, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (809, 41, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (810, 42, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (811, 43, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (812, 44, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (813, 45, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (814, 46, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (815, 47, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (816, 48, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (817, 49, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (818, 50, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (819, 51, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (820, 52, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (821, 53, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (822, 54, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (823, 55, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (824, 56, 300, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (825, 1, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (826, 2, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (827, 19, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (828, 20, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (829, 21, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (830, 22, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (831, 23, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (832, 24, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (833, 25, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (834, 26, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (835, 27, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (836, 28, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (837, 29, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (838, 30, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (839, 31, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (840, 32, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (841, 33, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (842, 34, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (843, 35, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (844, 36, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (845, 37, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (846, 38, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (847, 54, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (848, 55, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (849, 56, 310, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (850, 1, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (851, 2, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (852, 3, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (853, 4, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (854, 5, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (855, 6, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (856, 7, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (857, 8, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (858, 9, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (859, 10, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (860, 11, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (861, 12, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (862, 13, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (863, 14, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (864, 15, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (865, 16, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (866, 35, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (867, 36, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (868, 37, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (869, 38, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (870, 39, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (871, 40, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (872, 41, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (873, 42, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (874, 43, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (875, 44, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (876, 45, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (877, 46, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (878, 47, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (879, 48, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (880, 49, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (881, 50, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (882, 51, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (883, 52, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (884, 53, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (885, 54, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (886, 55, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (887, 56, 320, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (888, 1, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (889, 2, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (890, 3, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (891, 4, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (892, 22, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (893, 23, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (894, 24, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (895, 25, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (896, 26, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (897, 27, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (898, 28, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (899, 29, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (900, 30, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (901, 31, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (902, 32, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (903, 33, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (904, 34, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (905, 35, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (906, 36, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (907, 37, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (908, 38, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (909, 39, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (910, 40, 330, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (911, 8, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (912, 9, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (913, 10, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (914, 11, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (915, 12, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (916, 13, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (917, 14, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (918, 15, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (919, 16, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (920, 17, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (921, 18, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (922, 19, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (923, 20, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (924, 21, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (925, 22, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (926, 23, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (927, 24, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (928, 25, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (929, 26, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (930, 27, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (931, 28, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (932, 29, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (933, 30, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (934, 31, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (935, 32, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (936, 33, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (937, 34, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (938, 35, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (939, 36, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (940, 37, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (941, 38, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (942, 39, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (943, 40, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (944, 41, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (945, 42, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (946, 43, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (947, 44, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (948, 45, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (949, 46, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (950, 47, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (951, 48, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (952, 49, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (953, 50, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (954, 51, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (955, 52, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (956, 53, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (957, 54, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (958, 55, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (959, 56, 340, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (960, 1, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (961, 2, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (962, 22, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (963, 23, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (964, 24, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (965, 25, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (966, 26, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (967, 27, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (968, 28, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (969, 29, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (970, 30, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (971, 31, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (972, 32, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (973, 33, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (974, 34, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (975, 35, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (976, 36, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (977, 37, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (978, 38, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (979, 39, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (980, 40, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (981, 41, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (982, 42, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (983, 43, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (984, 44, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (985, 45, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (986, 46, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (987, 47, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (988, 48, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (989, 49, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (990, 50, 350, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (991, 15, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (992, 16, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (993, 17, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (994, 18, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (995, 19, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (996, 20, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (997, 21, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (998, 22, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (999, 23, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1000, 24, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1001, 25, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1002, 26, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1003, 27, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1004, 28, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1005, 29, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1006, 30, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1007, 31, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1008, 32, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1009, 33, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1010, 34, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1011, 35, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1012, 36, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1013, 55, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1014, 56, 360, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1015, 1, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1016, 2, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1017, 3, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1018, 4, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1019, 5, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1020, 6, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1021, 7, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1022, 8, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1023, 9, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1024, 10, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1025, 11, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1026, 12, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1027, 13, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1028, 14, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1029, 15, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1030, 16, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1031, 41, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1032, 42, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1033, 43, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1034, 44, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1035, 45, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1036, 46, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1037, 47, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1038, 48, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1039, 49, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1040, 50, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1041, 51, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1042, 52, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1043, 53, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1044, 54, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1045, 55, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1046, 56, 370, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1047, 1, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1048, 2, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1049, 3, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1050, 4, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1051, 5, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1052, 6, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1053, 7, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1054, 8, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1055, 9, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1056, 10, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1057, 11, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1058, 12, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1059, 13, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1060, 34, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1061, 35, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1062, 36, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1063, 37, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1064, 38, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1065, 39, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1066, 40, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1067, 41, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1068, 42, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1069, 43, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1070, 44, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1071, 45, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1072, 46, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1073, 47, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1074, 48, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1075, 49, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1076, 50, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1077, 51, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1078, 52, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1079, 53, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1080, 54, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1081, 55, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1082, 56, 380, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1083, 1, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1084, 2, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1085, 3, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1086, 4, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1087, 5, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1088, 6, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1089, 7, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1090, 8, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1091, 9, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1092, 10, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1093, 11, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1094, 12, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1095, 13, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1096, 14, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1097, 15, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1098, 16, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1099, 17, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1100, 18, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1101, 19, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1102, 20, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1103, 21, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1104, 22, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1105, 23, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1106, 24, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1107, 25, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1108, 26, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1109, 27, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1110, 28, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1111, 29, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1112, 30, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1113, 31, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1114, 32, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1115, 33, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1116, 34, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1117, 35, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1118, 36, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1119, 37, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1120, 38, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1121, 39, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1122, 40, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1123, 41, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1124, 42, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1125, 43, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1126, 44, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1127, 45, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1128, 46, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1129, 47, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1130, 48, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1131, 49, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1132, 50, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1133, 51, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1134, 52, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1135, 53, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1136, 54, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1137, 55, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1138, 56, 390, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1139, 17, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1140, 18, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1141, 19, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1142, 20, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1143, 21, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1144, 22, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1145, 23, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1146, 24, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1147, 25, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1148, 26, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1149, 27, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1150, 28, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1151, 29, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1152, 30, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1153, 53, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1154, 54, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1155, 55, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1156, 56, 400, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1157, 1, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1158, 2, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1159, 3, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1160, 4, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1161, 5, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1162, 6, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1163, 7, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1164, 8, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1165, 9, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1166, 10, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1167, 11, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1168, 12, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1169, 13, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1170, 14, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1171, 15, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1172, 16, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1173, 17, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1174, 18, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1175, 19, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1176, 42, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1177, 43, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1178, 44, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1179, 45, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1180, 46, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1181, 47, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1182, 48, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1183, 49, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1184, 50, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1185, 51, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1186, 52, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1187, 53, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1188, 54, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1189, 55, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1190, 56, 410, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1191, 1, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1192, 2, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1193, 3, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1194, 4, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1195, 5, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1196, 6, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1197, 7, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1198, 8, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1199, 9, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1200, 10, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1201, 11, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1202, 33, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1203, 34, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1204, 35, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1205, 36, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1206, 37, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1207, 38, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1208, 39, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1209, 40, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1210, 41, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1211, 42, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1212, 43, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1213, 44, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1214, 45, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1215, 46, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1216, 47, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1217, 48, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1218, 49, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1219, 50, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1220, 51, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1221, 52, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1222, 53, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1223, 54, 420, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1224, 15, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1225, 16, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1226, 17, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1227, 18, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1228, 19, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1229, 20, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1230, 21, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1231, 22, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1232, 23, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1233, 24, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1234, 25, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1235, 26, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1236, 27, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1237, 28, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1238, 29, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1239, 30, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1240, 31, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1241, 32, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1242, 33, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1243, 34, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1244, 35, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1245, 36, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1246, 37, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1247, 38, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1248, 39, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1249, 40, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1250, 41, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1251, 42, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1252, 43, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1253, 44, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1254, 45, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1255, 46, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1256, 47, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1257, 48, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1258, 49, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1259, 50, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1260, 51, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1261, 52, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1262, 53, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1263, 54, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1264, 55, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1265, 56, 430, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1266, 1, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1267, 2, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1268, 3, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1269, 4, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1270, 5, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1271, 6, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1272, 7, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1273, 8, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1274, 9, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1275, 10, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1276, 11, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1277, 12, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1278, 13, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1279, 14, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1280, 15, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1281, 16, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1282, 17, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1283, 18, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1284, 19, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1285, 20, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1286, 21, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1287, 22, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1288, 23, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1289, 24, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1290, 25, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1291, 26, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1292, 27, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1293, 28, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1294, 29, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1295, 30, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1296, 31, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1297, 32, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1298, 33, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1299, 34, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1300, 35, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1301, 36, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1302, 37, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1303, 38, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1304, 39, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1305, 40, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1306, 41, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1307, 42, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1308, 43, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1309, 44, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1310, 45, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1311, 46, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1312, 47, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1313, 48, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1314, 49, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1315, 50, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1316, 51, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1317, 52, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1318, 53, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1319, 54, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1320, 55, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1321, 56, 440, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1322, 49, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1323, 50, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1324, 51, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1325, 52, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1326, 53, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1327, 54, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1328, 55, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1329, 56, 460, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1330, 1, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1331, 2, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1332, 3, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1333, 4, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1334, 5, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1335, 6, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1336, 7, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1337, 8, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1338, 9, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1339, 10, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1340, 11, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1341, 12, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1342, 13, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1343, 14, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1344, 15, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1345, 16, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1346, 17, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1347, 18, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1348, 19, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1349, 20, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1350, 21, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1351, 22, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1352, 23, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1353, 24, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1354, 25, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1355, 26, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1356, 27, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1357, 28, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1358, 29, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1359, 30, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1360, 31, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1361, 32, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1362, 33, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1363, 34, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1364, 35, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1365, 36, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1366, 37, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1367, 38, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1368, 39, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1369, 40, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1370, 41, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1371, 42, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1372, 43, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1373, 44, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1374, 45, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1375, 46, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1376, 47, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1377, 48, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1378, 49, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1379, 50, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1380, 51, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1381, 52, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1382, 53, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1383, 54, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1384, 55, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');
INSERT INTO public.atuacoes (idatuacao, tarefaprojetoid, funcionarioid, dtinicio, dttermino, qttempoduracao, dtcadatuacao) VALUES (1385, 56, 470, '2017-10-05', '2017-10-30', 100, '2017-11-05');


--
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (10, 'João Maurício Hypólito                                                                    ', 600, ' 985', '12345678', '1980-01-01', '2013-03-20');
INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (20, 'Liev Tolstoi                                                                              ', 460, ' 1254', '15452145', '1980-01-01', '2010-10-10');
INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (40, 'José do Patrocínio                                                                        ', 20, '45', '19906160', '1984-05-20', '2010-10-10');
INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (50, 'Chico Buarque                                                                             ', 20, '45', '04512412', '1951-05-20', '1995-02-20');
INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (70, 'César Camargo Mariano                                                                     ', 40, '15', '41524152', '1955-08-09', '1995-05-05');
INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (80, 'Vinicius de Morais                                                                        ', 490, '2324', '04512451', '1935-05-10', '1985-10-10');
INSERT INTO public.autores (idautor, txnomeautor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadautor) VALUES (130, 'Cecilia Meireles da silva                                                                 ', 590, 'Km 289', '02342345', '1980-01-01', '2009-10-10');


--
-- Data for Name: autorestels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autorestels (idautortel, autorid, tipotelefoneid, nutelefone, dtcadautortel) VALUES (5, 10, 5, '1433522653     ', '2016-10-18');
INSERT INTO public.autorestels (idautortel, autorid, tipotelefoneid, nutelefone, dtcadautortel) VALUES (10, 10, 10, '14985641452    ', '2016-10-18');


--
-- Data for Name: autorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autorias (idautoria, livroid, autorid, dtcadautoria) VALUES (5, 10, 10, '2011-10-10');
INSERT INTO public.autorias (idautoria, livroid, autorid, dtcadautoria) VALUES (10, 10, 20, '2010-10-10');
INSERT INTO public.autorias (idautoria, livroid, autorid, dtcadautoria) VALUES (15, 110, 10, '2019-09-21');


--
-- Data for Name: bairros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (1, 'Centro', 10, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (2, 'Centro', 5, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (3, 'Centro', 20, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (4, 'Bela Vista', 5, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (5, 'Bexiga', 5, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (6, 'Liberdade', 5, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (7, 'Vila Musa', 35, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (8, 'Vila Matilde', 5, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (9, 'Vila Esperança', 5, '2014-03-29');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (11, 'Centro', 40, '2020-09-07');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (12, 'Centro', 15, '2020-09-07');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (13, 'Centro', 25, '2020-09-07');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (14, 'Centro', 30, '2020-09-07');
INSERT INTO public.bairros (idbairro, txnomebairro, cidadeid, dtcadbairro) VALUES (10, 'Centro', 35, '2020-09-07');


--
-- Data for Name: bairroslogradouros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bancos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('001', 'Banco do Brasil', '1940-05-02', 'F', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('002', 'Banco Central do Brasil', '1940-05-02', 'F', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('003', 'Banco da Amazônia', '1940-05-02', 'F', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('004', 'Banco do Nordeste do Brasil', '1940-05-02', 'F', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('007', 'Banco Nacional de Desenvolvimento Econômico e Social', '1940-05-02', 'F', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('021', 'Banco do Estado do Espírito Santo', '1940-05-02', 'E', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('023', 'Banco de Desenvolvimento de Minas Gerais', '1940-05-02', 'E', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('025', 'Banco Alfa', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('033', 'Banco Santander', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('037', 'Banco do Estado do Pará', '1940-05-02', 'E', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('041', 'Banco do Estado do Rio Grande do Sul', '1940-05-02', 'E', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('046', 'Banco Regional de Desenvolvimento do Extremo Sul', '1940-05-02', 'I', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('047', 'Banco do Estado de Sergipe', '1940-05-02', 'E', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('070', 'Banco de Brasília', '1940-05-02', 'E', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('075', 'Banco ABN Amro S.A.', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('077', 'Banco Inter', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('082', 'Banco Topázio', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('102', 'XP Investimentos Corretora de Câmbio Títulos e Valores Mobiliários S.A', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('104', 'Caixa Econômica Federal', '1940-05-02', 'F', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('107', 'Banco BBM', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('121', 'Agibank', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('184', 'Banco Itaú BBA', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('208', 'Banco BTG Pactual', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('212', 'Banco Original', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('218', 'Banco Bonsucesso', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('224', 'Banco Fibra', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('237', 'Bradesco', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('260', 'Nu Pagamentos S.A', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('263', 'Banco Cacique', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('265', 'Banco Fator', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('318', 'Banco BMG', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('320', 'Banco Industrial e Comercial', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('341', 'Itaú Unibanco', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('389', 'Banco Mercantil do Brasil', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('422', 'Banco Safra', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('473', 'Banco Caixa Geral', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('479', 'Banco ItaúBank', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('505', 'Banco Credit Suisse', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('604', 'Banco Industrial do Brasil', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('611', 'Banco Paulista', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('612', 'Banco Guanabara', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('623', 'Banco Pan', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('637', 'Banco Sofisa', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('643', 'Banco Pine', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('653', 'Banco Indusval', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('654', 'Banco Renner', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('655', 'Banco Votorantim', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('707', 'Góis Monteiro & Co', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('719', 'Banco Banif', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('721', 'Banco Credibel', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('735', 'Banco Neon', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('738', 'Banco Morada', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('741', 'Banco Ribeirão Preto', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('745', 'Banco Citibank', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('746', 'Banco Modal', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('748', 'Banco Cooperativo Sicredi - BANSICREDI', '1940-05-02', 'C', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('756', 'Banco Cooperativo do Brasil - BANCOOB', '1940-05-02', 'C', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bancos (idbanco, txnomebanco, dtfundacao, aocompetencia, logradourosedeid, txcomplemento, nucepsede, dtcadbanco, nucnpjbanco, txsigla, website, aosituacao, aohistorico, qtagencias, aocapitalaberto) VALUES ('M09', 'Banco Itaucred Financiamentos', '1940-05-02', 'P', 10, '', '12345678', '2018-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: bibliografias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (5, 1, 50, 'B', '1980-01-01', '2016-08-01');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (10, 4, 40, 'C', '2011-06-02', '2016-08-01');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (15, 11, 20, 'B', '2011-10-26', '2016-04-05');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (20, 11, 30, 'B', '2011-05-20', '2011-06-10');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (25, 11, 70, 'B', '2011-10-26', '2011-10-26');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (30, 11, 90, 'C', '2010-10-10', '2010-10-10');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (35, 12, 60, 'C', '2011-10-26', '2016-05-02');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (40, 13, 20, 'B', '2015-10-23', '2015-10-23');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (45, 13, 40, 'C', '2015-10-23', '2015-10-23');
INSERT INTO public.bibliografias (idbibliografia, disciplinaid, livroid, aotipo, dtadocaodolivro, dtcadbibliografia) VALUES (50, 14, 60, 'B', '2010-10-10', '2010-10-10');


--
-- Data for Name: capacitacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.capacitacoes (idcapacitacao, cursoid, funcionarioid, dtcapacitacao, dtregistro, dtcadcapacitacao, nucertificado) VALUES (5, 1, 10, '2016-10-01', '20016-10-01', '2016-10-18', NULL);
INSERT INTO public.capacitacoes (idcapacitacao, cursoid, funcionarioid, dtcapacitacao, dtregistro, dtcadcapacitacao, nucertificado) VALUES (10, 3, 20, '2016-10-01', '2016-10-10', '2016-10-18', NULL);


--
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (5, 'Sao Paulo', 'aeroporto, rodovia, ferrovia e hidrovia', 12000000, 780, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (10, 'Osasco', 'rodovia e ferrovia', 1000000, 0, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (15, 'Barueri', 'rodovia e ferrovia', 1000000, 0, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (20, 'Sao Bernardo', 'rodovia e ferrovia', 800000, 0, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (25, 'Sao Caetano', 'rodovia e ferrovia', 750000, 0, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (30, 'Diadema', 'rodovia e ferrovia', 900000, 0, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (35, 'Guarulhos', 'aeroporto, rodovia e ferrovia', 2200000, 0, '1980-10-10', '2019-01-21', NULL);
INSERT INTO public.cidades (idcidade, txnomecidade, txformaacesso, qtpopulacao, qtarea, dtfundacao, dtcadcidade, estadodopaisid) VALUES (40, 'Ourinhos', 'rodovia e ferrovia', 105000, 280, '2008-10-10', '1918-12-13', NULL);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (5, 'Mecânica Marreco', 'Vendas e Trocas de Moveis Dragão Imperial S/C Ltda.', 290, '8560', '04514512', 20000, 'B', '2015-11-05');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (10, 'Tratoria do Sargento', 'Ristoranti Il Tratoria do Sargento', 600, ' 985', '        ', 25000, 'B', '2007-02-02');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (25, 'Tratoria do Pirata', 'Ristoranti tre fratelli S.A.', 470, ' 1492', '12345678', 30000, 'A', '2007-01-20');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (30, 'Mc Donalds', 'Rest Com S/A ', 610, ' 6500', '        ', 100000, 'B', '2008-01-20');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (35, 'La Traviatta Ripante', 'Rest Com S/A ', 380, ' 125 - 15And Ap 156', '        ', 100000, 'B', '2008-01-20');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (40, 'Bistro Ratatui', 'sdf sdgf', 520, ' 1245', '        ', 3456, 'A', '2011-10-22');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (50, 'Restaurante Latitude Zero', 'Restaurante e Lanches Latitude Zero S/C Ltda.', 260, '8560', '04514512', 5000, 'A', '2015-10-28');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (20, 'Tratoria do General', 'Restaurante da Tratoria do General S/C Ltda.', 310, ' 1254', '12345678', 12000, 'A', '2011-06-01');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (15, 'Restaurante Bom Vivan', 'Restaurante "O Bom Vivan" S/C Ltda.', 550, ' 567', '12345678', 7000, 'A', '2009-12-10');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (65, 'Mecânica Marreco', 'Cooperativa de mecânicos Marreco e Associados S/C Ltda.', 20, '451', '19845745', 10000, 'A', '2015-11-05');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (70, 'Tarecapis', 'Mecânica de Automóveis Tarecapis S/C Ltda.', 300, '4500', '04512142', 6000, 'A', '2016-10-10');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (75, 'Sterling Software', 'Sterling Software S/C Ltda.', 180, '2456', '04156145', 25000, 'A', '2016-11-01');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (80, 'Vingadores', 'Associação dos vingadores de vovós desamparadas S/C Ltda.', 290, '1234', '23523453', 2000, 'A', '2016-11-10');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (55, 'Autoposto São Luiz', 'Companhia de Abastecimento Autoposto São Luiz S/C Ltda.', 350, '4512', '45781245', 20000, 'A', '2015-10-28');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (85, 'EdUEL', 'Editora da Universidade Estadual de Londrina S/C Ltda.', 490, '2650', '45121452', 25000, 'A', '2017-03-06');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (45, 'Auto Posto São Bernardo', 'Auto Posto São Bernardo S/C Ltda.', 520, '1450', '04114521', 150000, 'A', '2023-09-03');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (60, 'Auto Posto São Bernardo', 'Auto Posto São Bernardo S/C Ltda.', 520, '1450', '04114521', 150000, 'A', '2023-09-03');
INSERT INTO public.clientes (idcliente, txnomecliente, txrazaosocial, logradouroid, txcomplemento, nucep, vllimitecompra, aosituacao, dtcadcliente) VALUES (90, 'Auto Posto São Bernardo', 'Auto Posto São Bernardo S/C Ltda.', 520, '1450', '04114521', 150000, 'A', '2023-09-03');


--
-- Data for Name: clientestels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientestels (idclientetel, clienteid, tipotelefoneid, nutelefone, dtcadclientetel, txnomecontato) VALUES (1, 25, 5, '1232323434     ', NULL, NULL);
INSERT INTO public.clientestels (idclientetel, clienteid, tipotelefoneid, nutelefone, dtcadclientetel, txnomecontato) VALUES (6, 25, 5, '114528562      ', NULL, NULL);
INSERT INTO public.clientestels (idclientetel, clienteid, tipotelefoneid, nutelefone, dtcadclientetel, txnomecontato) VALUES (2, 25, 15, '1141524152     ', NULL, NULL);
INSERT INTO public.clientestels (idclientetel, clienteid, tipotelefoneid, nutelefone, dtcadclientetel, txnomecontato) VALUES (3, 25, 15, '1144141412     ', NULL, NULL);
INSERT INTO public.clientestels (idclientetel, clienteid, tipotelefoneid, nutelefone, dtcadclientetel, txnomecontato) VALUES (4, 25, 15, '114528562      ', NULL, NULL);
INSERT INTO public.clientestels (idclientetel, clienteid, tipotelefoneid, nutelefone, dtcadclientetel, txnomecontato) VALUES (5, 40, 15, '114528562      ', NULL, NULL);


--
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (2, 20, 1, '2013-03-20 08:20:00', NULL, 2, 'A', '2013-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (3, 30, 1, '2013-03-20 09:20:00', NULL, 2, 'A', '2013-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (4, 40, 1, '2013-03-21 07:00:00', NULL, 2, 'A', '2013-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (5, 70, 1, '2013-03-21 07:20:00', NULL, 2, 'A', '2013-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (6, 80, 1, '2013-03-21 07:40:00', NULL, 2, 'A', '2013-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (7, 90, 1, '2016-03-21 08:00:00', NULL, 2, 'A', '2016-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (8, 100, 1, '2016-03-21 10:00:00', NULL, 2, 'A', '2016-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (9, 110, 1, '2016-03-21 10:20:00', NULL, 2, 'A', '2016-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (10, 120, 1, '2016-03-21 10:40:00', NULL, 2, 'A', '2016-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (11, 130, 1, '2016-03-21 11:00:00', NULL, 2, 'A', '2016-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (12, 150, 1, '2016-03-21 08:20:00', NULL, 2, 'A', '2016-03-10');
INSERT INTO public.consultas (idconsulta, funcionarioid, medicoid, dthoraconsulta, dthorarealizada, planodesaudeid, aosituacaoconsulta, dtcadconsulta) VALUES (13, 160, 1, '2016-03-21 08:40:00', NULL, 2, 'A', '2016-03-10');


--
-- Data for Name: contas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contas (bancoid, agenciaid, idnuconta, funcionarioid, dtcadconta, vlsaldo) VALUES ('001  ', '6632X ', '153052', 10, '2016-10-18', NULL);
INSERT INTO public.contas (bancoid, agenciaid, idnuconta, funcionarioid, dtcadconta, vlsaldo) VALUES ('001  ', '6632X ', '153060', 10, '2016-10-18', NULL);
INSERT INTO public.contas (bancoid, agenciaid, idnuconta, funcionarioid, dtcadconta, vlsaldo) VALUES ('001  ', '6633X ', '109520', 20, '2016-10-18', NULL);
INSERT INTO public.contas (bancoid, agenciaid, idnuconta, funcionarioid, dtcadconta, vlsaldo) VALUES ('001  ', '6633X ', '145241', 20, '2016-10-18', NULL);
INSERT INTO public.contas (bancoid, agenciaid, idnuconta, funcionarioid, dtcadconta, vlsaldo) VALUES ('001  ', '6632X ', '451254', 30, '2016-10-18', NULL);
INSERT INTO public.contas (bancoid, agenciaid, idnuconta, funcionarioid, dtcadconta, vlsaldo) VALUES ('001  ', '6632X ', '124527', 30, '2016-10-18', NULL);


--
-- Data for Name: cores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (1, 'abobora', 234, '2012-03-26');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (2, 'Verde', 23452, '2012-03-26');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (3, 'Vermelho', 1452, '2010-10-10');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (4, 'Branco', 14785, '2010-10-10');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (5, 'Abobora', 451256, '2010-10-10');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (6, 'Amarelo', 451256, '2010-10-10');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (7, 'Azul', 415636, '2010-10-10');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (8, 'roxo', 234, '2012-03-26');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (9, 'verde limão', 234, '2012-03-26');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (15, 'ashdfahsdf', 23123, '2013-09-18');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (11, 'Navajo', 145124, '2021-08-24');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (12, 'NavajoWhite', 145125, '2021-08-24');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (13, 'Tomato', 145155, '2021-08-24');
INSERT INTO public.cores (idcor, txnomecor, nupantone, dtcadcor) VALUES (10, 'Preto', 12313, '2021-08-20');


--
-- Data for Name: corescarros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos (idcurso, txnomecurso, "instituicaoid	", qtcargahoraria, dtcadcurso) VALUES (1, 'Conhecimentos de química fundamental na arte culinária.', 1, 50, '2013-03-12');
INSERT INTO public.cursos (idcurso, txnomecurso, "instituicaoid	", qtcargahoraria, dtcadcurso) VALUES (3, 'conceitos fundamentais de astronomia', 2, 80, '2010-10-10');
INSERT INTO public.cursos (idcurso, txnomecurso, "instituicaoid	", qtcargahoraria, dtcadcurso) VALUES (4, 'Administrando Sistemas de Informação com o PostgreSQL', 4, 120, '1996-01-01');
INSERT INTO public.cursos (idcurso, txnomecurso, "instituicaoid	", qtcargahoraria, dtcadcurso) VALUES (5, 'Como Desenvolver um Software com Gambiarra', 3, 60, '2010-10-10');
INSERT INTO public.cursos (idcurso, txnomecurso, "instituicaoid	", qtcargahoraria, dtcadcurso) VALUES (6, 'Avaliação de Mercados emergentes de hipermidias', 4, 60, '2010-10-10');
INSERT INTO public.cursos (idcurso, txnomecurso, "instituicaoid	", qtcargahoraria, dtcadcurso) VALUES (7, 'Fundamentos de Engenharia de Software', 3, 80, '2010-05-10');


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('A02', 'Desenvolvimento de Rotinas de Biblio', 150, 'A01', 'Polo de Desenvolvimento de TI', 450, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('A01', 'Desenvolvimento de Software', 160, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('A11', 'Desenvolvimento de Lixo reciclável', 170, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('B01', 'Desenvolvimento de processos gerenci', 180, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('C01', 'Pesquisa de Mercado para tendências ', 190, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('D01', 'Pesquisa em Biociências', 200, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('D11', 'Oceanografia aplicada em des. de sof', 210, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('D91', 'Pesquisa e desenvolvimento de soluçõ', 220, 'B01', 'centro', 1500, '2016-03-10', '2016-03-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('E01', 'Des. de ambientes de escritórios sus', 230, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('E11', 'Des. de processos de construção civi', 240, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('E21', 'Pesquisa de ferramentas de arquitetu', 260, 'A01', 'Av. Luis Carlos Berrini, 2340', 8000, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('F22', 'Des. de Sists Computacionais', 250, 'A01', 'Av. Circular, 3200', 2500, '2010-10-15', '2011-05-20');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('Z97', 'Desenvolvimento de polos de energia', 290, 'Z97', 'Av. Copernico, 23-456', 7500, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('Z98', 'Desenvolvimento de Usinas Solares.', 120, 'Z97', 'Campus da Universidade de Ourinhos - SP', 900, '2010-10-10', '2010-10-10');
INSERT INTO public.departamentos (iddepto, txnomedepto, funcionariogerenteid, deptosuperiorid, txlocalizacao, qtareatotal, dtcriacaodepto, dtcaddepartamento) VALUES ('Z99', 'Desenvolvimento de Usinas eólicas', 100, 'Z97', 'Centro Empresarial de Fortaleza - CE', 150, '2010-10-10', '2010-10-10');


--
-- Data for Name: departamentostels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentostels (iddeptotel, deptoid, tipotelefoneid, nutelefone, dtcaddeptotel, txnomecontato) VALUES (2, 'F22', 15, '1145874567     ', NULL, NULL);
INSERT INTO public.departamentostels (iddeptotel, deptoid, tipotelefoneid, nutelefone, dtcaddeptotel, txnomecontato) VALUES (4, 'A01', 15, '1425412145     ', NULL, NULL);
INSERT INTO public.departamentostels (iddeptotel, deptoid, tipotelefoneid, nutelefone, dtcaddeptotel, txnomecontato) VALUES (5, 'A01', 15, '14 33256214    ', NULL, NULL);
INSERT INTO public.departamentostels (iddeptotel, deptoid, tipotelefoneid, nutelefone, dtcaddeptotel, txnomecontato) VALUES (3, 'F22', 20, '11452145241    ', NULL, NULL);


--
-- Data for Name: disciplinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (1, 1, 'CALCULO I', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (2, 1, 'CALCULO II', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (3, 1, 'CALCULO IV', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (4, 1, 'CALCULO III', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (5, 1, 'FISICA I', 'Desenvolvimento dos conceitos fundamentais da Física: Força, ação e reação, inércia, campos de força', 100, '2010-10-10', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (6, 1, 'FISICA II', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (7, 1, 'FISICA III', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (8, 3, 'FISICA IV', 'asdfasf', 100, '2012-10-05', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (9, 1, 'PORTUGUES I', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (10, 1, 'PORTUGUES II', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (11, 1, 'ALGORITMOS DE PROGRAMACAO I', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (12, 1, 'ALGORITMOS DE PROGRAMACAO II', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (13, 1, 'LINGUAGEM DE PROGRAMACAO I', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (14, 1, 'LINGUAGEM DE PROGRAMACAO II', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (15, 1, 'LINGUAGEM DE PROGRAMACAO III', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (16, 1, 'LINGUAGEM DE PROGRAMACAO IV', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (17, 1, 'CALCULO NUMERICO', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (18, 1, 'APLICACOES DE CALCULO NUMERICO I', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (19, 1, 'ETICA NA TECNOLOGIA DA INFORMA', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (20, 1, 'TECNICAS DE APRESENTA', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (21, 1, 'Avaliação de Qualidade em Fábrica de Software', 'Apresenta métricas e métodos de avaliação de Qualidade de So', 120, '2010-10-10', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (22, 1, 'ENGENHARIA DE SOFTWARE I', '', 0, '1980-01-01', NULL);
INSERT INTO public.disciplinas (iddisciplina, cursoid, txnomedisciplina, txementa, qthoras, dtcaddisciplina, txcriterioavaliacao) VALUES (27, 7, 'Antropologia moderna', 'Estudos dos comportamentos humanos no contexto dos séculos 20 e 21.', 120, '2010-10-10', NULL);


--
-- Data for Name: duplicatas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.duplicatas (idduplicata, "nfvendaid	", dtvencimento, dtpagamento, vlduplicata, vldesconto, vlliquido, vlmulta, dtcadduplicata) VALUES (10, 13, '2016-01-10', NULL, 50, 5, 45, 5, '2015-12-10');
INSERT INTO public.duplicatas (idduplicata, "nfvendaid	", dtvencimento, dtpagamento, vlduplicata, vldesconto, vlliquido, vlmulta, dtcadduplicata) VALUES (15, 13, '2016-02-10', NULL, 50, 5, 45, 5, '2015-12-10');
INSERT INTO public.duplicatas (idduplicata, "nfvendaid	", dtvencimento, dtpagamento, vlduplicata, vldesconto, vlliquido, vlmulta, dtcadduplicata) VALUES (5, 8, '2015-10-10', NULL, 50, 0, 50, 10, '2015-10-10');
INSERT INTO public.duplicatas (idduplicata, "nfvendaid	", dtvencimento, dtpagamento, vlduplicata, vldesconto, vlliquido, vlmulta, dtcadduplicata) VALUES (20, 8, '2016-01-10', NULL, 50, 5, 45, 10, '2015-12-10');


--
-- Data for Name: editoras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.editoras (ideditora, txnomeeditora, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, aoporteeditora, aoabrangencia, dtfundacao, dtcadeditora) VALUES (1, 'Abril                                                                 ', 'Abril Editora S/C Ltda.', NULL, 450, ' 1234', '12345678', NULL, NULL, NULL, '2010-10-10');
INSERT INTO public.editoras (ideditora, txnomeeditora, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, aoporteeditora, aoabrangencia, dtfundacao, dtcadeditora) VALUES (3, 'Nova                                                                  ', 'Nova Editora S.A.', NULL, 330, ' 1450', '1452142 ', NULL, NULL, NULL, '2006-04-20');
INSERT INTO public.editoras (ideditora, txnomeeditora, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, aoporteeditora, aoabrangencia, dtfundacao, dtcadeditora) VALUES (4, 'FDT Editores                                                          ', 'FDT - Editores Associados S/C Ltda.', NULL, 460, ' 1254', '98765432', NULL, NULL, NULL, '2010-10-10');
INSERT INTO public.editoras (ideditora, txnomeeditora, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, aoporteeditora, aoabrangencia, dtfundacao, dtcadeditora) VALUES (5, 'Ericas                                                                ', 'Editora e produtora Erica S/C Ltda.', NULL, 430, ' 234', '14512412', NULL, NULL, NULL, '2010-10-10');
INSERT INTO public.editoras (ideditora, txnomeeditora, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, aoporteeditora, aoabrangencia, dtfundacao, dtcadeditora) VALUES (2, 'McGraw-Books                                                          ', 'Editora McGraw-Books S.A.', NULL, 290, ' 234', '1245124 ', NULL, NULL, NULL, '2005-05-20');


--
-- Data for Name: editorastels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (5, 1, 10, '11856985221    ', 'Luiz                          ', '2019-02-20');
INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (6, 1, 10, '1145152463     ', 'Antonio Lima                  ', '2019-02-10');
INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (1, 4, 15, '4345124512     ', 'Marsilla                      ', '2018-12-10');
INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (2, 4, 15, '4389562356     ', 'Edivaldo                      ', '2019-03-15');
INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (3, 4, 15, '4356234556     ', 'Guimarães                     ', '2019-03-15');
INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (7, 2, 15, '11451552144    ', 'Carlos Molina                 ', '2019-02-04');
INSERT INTO public.editorastels (ideditoratel, editoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadeditoratel) VALUES (8, 2, 15, '11748451254    ', 'Marilice                      ', '2019-02-04');


--
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresas (idempresa, txnomeusual, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoporteempresa, dtfundacao, dtcadempresa) VALUES (2, 'Lorenzetti', 'Fabrica de Produtos Elétricos Lorenzetti S/C Ltda.', '4567646546546   ', 420, ' 234', '11452145', 1, 'P', '1986-05-20', '2010-10-10');
INSERT INTO public.empresas (idempresa, txnomeusual, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoporteempresa, dtfundacao, dtcadempresa) VALUES (3, 'Supermack', 'Equipamentos Frigoríficos  Supermack S/C Ltda.', '34564643456     ', 560, ' 234', '11451245', 1, 'G', '1996-04-20', '2012-10-10');
INSERT INTO public.empresas (idempresa, txnomeusual, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoporteempresa, dtfundacao, dtcadempresa) VALUES (4, 'TecMon', 'Tecnica de Montagens e Ajustes de Equip. Domiciliares S/C Ltda', '3456354675467856', 440, ' 456', '41452145', 1, 'G', '1966-06-20', '2010-10-10');
INSERT INTO public.empresas (idempresa, txnomeusual, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoporteempresa, dtfundacao, dtcadempresa) VALUES (1, 'FAME', 'Fabrica Americana de Materiais Elétricos S.A.', '45674567456     ', 530, ' 1456', '11452145', 2, 'M', '2005-08-10', '2011-06-10');


--
-- Data for Name: empresastels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresastels (idempresatel, empresaid, tipotelefoneid, nutelefone, txnomecontato, dtcadempresatel) VALUES (5, 1, 15, '1145265236     ', 'José', '2016-05-02');
INSERT INTO public.empresastels (idempresatel, empresaid, tipotelefoneid, nutelefone, txnomecontato, dtcadempresatel) VALUES (6, 1, 20, '154221512150221', 'Nabucodonosor', '2016-05-02');
INSERT INTO public.empresastels (idempresatel, empresaid, tipotelefoneid, nutelefone, txnomecontato, dtcadempresatel) VALUES (7, 1, 20, '4152241251121  ', 'Ana', '2016-05-20');


--
-- Data for Name: especialidadesmedicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (1, 'Clínica Geral', '', '2010-10-05');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (2, 'Pediatria', '', '2010-10-05');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (3, 'Geriatria', '', '2010-10-05');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (4, 'Cardiolgia', '', '2010-10-05');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (5, 'Ortopedia', '', '2010-10-05');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (6, 'Gastroenterologia', '', '2010-10-05');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (7, 'Infectologista', '', '2010-12-10');
INSERT INTO public.especialidadesmedicas (idespecialidade, txnomeespecialidade, txdescricaoespecialidade, dtcadespecmedica) VALUES (8, 'Oncolologista', '', '2010-12-10');


--
-- Data for Name: estadosdospaises; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('AC ', 'Acre', 'Rio Branco', NULL, 100, NULL, '2018-09-30', NULL);
INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('AL ', 'Alagoas', 'Maceio', NULL, 150, NULL, '2018-09-30', NULL);
INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('AM ', 'Amazonas', 'Manaus', NULL, 250, NULL, '2018-09-30', NULL);
INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('BA ', 'Bahia', 'Salvador', NULL, 400, NULL, '2018-09-30', NULL);
INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('ES ', 'Espírito Santo', 'Vitória', NULL, 150, NULL, '2018-09-30', NULL);
INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('DF ', 'Distrito Federal', 'Brasilia', NULL, 10, NULL, '2018-09-30', NULL);
INSERT INTO public.estadosdospaises (idestadodopais, "txnomeestado	", txnomecapital, qtareatotal, qtcidades, qtpopulacao, dtcadestadodopais, paisid) VALUES ('SP ', 'São Paulo', 'São Paulo', NULL, 500, NULL, '2018-09-30', NULL);


--
-- Data for Name: fabricantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fabricantes (idfabricante, txnomefabricante, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoportefabricante, dtfundacao, dtcadfabricante) VALUES (1, 'Volkswagen', 'Fábrica de Veículos Brasileiros VolksWagen S.A.', NULL, 100, ' 34000', '14512413', NULL, NULL, NULL, '2001-05-20');
INSERT INTO public.fabricantes (idfabricante, txnomefabricante, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoportefabricante, dtfundacao, dtcadfabricante) VALUES (2, 'FIAT', 'Fabrica Italiana de Automóveis S.A', NULL, 90, ' 3450', '12987456', NULL, NULL, NULL, '2001-05-20');
INSERT INTO public.fabricantes (idfabricante, txnomefabricante, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoportefabricante, dtfundacao, dtcadfabricante) VALUES (3, 'GM', 'Montador de Veículos General Motors Cia. Ltda.', NULL, 100, ' Km 50', '0232345 ', NULL, NULL, NULL, '1962-10-10');
INSERT INTO public.fabricantes (idfabricante, txnomefabricante, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoportefabricante, dtfundacao, dtcadfabricante) VALUES (4, 'Autolatina', 'Fabrica de veículos automotivos Autolatina S.A.', NULL, 460, '4500', '0451245 ', NULL, NULL, NULL, '2010-10-10');
INSERT INTO public.fabricantes (idfabricante, txnomefabricante, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, setoratuacaoid, aoportefabricante, dtfundacao, dtcadfabricante) VALUES (5, 'Nissan', 'Fábrica de automóveis Nissan do Brasil S.A.', NULL, 170, '1452', '12345678', NULL, NULL, NULL, '2010-10-10');


--
-- Data for Name: fabricantestels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (5, 1, 10, '1178754745     ', 'Hermann', '2019-05-10');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (4, 2, 10, '1144566776     ', 'Ennio', '2019-04-20');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (1, 2, 20, '1144566776     ', 'Ennio', '2019-04-20');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (2, 2, 20, '1144566776     ', 'Ennio', '2019-04-21');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (3, 2, 20, '1144566776     ', 'Ennio', '2019-05-10');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (6, 3, 10, '1197654678     ', 'Smith', '2019-09-01');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (7, 4, 10, '1147574845     ', 'Joselva', '2019-09-01');
INSERT INTO public.fabricantestels (idfabricantetel, fabricanteid, tipotelefoneid, nutelefone, txnomecontato, dtcadfabrictel) VALUES (8, 5, 10, '1174851245     ', 'Jose Kualker', '2019-09-01');


--
-- Data for Name: faturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.faturas (idfatura, nunfcompraid, dtvencimento, dtpagamento, vlfatura, vldesconto, vlliquido, vlmulta, dtcadfatura) VALUES (5, 1, '2016-11-10', NULL, 2105, 0, 2255, 150, '2016-11-12');
INSERT INTO public.faturas (idfatura, nunfcompraid, dtvencimento, dtpagamento, vlfatura, vldesconto, vlliquido, vlmulta, dtcadfatura) VALUES (10, 1, '2016-12-10', NULL, 850, 0, 850, 0, '2016-10-10');
INSERT INTO public.faturas (idfatura, nunfcompraid, dtvencimento, dtpagamento, vlfatura, vldesconto, vlliquido, vlmulta, dtcadfatura) VALUES (15, 2, '2016-11-10', NULL, 2500, 0, 2500, 0, '2016-11-10');
INSERT INTO public.faturas (idfatura, nunfcompraid, dtvencimento, dtpagamento, vlfatura, vldesconto, vlliquido, vlmulta, dtcadfatura) VALUES (20, 3, '2016-11-10', NULL, 2500, 0, 2500, 0, '2016-11-10');
INSERT INTO public.faturas (idfatura, nunfcompraid, dtvencimento, dtpagamento, vlfatura, vldesconto, vlliquido, vlmulta, dtcadfatura) VALUES (25, 3, '2015-12-10', NULL, 650, 0, 650, 0, '2016-11-10');
INSERT INTO public.faturas (idfatura, nunfcompraid, dtvencimento, dtpagamento, vlfatura, vldesconto, vlliquido, vlmulta, dtcadfatura) VALUES (30, 1, '2010-10-10', NULL, 500, 80, 420, 120, '2010-10-05');


--
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornecedores (idfornecedor, txnomefornecedor, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, nusedes, vllimitecompra, setoratuacaoid, aoportefornecedor, dtfundacao, dtcadfornecedor) VALUES (1, 'Fazenda Rio Branco', 'Latic', NULL, 370, ' Km 350', '12345678', 1, 100000, NULL, NULL, NULL, '2008-01-20');
INSERT INTO public.fornecedores (idfornecedor, txnomefornecedor, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, nusedes, vllimitecompra, setoratuacaoid, aoportefornecedor, dtfundacao, dtcadfornecedor) VALUES (2, 'Leite Mont Blanc', 'Laticinio Mont Blanc S/C Ltda.', NULL, 590, ' Km 289', '12345678', 2, 120000, NULL, NULL, NULL, '2010-10-10');
INSERT INTO public.fornecedores (idfornecedor, txnomefornecedor, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, nusedes, vllimitecompra, setoratuacaoid, aoportefornecedor, dtfundacao, dtcadfornecedor) VALUES (5, 'Hamburgueria Girafa', 'Restaurante Franco-Italiano Girafa S/C Ltda.', NULL, 70, ' 4345', '12345678', 2, 5000, NULL, NULL, NULL, '1998-10-10');
INSERT INTO public.fornecedores (idfornecedor, txnomefornecedor, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, nusedes, vllimitecompra, setoratuacaoid, aoportefornecedor, dtfundacao, dtcadfornecedor) VALUES (10, 'Fazenda Rio Claro', 'Fazenda de produtos laticionios Rio Claro S/C Ltda.', NULL, 240, 'Km 35', '74512845', 2, 50000, NULL, NULL, NULL, '2010-10-10');


--
-- Data for Name: fornecedorestels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fornecedorestels (idfornecedortel, fornecedorid, tipotelefoneid, nutelefone, txnomecontato, dtcadfornecedortel) VALUES (1, 1, 10, '1174185296     ', NULL, '2019-09-02');
INSERT INTO public.fornecedorestels (idfornecedortel, fornecedorid, tipotelefoneid, nutelefone, txnomecontato, dtcadfornecedortel) VALUES (2, 2, 10, '5474185296     ', NULL, '2019-09-02');
INSERT INTO public.fornecedorestels (idfornecedortel, fornecedorid, tipotelefoneid, nutelefone, txnomecontato, dtcadfornecedortel) VALUES (3, 5, 10, '1196385274     ', NULL, '2019-09-02');
INSERT INTO public.fornecedorestels (idfornecedortel, fornecedorid, tipotelefoneid, nutelefone, txnomecontato, dtcadfornecedortel) VALUES (4, 10, 10, '3145124512     ', NULL, '2019-09-02');
INSERT INTO public.fornecedorestels (idfornecedortel, fornecedorid, tipotelefoneid, nutelefone, txnomecontato, dtcadfornecedortel) VALUES (5, 1, 15, '43985264521    ', NULL, '2019-09-02');


--
-- Data for Name: fornecimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (40, 'MAUDE', 'SETRIGHT', 'E11', 10, 99, 470, ' 234', '3332', '1994-09-12', 'F', '1961-04-21', '', 35900, 300, 1272, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (60, 'IRVING', 'STERN', 'D11', 4, 16, 380, ' 125 - 15And Ap 156', '6423', '2003-09-14', 'M', '1975-07-07', '', 72250, 500, 2580, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (100, 'THEODORE', 'SPENSER', 'E21', 6, 14, 600, ' 985', '0972', '2000-06-19', 'M', '1980-12-18', '', 86150, 500, 2092, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (110, 'VINCENZO', 'LUCCHESSI', 'A01', 7, 19, 570, ' 25 - Vila Siqueira', '3490', '1988-05-16', 'M', '1959-11-05', '', 66500, 900, 3720, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (160, 'ELIZABETH', 'PIANKA', 'D11', 6, 17, 550, ' 567', '3782', '2006-10-11', 'F', '1980-04-12', '', 62250, 400, 1780, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (170, 'MASATOSHI', 'YOSHIMURA', 'D11', 7, 16, 540, ' 234', '2890', '1999-09-15', 'M', '1981-01-05', '', 44680, 500, 1974, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (180, 'MARILYN', 'SCOUTTEN', 'D11', 7, 17, 450, ' 1234', '1682', '2003-07-07', 'F', '1979-02-21', '', 51340, 500, 1707, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (210, 'WILLIAM', 'JONES', 'D11', 10, 17, 460, ' 1254', '0942', '1998-04-11', 'M', '2003-02-23', '', 68270, 400, 1462, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (220, 'JENNIFER', 'LUTZ', 'D11', 10, 18, 430, ' 234', '0672', '1998-08-29', 'F', '1978-03-19', '', 49840, 600, 2387, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (230, 'JAMES', 'JEFFERSON', 'A11', 7, 16, 530, ' 1456', '2094', '1996-11-21', 'M', '1980-05-30', '', 42180, 400, 1774, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (240, 'SALVATORE', 'MARINO', 'D01', 10, 17, 420, ' 234', '3780', '2004-12-05', 'M', '2002-03-31', '', 48760, 600, 2301, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (250, 'DANIEL', 'SMITH', 'D01', 9, 15, 560, ' 234', '0961', '1999-10-30', 'M', '1969-11-12', '', 49180, 400, 1534, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (260, 'SYBIL', 'JOHNSON', 'D01', 9, 16, 440, ' 456', '8953', '2005-09-11', 'F', '1976-10-05', '', 47250, 300, 1380, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (270, 'MARIA', 'PEREZ', 'D01', 10, 15, 100, ' 34000', '9001', '2006-09-30', 'F', '2003-05-26', '', 37380, 500, 2190, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (280, 'ETHEL', 'SCHNEidER', 'E11', 10, 17, 490, ' 452', '8997', '1997-03-24', 'F', '1980-01-01', 'Um teste de troca', 36250, 500, 2100, '12345678', '2010-10-10');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (330, 'DIAN', 'HEMMINGER', 'A01', 8, 18, 470, ' 1492', '3978', '1995-01-01', 'F', '1973-08-14', '', 46500, 1000, 4220, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (340, 'GREG', 'ORLANDO', 'A01', 7, 14, 470, ' 234', '2167', '2002-05-05', 'M', '1972-10-18', '', 39250, 600, 2340, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (350, 'KIM', 'NATZ', 'C01', 8, 18, 470, ' 234', '1793', '2006-12-15', 'F', '1976-01-19', '', 68420, 600, 2274, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (360, 'KIYOSHI', 'YAMAMOTO', 'D11', 7, 16, 470, ' 234', '2890', '2005-09-15', 'M', '1981-01-05', '', 64680, 500, 1974, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (370, 'REBA', 'JOHN', 'D11', 8, 18, 610, ' 6500', '0672', '2005-08-29', 'F', '1978-03-19', '', 69840, 600, 2387, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (380, 'ROBERT', 'MONTEVERDE', 'D01', 8, 17, 610, ' 6500', '3780', '2004-12-05', 'M', '1984-03-31', '', 37760, 600, 2301, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (390, 'EILEEN', 'SCHWARTZ', 'E11', 9, 17, 360, ' 1400', '8997', '1997-03-24', 'F', '1966-03-28', '', 46250, 500, 2100, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (400, 'MICHELLE', 'SPRINGER', 'E11', 9, 99, 520, ' 1245', '3332', '1994-09-12', 'F', '1961-04-21', '', 35900, 300, 1272, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (410, 'HELENA', 'WONG', 'E21', 9, 14, 600, ' 985', '2103', '2006-02-23', 'F', '1971-07-18', '', 35370, 500, 2030, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (420, 'ROY', 'ALONZO', 'E21', 10, 16, 590, ' 35 - Camp', '5698', '1997-07-05', 'M', '1956-05-17', '', 31840, 500, 1907, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (430, 'JOSE', 'BUENO', 'D01', 9, 14, 570, ' 25 - Vila Siqueira', '2145', '1980-01-01', 'M', '1980-01-01', '', 1250, 100, 500, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (440, 'Teste', 'Silva', 'A01', 12, 14, 570, ' 25 - Vila Siqueira', '3232', '2010-05-10', 'M', '1985-10-20', '', 1600, 200, 200, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (450, 'Louis', 'Armstrong', 'A01', 1, 18, 590, ' 35 - Camp', '452 ', '2002-10-20', 'M', '1958-05-15', 'Músico', 2500, 500, 400, '1452151 ', '2002-10-20');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (460, 'Ella', 'Frintgerald', 'B01', 1, 18, 600, ' 985', '452 ', '2002-10-20', 'F', '1958-05-14', 'Cantora', 2500, 500, 400, '14511254', '2002-10-05');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (470, 'Leonidas', 'Spartacus', 'D11', 5, 20, 600, ' 985', '666 ', '1901-10-10', 'M', '1960-05-05', 'Forte pacas', 12000, 1000, 500, '0451245 ', '1902-10-10');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (310, 'WING WONG', 'LEE', 'E21', 8, 14, 600, ' 985', '2103', '2006-02-23', 'M', '1971-07-18', '', 45370, 500, 2030, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (20, 'MICHAEL', 'THOMPSON', 'B01', 3, 18, 470, ' 1492', '3476', '2003-10-10', 'M', '1978-02-02', '', 94250, 800, 3300, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (30, 'SALLY', 'KWAN', 'C01', 2, 20, 470, ' 234', '4738', '2005-04-05', 'F', '1971-05-11', '', 98250, 800, 3060, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (320, 'JASON MORISON', 'GOUNOT', 'E21', 9, 16, 590, ' 35 - Camp', '5698', '1977-05-05', 'M', '1956-05-17', '', 43840, 500, 1907, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (10, 'CHRISTINE MARIE', 'HAAS', 'A01', 1, 18, 350, ' 1243', '3978', '1995-01-01', 'F', '1963-08-24', '', 152750, 1000, 4220, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (290, 'JOHN CARPENTER', 'PARKER', 'E11', 10, 99, 350, ' 1243', '4502', '2006-05-30', 'M', '1985-07-09', '', 35340, 300, 1227, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (300, 'PHILIP MORIS', 'SMITH', 'E11', 10, 14, 550, ' 567', '2095', '2002-06-19', 'M', '1976-10-27', '', 37750, 400, 1420, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (120, 'SEAN PEAN', 'O CONNELL', 'A01', 8, 14, 590, ' 35 - Camp', '2167', '1993-12-05', 'M', '1972-10-18', '', 49250, 600, 2340, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (130, 'DOLORES MARIA', 'QUINTANA', 'C01', 7, 16, 580, ' 345', '4578', '2001-07-28', 'F', '1955-09-15', '', 73800, 500, 1904, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (150, 'BRUCE TAYLOR', 'ADAMSON', 'A01', 7, 16, 490, ' 452', '4510', '2002-02-12', 'M', '1977-05-17', NULL, 55280, 500, 2022, '12312312', '2010-10-10');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (190, 'JAMES PAUL', 'WALKER', 'D11', 9, 16, 290, ' 234', '2986', '2004-07-26', 'M', '1982-06-25', '', 50450, 400, 1636, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (200, 'DAVID CHARLES', 'BROWN', 'D11', 9, 16, 330, ' 1450', '4501', '2002-03-03', 'M', '1971-05-29', '', 57740, 600, 2217, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (50, 'JOHN SILVESTER', 'GEYER', 'E01', 5, 16, 610, ' 6500', '6789', '1979-08-17', 'M', '1955-09-15', '', 80175, 800, 3214, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (70, 'EVA MARIA', 'PULASKI', 'D01', 10, 16, 360, ' 1400', '7831', '2005-09-30', 'F', '2003-05-26', '', 96170, 700, 2893, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (80, 'RAMLAL ABDUL', 'MEHTA', 'E21', 10, 16, 520, ' 1245', '9990', '1995-07-07', 'M', '1962-08-11', '', 39950, 400, 1596, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (90, 'EILEEN B''ORGN', 'HENDERSON', 'E11', 10, 16, 390, ' 150', '5498', '2000-08-15', 'F', '1971-05-15', '', 89750, 600, 2380, '        ', '1980-01-01');
INSERT INTO public.funcionarios (idfuncionario, txprenomes, txsobrenome, deptoid, funcaoid, "grauescolaridadeid	", logradouroid, txcomplemento, nuramal, dtcontratacao, aosexo, dtnascimento, txresenha, vlsalario, vlbonus, vlcomissao, nucep, dtcadfuncionario) VALUES (480, 'HELENA', 'WONG', 'E21', 9, 14, 600, ' 985', '2103', '2006-02-23', 'F', '1971-07-18', '', 35370, 500, 2030, '        ', '1980-01-01');


--
-- Data for Name: funcionariosplanos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionariosplanos (idfuncionarioplano, funcionarioid, planodesaudeid, dtvinculacao, dtdesligamento, dtcadfuncplano) VALUES (5, 10, 1, '2016-12-07', '2016-12-07', '2016-12-07');
INSERT INTO public.funcionariosplanos (idfuncionarioplano, funcionarioid, planodesaudeid, dtvinculacao, dtdesligamento, dtcadfuncplano) VALUES (10, 20, 1, '2016-12-07', '2016-12-07', '2016-12-07');
INSERT INTO public.funcionariosplanos (idfuncionarioplano, funcionarioid, planodesaudeid, dtvinculacao, dtdesligamento, dtcadfuncplano) VALUES (15, 10, 2, '2016-12-07', '2016-12-07', '2016-12-07');
INSERT INTO public.funcionariosplanos (idfuncionarioplano, funcionarioid, planodesaudeid, dtvinculacao, dtdesligamento, dtcadfuncplano) VALUES (20, 10, 4, '2016-12-07', '2016-12-07', '2016-12-07');


--
-- Data for Name: funcionariostels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionariostels (idfuncionariotel, funcionarioid, tipotelefoneid, nutelefone, txnomecontato, "dtcadfuncionariotel	") VALUES (4, 20, 5, '2345345        ', 'José', '2017-05-20');
INSERT INTO public.funcionariostels (idfuncionariotel, funcionarioid, tipotelefoneid, nutelefone, txnomecontato, "dtcadfuncionariotel	") VALUES (2, 10, 10, '2342345        ', 'Ana', '2018-04-10');
INSERT INTO public.funcionariostels (idfuncionariotel, funcionarioid, tipotelefoneid, nutelefone, txnomecontato, "dtcadfuncionariotel	") VALUES (3, 10, 15, '23453245       ', 'Rui', '2018-05-10');
INSERT INTO public.funcionariostels (idfuncionariotel, funcionarioid, tipotelefoneid, nutelefone, txnomecontato, "dtcadfuncionariotel	") VALUES (1, 10, 20, '1231313        ', 'Abel', '2018-06-25');


--
-- Data for Name: funcoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (1, 'Presidente', '', 15, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (2, 'Diretor Comercial', '', 5, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (3, 'Diretor Administrativo', '', 5, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (4, 'Diretor Produ', '', 5, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (5, 'Gerente De Vendas', '', 1, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (6, 'Gerente de Compras', '', 1, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (7, 'Gerente de contas', '', 1, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (8, 'Gerente de Recursos Humanos', '', 1, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (11, 'Professor', '', 2, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (12, 'Auxiliar Administrativo', '', 1, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (13, 'Chef', 'Cozinheiro Chefe do Restaurante', 5, '2021-08-24');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (14, 'SuChef1', 'Cozinheiro sub-Chefe1 do Restaurante', 3, '2021-08-24');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (15, 'SuChef2', 'Cozinheiro sub-Chefe2 do Restaurante', 2, '2021-08-24');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (10, 'Gerente operação', '', 1, '1980-01-01');
INSERT INTO public.funcoes (idfuncao, txnomefuncao, txdescricaofuncao, qtanosprefuncao, dtcadfuncao) VALUES (9, 'Gerente de Relações Públicas', '', 1, '1980-01-01');


--
-- Data for Name: grausdeescolaridade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (14, 'Ensino fundamental I', 4, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (15, 'Ensino Fundamental II', 4, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (16, 'Jardim I', 1, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (17, 'Jardim II', 2, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (18, 'Ensino Medio', 3, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (19, 'Superior', 5, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (20, 'Pos-Graduacao (Mestrado)', 3, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (99, 'Pos-Graduacao (Doutorado)', 5, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (30, 'Pos-Graduacao (MBA)', 1, '1980-01-01');
INSERT INTO public.grausdeescolaridade (idgrauescolaridade, txnomecomum, qtanosdeestudo, dtcadgrauescolaridade) VALUES (31, 'Mestrado', 3, '2011-12-10');


--
-- Data for Name: habilitacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (10, 3, 2, '2010-05-05', '2010-05-05', '2010-05-10');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (15, 3, 2, '2010-10-10', '2010-10-10', '2010-10-10');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (20, 3, 2, '2012-10-10', '2012-10-10', '2012-10-15');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (30, 3, 4, '2010-05-05', '2010-05-05', '2010-05-10');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (35, 3, 4, '2012-10-10', '2012-10-10', '2012-10-15');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (40, 3, 6, '2012-10-10', '2012-10-10', '2012-10-15');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (45, 3, 21, '2012-10-10', '2012-10-10', '2012-10-15');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (55, 3, 24, '2012-10-10', '2012-10-10', '2012-10-15');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (60, 4, 2, '2010-10-10', '2010-10-10', '2010-10-10');
INSERT INTO public.habilitacoes (idhabilitacao, cursoid, professorid, dthabilitacao, dtcapacitacao, dtcadhabilitacao) VALUES (70, 5, 1, '2012-10-10', '2012-10-10', '2012-10-15');


--
-- Data for Name: historicoprofissional; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historicoprofissional ("idhistprof	", funcionarioid, empresaid, atividadeid, dtinicio, dttermino, dtcadhistprof) VALUES (4, 90, 1, 25, '2002-06-26', '2004-07-30', '2012-10-01');
INSERT INTO public.historicoprofissional ("idhistprof	", funcionarioid, empresaid, atividadeid, dtinicio, dttermino, dtcadhistprof) VALUES (11, 150, 1, 5, '2007-05-10', '2007-09-10', '2007-05-10');
INSERT INTO public.historicoprofissional ("idhistprof	", funcionarioid, empresaid, atividadeid, dtinicio, dttermino, dtcadhistprof) VALUES (1, 10, NULL, 15, '2001-01-20', '2002-06-25', '2010-10-01');
INSERT INTO public.historicoprofissional ("idhistprof	", funcionarioid, empresaid, atividadeid, dtinicio, dttermino, dtcadhistprof) VALUES (3, 60, 1, 20, '2001-01-20', '2002-06-25', '2012-08-12');
INSERT INTO public.historicoprofissional ("idhistprof	", funcionarioid, empresaid, atividadeid, dtinicio, dttermino, dtcadhistprof) VALUES (5, 70, 1, 30, '2012-10-10', '2013-11-10', '2013-06-19');
INSERT INTO public.historicoprofissional ("idhistprof	", funcionarioid, empresaid, atividadeid, dtinicio, dttermino, dtcadhistprof) VALUES (6, 150, 1, 30, '2010-10-10', '2011-10-10', '2013-06-21');


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: idiomasfalados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: instituicoesdeensino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instituicoesdeensino ("idinstituicaodeensino	", txnomeinstituicao, logradouroid, txcomplemento, aotipoinstituicao, dtfundacao, nucep, "dtcadinstituicaodeensino	") VALUES (1, 'Faculdade de Belas Artes', 60, ' 1500', 'P', '1958-05-10', '12767890', '2001-01-10');
INSERT INTO public.instituicoesdeensino ("idinstituicaodeensino	", txnomeinstituicao, logradouroid, txcomplemento, aotipoinstituicao, dtfundacao, nucep, "dtcadinstituicaodeensino	") VALUES (2, 'Faculdade de Arqitetura de Urbanismo de S', 120, ' 500', 'G', '1952-05-10', '        ', '2001-01-10');
INSERT INTO public.instituicoesdeensino ("idinstituicaodeensino	", txnomeinstituicao, logradouroid, txcomplemento, aotipoinstituicao, dtfundacao, nucep, "dtcadinstituicaodeensino	") VALUES (3, 'Escola Politecnica da USP', 10, ' 564 - sob a escada', 'G', '1892-01-10', '14514251', '2001-10-10');
INSERT INTO public.instituicoesdeensino ("idinstituicaodeensino	", txnomeinstituicao, logradouroid, txcomplemento, aotipoinstituicao, dtfundacao, nucep, "dtcadinstituicaodeensino	") VALUES (4, 'Escola de 1 e 2 Grau Amadeu Amaral', 500, ' 1200', 'G', '1918-06-20', '14215125', '1996-01-01');
INSERT INTO public.instituicoesdeensino ("idinstituicaodeensino	", txnomeinstituicao, logradouroid, txcomplemento, aotipoinstituicao, dtfundacao, nucep, "dtcadinstituicaodeensino	") VALUES (5, 'Escola Superior de Propaganda e Marketing', 470, ' 3456', 'P', '1950-01-10', '15642854', '2010-10-10');
INSERT INTO public.instituicoesdeensino ("idinstituicaodeensino	", txnomeinstituicao, logradouroid, txcomplemento, aotipoinstituicao, dtfundacao, nucep, "dtcadinstituicaodeensino	") VALUES (6, 'Faculdade de Medicina da Universidade de São Paulo', 440, '455', 'G', NULL, '01246903', '2021-10-13');


--
-- Data for Name: instituicoesdeensinotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instituicoesdeensinotels (idinstituicaodeensinotel, "instituicaoid	", tipotelefoneid, nutelefone, txnomecontato, "dtcadinstituicaoensinotel	") VALUES (1, 5, 15, '1433526523     ', NULL, '2016-08-28');
INSERT INTO public.instituicoesdeensinotels (idinstituicaodeensinotel, "instituicaoid	", tipotelefoneid, nutelefone, txnomecontato, "dtcadinstituicaoensinotel	") VALUES (2, 5, 20, '1545124512     ', NULL, '2016-08-28');
INSERT INTO public.instituicoesdeensinotels (idinstituicaodeensinotel, "instituicaoid	", tipotelefoneid, nutelefone, txnomecontato, "dtcadinstituicaoensinotel	") VALUES (3, 5, 20, '1124512542     ', NULL, '2016-08-28');
INSERT INTO public.instituicoesdeensinotels (idinstituicaodeensinotel, "instituicaoid	", tipotelefoneid, nutelefone, txnomecontato, "dtcadinstituicaoensinotel	") VALUES (4, 3, 20, '1425252541     ', NULL, '2016-08-28');
INSERT INTO public.instituicoesdeensinotels (idinstituicaodeensinotel, "instituicaoid	", tipotelefoneid, nutelefone, txnomecontato, "dtcadinstituicaoensinotel	") VALUES (5, 3, 20, '1145215213     ', NULL, '2016-08-28');
INSERT INTO public.instituicoesdeensinotels (idinstituicaodeensinotel, "instituicaoid	", tipotelefoneid, nutelefone, txnomecontato, "dtcadinstituicaoensinotel	") VALUES (7, 3, 20, '545454         ', NULL, '2016-08-28');


--
-- Data for Name: livros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (10, 'Preparando pratos com Lagostas', NULL, 1, '2010-10-12', '2010', NULL, 20, 2, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (20, 'Cálculo Diferencial e Integral', NULL, 1, '2010-10-12', '2010', NULL, 40, 10, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (30, 'exercicios de matematica', NULL, 3, '2008-10-10', '2008', NULL, 50, 10, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (50, 'Física Quantica', NULL, 3, '2008-10-10', '2008', NULL, 60, 20, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (60, 'Introdução a Bancos de Dados', NULL, 1, '2008-10-10', '2008', NULL, 80, 20, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (70, 'Cálculo Diferencial e Integral', NULL, 2, '2010-10-12', '2010', NULL, 120, 20, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (80, 'Projetos de Grandes Estruturas', NULL, 3, '2010-10-10', '2010', NULL, 150, 25, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (90, 'Cálculo Estrutural I', NULL, NULL, '2010-10-12', '2010', NULL, 200, 50, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (40, 'O Alfabeto dos Numeros', NULL, NULL, '2008-10-10', '2008', NULL, 20, 5, '2011-08-01');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (100, 'A Menina que roubava Livros', NULL, NULL, '2007-04-10', '2007', NULL, 75, 10, '2007-05-10');
INSERT INTO public.livros (idlivro, txtitulolivro, nuisbn, editoraid, dtpublicacao, nuanopublicacao, qtpaginas, qtexemplares, qtexemplaresconsulta, dtcadlivro) VALUES (110, 'O fim da eternidade', NULL, 1, '2019-09-10', '2019', 456, 35, 15, '2019-09-30');


--
-- Data for Name: logradouros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (10, 'dos alfineiros', 5, 33, NULL, '1996-01-01');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (40, 'Luiz Antonio', 5, 33, NULL, '2000-05-29');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (70, 'Brigadeiro Luis Antonio', 10, 33, NULL, '2001-01-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (100, 'Anchieta', 5, 32, NULL, '2001-05-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (240, 'das Trombetas', 5, 2, NULL, '2005-03-12');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (90, 'Troncoso', 5, 33, NULL, '2001-05-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (110, 'Miguel Faria Lima', 10, 33, NULL, '2001-08-21');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (130, 'das Laranjeiras', 20, 33, NULL, '2002-01-21');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (140, 'Direita', 10, 33, NULL, '2002-05-13');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (150, 'Roberto Simonsen', 20, 33, NULL, '2002-05-16');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (160, 'dos Alfineiros', 5, 33, NULL, '2002-05-28');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (190, 'Sta Maria da Conceição', 5, 33, NULL, '2003-05-27');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (200, 'Tavares de Miranda', 10, 33, NULL, '2004-02-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (210, 'MMDC', 10, 33, NULL, '2004-02-14');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (230, 'Circular', 5, 33, NULL, '2005-02-16');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (250, 'Celso Garcia', 20, 33, NULL, '2005-03-25');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (270, 'Brigadeiro Faria Lima', 5, 33, NULL, '2005-05-14');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (280, 'Troncoso Perez', 20, 33, NULL, '2005-05-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (20, 'Horácio Soares', 10, 4, NULL, '1998-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (50, 'Ricardo Berrini', 5, 4, NULL, '2000-06-14');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (60, 'Universitária', 5, 4, NULL, '2001-01-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (120, 'Politécnica', 10, 4, NULL, '2001-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (180, 'João Cabral de Mello Netto', 5, 4, NULL, '2003-04-23');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (220, 'Celso Garcia', 20, 4, NULL, '2005-01-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (260, 'dos Autonomistas', 20, 4, NULL, '2005-05-12');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (290, 'dos Timbiras', 10, 4, NULL, '2005-05-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (300, 'Campos Elíseos', 10, 4, NULL, '2005-05-28');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (310, 'Filadélfia', 5, 4, NULL, '2005-09-18');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (320, 'Maranhão', 5, 4, NULL, '2005-12-13');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (170, 'Quintino Bocaiuva', 5, 33, NULL, '2002-10-21');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (80, 'Doze de Outubro', 5, 33, NULL, '2001-05-16');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (490, 'Arthur Thomas', 5, 4, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (610, 'Vital Brasil', 10, 4, NULL, '2014-03-14');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (620, 'das Nações Unidas', 5, 4, NULL, '2013-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (570, 'Anhaguera', 10, 32, NULL, '2012-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (590, 'Castelo Branco', 10, 32, NULL, '2014-01-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (350, 'Pamplona', 5, 2, NULL, '2007-01-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (380, 'Pérola Bygton', 5, 28, NULL, '2009-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (370, 'Ibitirama', 5, 13, NULL, '2008-01-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (510, 'Quintino Bocaiuva', 5, 33, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (520, 'Pamplona', 10, 33, NULL, '2011-06-01');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (530, 'Bresser', 10, 33, NULL, '2011-06-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (540, 'Cristóvão Bueno', 20, 33, NULL, '2011-10-22');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (550, 'Gaspar Bueno de Almeida', 5, 33, NULL, '2011-10-24');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (560, 'Paraisópolis', 10, 33, NULL, '2012-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (580, 'Alvarenga Peixoto', 5, 33, NULL, '2013-03-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (600, 'Pelotas', 10, 33, NULL, '2014-03-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (330, 'Liberdade', 10, 4, NULL, '2006-04-20');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (450, 'Rubens de Almeida Falcão', 10, 4, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (460, 'Rio Branco', 35, 4, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (470, 'Ruben Berta', 5, 4, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (340, 'Almeida Lima Gutemberg', 10, 33, NULL, '2006-05-13');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (360, 'Augusta', 10, 33, NULL, '2007-02-02');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (390, 'Paulo Sá', 10, 33, NULL, '2009-12-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (400, 'Altino Arantes', 5, 33, NULL, '2010-02-12');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (410, 'Rui Barbosa', 5, 33, NULL, '2010-02-12');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (420, 'dos Alfineiros', 10, 33, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (430, 'São Joaquim', 20, 33, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (440, 'Alba', 5, 33, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (480, 'dos Maias', 10, 33, NULL, '2010-10-10');
INSERT INTO public.logradouros (idlogradouro, txnomelogradouro, cidadeid, tipologradouroid, aotipodepiso, dtcadlogradouro) VALUES (500, 'Bela Cintra', 10, 33, NULL, '2010-10-10');


--
-- Data for Name: logradourostipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (1, 'Aeroporto', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (2, 'Alameda', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (3, 'Área', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (4, 'Avenida', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (5, 'Campo', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (6, 'Chácara', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (7, 'Colônia', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (8, 'Condomínio', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (9, 'Conjunto', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (10, 'Distrito', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (11, 'Esplanada', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (12, 'Estação', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (13, 'Estrada', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (14, 'Favela', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (15, 'Fazenda', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (16, 'Feira', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (17, 'Jardim', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (18, 'Ladeira', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (19, 'Lago', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (20, 'Lagoa', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (21, 'Largo', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (22, 'Loteamento', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (23, 'Morro', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (24, 'Núcleo', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (25, 'Parque', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (26, 'Passarela', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (27, 'Pátio', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (28, 'Praça', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (29, 'Quadra', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (30, 'Recanto', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (31, 'Residencial', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (32, 'Rodovia', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (33, 'Rua', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (34, 'Setor', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (35, 'Sítio', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (36, 'Travessa', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (37, 'Trecho', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (38, 'Trevo', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (39, 'Vale', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (40, 'Vereda', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (41, 'Via', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (42, 'Viaduto', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (43, 'Viela', '2018-10-25');
INSERT INTO public.logradourostipos (idlogradourotipo, "txnometipologradouro	", dtcadtipologradouro) VALUES (44, 'Vila', '2018-10-25');


--
-- Data for Name: matriculas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (2, 1, 20, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (3, 1, 30, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (4, 1, 40, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (5, 2, 10, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (6, 2, 20, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (7, 2, 30, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (8, 2, 40, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (9, 3, 10, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (10, 3, 20, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (11, 3, 30, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (12, 3, 40, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (13, 4, 10, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (14, 4, 20, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (15, 4, 30, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (16, 4, 40, '2014-08-01', '2015-06-30', '2015-07-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (21, 5, 230, '2012-10-10', '2013-10-10', '2012-10-05');
INSERT INTO public.matriculas (idmatricula, "turmaid	", funcionarioid, dtmatricula, dtvalidade, dtcadmatricula) VALUES (1, 1, 70, '2014-08-01', '2015-06-30', '2015-07-05');


--
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (1, 'Sebastião Quirino dos Santos', 1234, 5, 1, 350, '1450 - ap45', 350, '1460 - 25ºAndar Cj 2547', 'A', '2010-10-05', '12345678', '14258963');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (8, 'Alberto Clementino dos Santos', 332222, 3, 2, 20, '500', 470, '456', 'A', '2001-10-05', '65487123', '12345698');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (2, 'Franco da Rocha', 1233, 1, 1, 470, '', 350, '', 'D', '2010-10-05', '87654321', '41852963');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (7, 'Natalia Huang Hypolito', 123123, 2, 2, 470, '', 470, '', 'D', '2010-10-10', '36258147', '85236941');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (6, 'Geraldo Luiz Albuquerque Ramos', 7765765, 1, 4, 610, '', 300, '', 'D', '2010-10-10', '63741258', '98654253');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (5, 'Eliseu Marcos Alves Santana', 1234567684, 8, 3, 300, '1852 - Ap. 254', 260, '786 - 3ºAndar conjunto 39', 'A', '2020-10-25', '12654789', '45745645');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (9, 'Luis Henrique Amadeu Amaral', 4654651, 7, 4, 240, '', 240, '', 'A', '2021-10-19', NULL, NULL);
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (3, 'Rogerio Albuquerque de Oliveira', 1235678, 2, NULL, 240, '', 350, '', 'A', '1986-05-10', '85274163', '85241963');
INSERT INTO public.medicos (idmedico, txnomemedico, nucrm, especialidadeid, "instituicaodeensinoid	", logradouromoradiaid, txcomplementomoradia, "logradouroclinicaid	", txcomplementoclinica, aosituacao, dtcadmedico, nucepmoradia, nucepclinica) VALUES (4, 'Marina Emanuela Carolina Bizeo', 123452, 4, NULL, 240, '450', 620, '540', 'A', '2010-10-10', '74163852', '89456324');


--
-- Data for Name: medicostels; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: movimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (1, 10, 50, '2010-10-10', 10, '2010-10-10', '2010-10-10', '2010-10-15');
INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (2, 40, 80, '2011-08-25', 10, '2011-08-25', '2011-08-25', '2011-08-25');
INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (3, 40, 70, '2011-08-31', 20, '2011-08-31', '2011-08-31', '2011-08-31');
INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (4, 40, 200, '2011-08-31', 30, '2011-08-31', '2011-08-31', '2011-08-31');
INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (5, 10, 50, '2010-10-11', 30, '2010-10-11', '2010-10-11', '2010-10-15');
INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (7, 10, 50, '2010-10-10', 20, '2010-10-10', '2010-10-10', '2010-10-15');
INSERT INTO public.movimentos (idmovimento, livroid, funcionarioid, dtmovimento, tipomovimentoid, dtprevistadevolucao, dtrealdevolucao, dtcadmovimento) VALUES (6, 20, 150, '2010-10-10', 20, '2010-10-15', '2010-10-14', '2010-10-10');


--
-- Data for Name: movimentostipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (10, 'Entrada em Tombamento', 'A', '2011-08-20');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (20, 'Saida de Tombamento', 'A', '2011-08-20');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (30, 'Disponibilização em Acervo', 'A', '2011-08-20');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (40, 'Retirada da Acervo', 'S', '2011-08-20');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (50, 'Devolução de Retirada do Acervo', 'E', '2011-08-20');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (60, 'Consulta do Acervo', 'S', '2011-08-20');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (70, 'Devolução de Consulta do Acervo', 'E', '2014-05-26');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (80, 'Empréstimo entre Bibliotecas', 'S', '2014-03-29');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (90, 'Devolução de Empréstimo entre Bibliotecas', 'E', '2014-03-29');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (100, 'Retirada para Manutenção da Peça do Acervo', 'A', '2014-03-29');
INSERT INTO public.movimentostipos (idtipomovimento, txnometipomov, aopermiteretirada, dtcadmovimtipo) VALUES (110, 'Devolução de Manutenção de Peça do Acervo', 'A', '2014-03-29');


--
-- Data for Name: nfcompras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nfcompras (idnunfcompra, fornecedorid, funcionarioid, dtnfcompra, vltotalnfcompra, aosituacao, txcomentarios, dtcadnfcompra) VALUES (2, 2, 10, '2016-10-10', 2500, 'A', 'Bons profutos na última compra', '2016-10-10');
INSERT INTO public.nfcompras (idnunfcompra, fornecedorid, funcionarioid, dtnfcompra, vltotalnfcompra, aosituacao, txcomentarios, dtcadnfcompra) VALUES (1, 5, 10, '2016-10-10', 3105, 'A', 'Fornecedor com bom histórico de compra', '2016-10-10');
INSERT INTO public.nfcompras (idnunfcompra, fornecedorid, funcionarioid, dtnfcompra, vltotalnfcompra, aosituacao, txcomentarios, dtcadnfcompra) VALUES (3, 1, 20, '2016-10-10', 3150, 'A', 'Ótimo gado de Corte', '2016-10-10');


--
-- Data for Name: nfcomprasitens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (1, '001001001001', 10, 38);
INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (1, '001001001002', 25, 45);
INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (1, '001001001003', 40, 40);
INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (2, '001003001001', 50, 40);
INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (2, '001002001004', 10, 50);
INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (3, '001001001001', 20, 45);
INSERT INTO public.nfcomprasitens (nunfcompraid, produtoid, qtcomprada, vlunitario) VALUES (3, '001001001003', 50, 45);


--
-- Data for Name: nfvendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (41, 5, 50, 1, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (42, 30, 50, 3, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (43, 25, 50, 2, 53, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (44, 25, 50, 1, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (45, 30, 60, 2, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (46, 10, 60, 3, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (47, 30, 50, 1, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (48, 35, 200, 2, 65.5, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (49, 20, 90, 3, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (50, 10, 50, 2, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (51, 10, 60, 1, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (53, 5, 200, 3, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (54, 25, 50, 1, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (55, 30, 50, 2, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (56, 30, 60, 1, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (57, 5, 200, 2, 56, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (58, 35, 150, 3, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (59, 35, 200, 3, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (60, 35, 190, 3, 90, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (61, 40, 190, 1, 44, '2012-05-02', '2012-05-02', '2012-05-02');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (62, 35, 190, 1, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (63, 40, 170, 2, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (64, 35, 200, 3, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (65, 5, 170, 1, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (66, 10, 170, 2, 58.5, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (67, 15, 180, 2, 56, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (68, 10, 170, 3, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (69, 10, 150, 1, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (70, 10, 190, 2, 90, '2012-05-03', '2012-05-03', '2012-05-03');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (101, 40, 470, 2, 37, '2012-05-09', '2012-05-09', '2012-05-09');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (102, 10, 460, 3, 77.5, '2012-05-09', '2012-05-09', '2012-05-09');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (103, 10, 200, 1, 77.5, '2012-05-10', '2012-05-10', '2012-05-10');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (104, 10, 470, 2, 46, '2012-05-10', '2012-05-10', '2012-05-10');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (105, 5, 460, 2, 37, '2012-05-10', '2012-05-10', '2012-05-10');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (106, 35, 460, 3, 65.5, '2012-05-10', '2012-05-10', '2012-05-10');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (107, 40, 450, 1, 58.5, '2012-05-11', '2012-05-11', '2012-05-11');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (108, 40, 370, 2, 90, '2012-05-11', '2012-05-11', '2012-05-11');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (109, 40, 200, 3, 77.5, '2012-05-11', '2012-05-11', '2012-05-11');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (110, 40, 350, 1, 90, '2012-05-11', '2012-05-11', '2012-05-11');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (111, 10, 360, 3, 90, '2012-05-11', '2012-05-11', '2012-05-11');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (112, 35, 200, 2, 65.5, '2012-05-12', '2012-05-12', '2012-05-12');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (113, 40, 450, 2, 65.5, '2012-05-12', '2012-05-12', '2012-05-12');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (114, 40, 450, 1, 68.5, '2012-05-12', '2012-05-12', '2012-05-12');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (115, 30, 450, 1, 58.5, '2012-05-13', '2012-05-13', '2012-05-13');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (116, 10, 440, 1, 77.5, '2012-05-13', '2012-05-13', '2012-05-13');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (117, 10, 200, 1, 90, '2012-05-13', '2012-05-13', '2012-05-13');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (118, 15, 370, 3, 56, '2012-05-14', '2012-05-14', '2012-05-14');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (119, 35, 200, 2, 90, '2012-05-14', '2012-05-14', '2012-05-14');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (120, 15, 200, 1, 56, '2012-05-14', '2012-05-14', '2012-05-14');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (121, 20, 370, 2, 58.5, '2012-05-14', '2012-05-14', '2012-05-14');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (122, 10, 200, 3, 77.5, '2012-05-15', '2012-05-15', '2012-05-15');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (123, 20, 200, 1, 56, '2012-05-15', '2012-05-15', '2012-05-15');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (124, 30, 350, 2, 58.5, '2012-05-15', '2012-05-15', '2012-05-15');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (125, 15, 360, 3, 77.5, '2012-05-15', '2012-05-15', '2012-05-15');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (126, 10, 460, 2, 34, '2012-05-15', '2012-05-15', '2012-05-15');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (127, 5, 200, 1, 90, '2012-05-16', '2012-05-16', '2012-05-16');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (129, 10, 450, 3, 90, '2012-05-16', '2012-05-16', '2012-05-16');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (130, 10, 370, 1, 90, '2012-05-16', '2012-05-16', '2012-05-16');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (131, 10, 200, 2, 90, '2012-05-16', '2012-05-16', '2012-05-16');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (132, 30, 360, 1, 34, '2012-05-16', '2012-05-16', '2012-05-16');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (133, 10, 200, 2, 90, '2012-05-17', '2012-05-17', '2012-05-17');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (134, 20, 190, 3, 56, '2012-05-17', '2012-05-17', '2012-05-17');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (135, 25, 200, 3, 90, '2012-05-17', '2012-05-17', '2012-05-17');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (136, 35, 350, 3, 56, '2012-05-17', '2012-05-17', '2012-05-17');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (137, 40, 460, 1, 90, '2012-05-17', '2012-05-17', '2012-05-17');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (138, 5, 200, 1, 56, '2012-05-17', '2012-05-17', '2012-05-17');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (139, 20, 440, 2, 90, '2012-05-18', '2012-05-18', '2012-05-18');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (140, 5, 350, 3, 68.5, '2012-05-18', '2012-05-18', '2012-05-18');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (141, 15, 340, 1, 68.5, '2012-05-18', '2012-05-18', '2012-05-18');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (142, 10, 180, 2, 58.5, '2012-05-19', '2012-05-19', '2012-05-19');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (143, 5, 120, 2, 58.5, '2012-05-19', '2012-05-19', '2012-05-19');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (145, 10, 200, 1, 65.5, '2012-05-20', '2012-05-20', '2012-05-20');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (146, 35, 350, 2, 90, '2012-05-20', '2012-05-20', '2012-05-20');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (147, 35, 450, 3, 90, '2012-05-20', '2012-05-20', '2012-05-20');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (149, 35, 170, 3, 90, '2012-05-22', '2012-05-22', '2012-05-22');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (150, 30, 460, 2, 56, '2012-05-22', '2012-05-22', '2012-05-22');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (151, 30, 360, 2, 90, '2012-05-22', '2012-05-22', '2012-05-22');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (152, 30, 150, 3, 132, '2010-10-10', '2010-10-10', '2010-10-10');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (1, 35, 170, 1, 55.5, '2012-04-24', '2012-04-24', '2012-04-24');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (2, 35, 160, 1, 68.5, '2012-04-24', '2012-04-24', '2012-04-24');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (3, 10, 150, 1, 90, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (4, 5, 110, 3, 68.5, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (5, 20, 200, 2, 65.5, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (6, 40, 200, 1, 65.5, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (7, 5, 150, 2, 34, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (8, 10, 160, 3, 90, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (9, 10, 200, 1, 90, '2012-04-25', '2012-04-25', '2012-04-25');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (10, 25, 200, 2, 90, '2012-04-27', '2012-04-27', '2012-04-27');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (11, 10, 50, 3, 90, '2012-04-27', '2012-04-27', '2012-04-27');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (12, 10, 50, 2, 58.5, '2012-04-27', '2012-04-27', '2012-04-27');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (13, 40, 200, 1, 90, '2012-04-28', '2012-04-28', '2012-04-28');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (15, 5, 50, 3, 90, '2012-04-28', '2012-04-28', '2012-04-28');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (16, 5, 200, 1, 58.5, '2012-04-28', '2012-04-28', '2012-04-28');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (17, 40, 200, 2, 90, '2012-04-28', '2012-04-28', '2012-04-28');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (18, 10, 100, 1, 90, '2012-04-28', '2012-04-28', '2012-04-28');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (19, 10, 100, 2, 90, '2012-04-29', '2012-04-29', '2012-04-29');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (20, 10, 100, 3, 90, '2012-04-29', '2012-04-29', '2012-04-29');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (21, 10, 100, 3, 90, '2012-04-29', '2012-04-29', '2012-04-29');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (22, 10, 100, 3, 90, '2012-04-29', '2012-04-29', '2012-04-29');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (23, 10, 90, 1, 90, '2012-04-29', '2012-04-29', '2012-04-29');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (24, 10, 100, 1, 90, '2012-04-29', '2012-04-29', '2012-04-29');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (25, 5, 100, 2, 68.5, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (26, 25, 100, 3, 68.5, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (27, 25, 100, 1, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (28, 20, 100, 2, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (29, 5, 100, 2, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (30, 15, 100, 3, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (31, 25, 50, 1, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (32, 5, 200, 2, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (33, 10, 200, 3, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (34, 10, 50, 1, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (35, 15, 50, 3, 77.5, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (36, 10, 200, 2, 77.5, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (37, 10, 50, 2, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (38, 10, 50, 1, 90, '2012-04-30', '2012-04-30', '2012-04-30');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (39, 10, 200, 1, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (40, 10, 200, 1, 90, '2012-05-01', '2012-05-01', '2012-05-01');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (71, 15, 180, 3, 58.5, '2012-05-04', '2012-05-04', '2012-05-04');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (72, 10, 180, 1, 77.5, '2012-05-04', '2012-05-04', '2012-05-04');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (73, 10, 200, 3, 90, '2012-05-04', '2012-05-04', '2012-05-04');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (74, 25, 180, 2, 90, '2012-05-04', '2012-05-04', '2012-05-04');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (75, 30, 130, 2, 90, '2012-05-04', '2012-05-04', '2012-05-04');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (76, 15, 180, 1, 90, '2012-05-05', '2012-05-05', '2012-05-05');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (77, 10, 360, 1, 56, '2012-05-05', '2012-05-05', '2012-05-05');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (78, 40, 50, 1, 90, '2012-05-05', '2012-05-05', '2012-05-05');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (79, 15, 200, 1, 90, '2012-05-05', '2012-05-05', '2012-05-05');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (80, 35, 160, 3, 90, '2012-05-06', '2012-05-06', '2012-05-06');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (81, 15, 160, 2, 65.5, '2012-05-06', '2012-05-06', '2012-05-06');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (82, 20, 200, 1, 68.5, '2012-05-06', '2012-05-06', '2012-05-06');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (83, 25, 120, 2, 68.5, '2012-05-06', '2012-05-06', '2012-05-06');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (84, 30, 110, 3, 90, '2012-05-06', '2012-05-06', '2012-05-06');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (85, 25, 190, 1, 90, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (86, 35, 90, 2, 68.5, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (87, 5, 60, 3, 58.5, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (88, 40, 200, 2, 58.5, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (89, 10, 360, 1, 90, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (91, 40, 200, 3, 90, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (92, 15, 200, 1, 90, '2012-05-07', '2012-05-07', '2012-05-07');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (93, 20, 200, 2, 90, '2012-05-08', '2012-05-08', '2012-05-08');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (94, 20, 180, 1, 34, '2012-05-08', '2012-05-08', '2012-05-08');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (95, 15, 360, 2, 90, '2012-05-08', '2012-05-08', '2012-05-08');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (96, 10, 200, 3, 44, '2012-05-08', '2012-05-08', '2012-05-08');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (97, 30, 200, 3, 68.5, '2012-05-08', '2012-05-08', '2012-05-08');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (98, 20, 200, 3, 68.5, '2012-05-09', '2012-05-09', '2012-05-09');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (99, 15, 440, 1, 68.5, '2012-05-09', '2012-05-09', '2012-05-09');
INSERT INTO public.nfvendas (idnunfvenda, clienteid, funcionarioid, armazemid, vltotalnfvenda, dtvenda, dtemissao, dtcadnfvenda) VALUES (100, 40, 360, 1, 68.5, '2012-05-09', '2012-05-09', '2012-05-09');


--
-- Data for Name: nfvendasitens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (1, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (1, '001001001002', 20, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (2, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (2, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (2, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (3, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (3, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (3, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (3, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (4, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (4, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (4, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (5, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (5, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (5, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (6, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (6, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (6, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (7, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (7, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (8, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (8, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (8, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (8, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (9, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (9, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (9, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (9, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (10, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (10, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (10, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (10, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (11, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (11, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (11, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (11, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (12, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (12, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (12, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (13, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (13, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (13, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (13, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (15, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (15, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (15, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (15, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (16, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (16, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (16, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (17, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (17, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (17, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (17, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (18, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (18, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (18, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (18, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (19, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (19, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (19, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (19, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (20, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (20, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (20, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (20, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (21, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (21, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (21, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (21, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (22, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (22, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (22, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (22, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (23, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (23, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (23, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (23, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (24, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (24, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (24, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (24, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (25, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (25, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (25, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (26, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (26, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (26, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (27, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (27, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (27, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (27, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (28, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (28, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (28, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (28, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (29, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (29, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (29, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (29, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (30, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (30, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (30, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (30, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (31, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (31, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (31, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (31, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (32, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (32, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (32, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (32, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (33, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (33, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (33, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (33, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (34, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (34, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (34, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (34, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (35, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (35, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (35, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (36, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (36, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (36, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (37, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (37, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (37, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (37, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (38, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (38, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (38, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (38, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (39, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (39, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (39, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (39, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (40, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (40, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (40, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (40, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (41, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (41, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (41, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (41, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (42, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (42, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (42, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (42, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (43, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (43, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (44, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (44, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (44, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (44, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (45, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (45, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (45, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (45, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (46, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (46, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (46, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (46, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (47, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (47, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (47, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (47, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (48, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (48, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (48, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (49, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (49, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (49, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (49, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (50, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (50, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (50, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (50, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (51, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (51, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (51, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (51, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (53, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (53, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (53, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (53, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (54, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (54, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (54, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (54, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (55, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (55, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (55, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (55, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (56, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (56, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (56, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (56, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (57, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (57, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (58, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (58, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (58, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (58, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (59, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (59, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (59, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (59, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (60, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (60, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (60, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (60, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (61, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (61, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (62, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (62, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (62, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (62, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (63, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (63, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (63, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (63, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (64, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (64, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (64, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (64, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (65, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (65, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (65, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (65, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (66, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (66, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (66, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (67, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (67, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (68, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (68, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (68, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (68, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (69, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (69, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (69, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (69, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (70, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (70, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (70, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (70, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (71, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (71, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (71, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (72, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (72, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (72, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (73, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (73, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (73, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (73, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (74, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (74, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (74, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (74, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (75, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (75, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (75, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (75, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (76, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (76, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (76, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (76, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (77, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (77, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (78, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (78, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (78, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (78, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (79, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (79, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (79, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (79, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (80, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (80, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (80, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (80, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (81, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (81, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (81, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (82, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (82, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (82, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (83, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (83, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (83, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (84, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (84, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (84, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (84, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (85, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (85, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (85, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (85, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (86, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (86, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (86, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (87, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (87, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (87, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (88, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (88, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (88, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (89, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (89, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (89, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (89, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (91, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (91, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (91, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (91, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (92, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (92, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (92, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (92, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (93, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (93, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (93, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (93, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (94, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (94, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (95, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (95, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (95, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (95, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (96, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (96, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (97, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (97, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (97, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (98, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (98, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (98, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (99, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (99, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (99, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (100, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (100, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (100, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (101, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (101, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (102, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (102, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (102, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (103, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (103, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (103, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (104, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (104, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (105, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (105, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (106, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (106, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (106, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (107, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (107, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (107, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (108, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (108, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (108, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (108, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (109, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (109, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (109, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (110, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (110, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (110, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (110, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (111, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (111, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (111, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (111, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (112, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (112, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (112, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (113, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (113, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (113, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (114, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (114, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (114, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (115, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (115, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (115, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (116, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (116, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (116, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (117, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (117, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (117, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (117, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (118, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (118, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (119, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (119, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (119, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (119, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (120, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (120, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (121, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (121, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (121, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (122, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (122, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (122, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (123, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (123, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (124, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (124, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (124, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (125, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (125, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (125, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (126, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (126, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (127, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (127, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (127, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (127, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (129, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (129, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (129, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (129, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (130, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (130, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (130, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (130, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (131, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (131, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (131, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (131, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (132, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (132, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (133, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (133, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (133, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (133, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (134, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (134, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (135, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (135, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (135, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (135, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (136, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (136, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (137, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (137, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (137, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (137, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (138, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (138, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (139, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (139, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (139, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (139, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (140, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (140, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (140, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (141, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (141, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (141, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (142, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (142, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (142, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (143, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (143, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (143, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (145, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (145, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (145, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (146, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (146, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (146, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (146, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (147, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (147, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (147, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (147, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (149, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (149, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (149, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (149, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (150, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (150, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (151, '001001001001', 10, 1.25);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (151, '001001001002', 10, 2.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (151, '001001001003', 10, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (151, '001001001005', 10, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (152, '001001001003', 20, 2.45);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (152, '001001001005', 20, 3.15);
INSERT INTO public.nfvendasitens (nunfvendaid, produtoid, qtvendida, vlunitario) VALUES (152, '001002001004', 10, 2);


--
-- Data for Name: ocorrencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ocorrencias (idocorrencia, sinistroid, veiculoid, "numeroapoliceid	", logradouroprincipalid, logradourosecundarioid, txlogradouroocorrencia, dtcadocorrencia) VALUES (5, 1, 5, 145241, 120, 130, 'Colisão lateral dos veículos trafegando pela Av. Politécnica e logo a seguir colindo com um muro e um poste no cruzamento da R. das Laranjeiras.', '2010-10-10');
INSERT INTO public.ocorrencias (idocorrencia, sinistroid, veiculoid, "numeroapoliceid	", logradouroprincipalid, logradourosecundarioid, txlogradouroocorrencia, dtcadocorrencia) VALUES (6, 3, 8, 145241, 170, 300, 'Roubo com uso de arma de fogo por volta das 23h00', '2010-10-10');


--
-- Data for Name: oficinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oficinas (idoficina, txrazaosocial, nucnpj, txapelido, logradouroid, dtfundacao, dtcadoficina) VALUES (1, 'Oficina Mecânica de Reparos Gerais Luiz Porto S/C Ltda.', '01245241521   ', 'Luizinho', 520, NULL, '2010-10-10');
INSERT INTO public.oficinas (idoficina, txrazaosocial, nucnpj, txapelido, logradouroid, dtfundacao, dtcadoficina) VALUES (2, 'Oficina de Reparos Gerais "Marreco" S/C Ltda.', '123123        ', 'Marreco', 240, NULL, '2015-10-10');


--
-- Data for Name: oficinastels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oficinastels (idoficinatel, oficinaid, tipotelefoneid, nutelefone, txnomecontato, dtcadoficinatel) VALUES (1, 1, 10, '1174185296     ', NULL, '2019-09-02');
INSERT INTO public.oficinastels (idoficinatel, oficinaid, tipotelefoneid, nutelefone, txnomecontato, dtcadoficinatel) VALUES (2, 2, 10, '5474185296     ', NULL, '2019-09-02');
INSERT INTO public.oficinastels (idoficinatel, oficinaid, tipotelefoneid, nutelefone, txnomecontato, dtcadoficinatel) VALUES (3, 2, 10, '1196385274     ', NULL, '2019-09-02');
INSERT INTO public.oficinastels (idoficinatel, oficinaid, tipotelefoneid, nutelefone, txnomecontato, dtcadoficinatel) VALUES (4, 1, 10, '3145124512     ', NULL, '2019-09-02');
INSERT INTO public.oficinastels (idoficinatel, oficinaid, tipotelefoneid, nutelefone, txnomecontato, dtcadoficinatel) VALUES (5, 2, 15, '43985264521    ', NULL, '2019-09-02');


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: palavraschaves; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (1, 'Amor', '2010-12-13');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (2, 'Carinho', '2010-12-13');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (3, 'Amizade', '2010-12-13');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (4, 'Convivencia', '2010-12-13');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (7, 'Solidariedade', '2010-12-10');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (5, 'Compreensão', '2010-12-10');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (6, 'Confiança', '2010-12-10');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (8, 'Lógica', '2016-12-07');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (9, 'Matemática', '2016-12-07');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (10, 'Física', '2016-12-07');
INSERT INTO public.palavraschaves (idpalavra, txnomepalavra, dtcadpalavrachave) VALUES (11, 'Cálculo Diferencial', '2016-12-07');


--
-- Data for Name: palavraslivros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.palavraslivros (palavraid, livroid, dtcadpalchavelivro) VALUES (11, 90, '2016-12-07');
INSERT INTO public.palavraslivros (palavraid, livroid, dtcadpalchavelivro) VALUES (9, 90, '2016-12-07');
INSERT INTO public.palavraslivros (palavraid, livroid, dtcadpalchavelivro) VALUES (9, 40, '2016-12-07');
INSERT INTO public.palavraslivros (palavraid, livroid, dtcadpalchavelivro) VALUES (10, 50, '2016-12-07');
INSERT INTO public.palavraslivros (palavraid, livroid, dtcadpalchavelivro) VALUES (1, 100, '2016-12-07');
INSERT INTO public.palavraslivros (palavraid, livroid, dtcadpalchavelivro) VALUES (2, 100, '2016-12-07');


--
-- Data for Name: passagens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pedcompras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pedcomprasitens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pedvendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedvendas (idpedvenda, clienteid, funcionarioid, dtpedvenda, txcomentarios, vltotalpedvenda, aosituacao, dtcadpedvenda) VALUES (5, 5, 10, '2023-09-13', 'Sem', 1000, 'A', '2023-09-15');
INSERT INTO public.pedvendas (idpedvenda, clienteid, funcionarioid, dtpedvenda, txcomentarios, vltotalpedvenda, aosituacao, dtcadpedvenda) VALUES (10, 15, 10, '2023-09-13', 'Sem', 1000, 'A', '2023-09-15');
INSERT INTO public.pedvendas (idpedvenda, clienteid, funcionarioid, dtpedvenda, txcomentarios, vltotalpedvenda, aosituacao, dtcadpedvenda) VALUES (15, 15, 10, '2023-09-13', 'Sem', 1000, 'A', '2023-09-15');


--
-- Data for Name: pedvendasitens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: planosdesaude; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planosdesaude (idplanodesaude, txnomeplano, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, dtcadplanosaude) VALUES (1, 'Unimed', 'zvfzxfasdfsdfasdf', NULL, 350, ' 1243', '2354235 ', '2010-10-27');
INSERT INTO public.planosdesaude (idplanodesaude, txnomeplano, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, dtcadplanosaude) VALUES (2, 'SulAmericana', 'Trocando os valores', NULL, 470, ' 1492', '14524515', '2010-10-27');
INSERT INTO public.planosdesaude (idplanodesaude, txnomeplano, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, dtcadplanosaude) VALUES (4, 'MedialSaude', NULL, NULL, 470, ' 1492', NULL, '2010-10-27');
INSERT INTO public.planosdesaude (idplanodesaude, txnomeplano, txrazaosocial, nucnpj, logradouroid, txcomplemento, nucep, dtcadplanosaude) VALUES (5, 'teter', 'sadfsdf', NULL, 470, ' 234', '12313123', '2010-10-10');


--
-- Data for Name: planosdesaudemedicos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: planosdesaudetels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (5, 2, 5, '12341234       ', NULL, '2016-06-10');
INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (8, 4, 5, '141514541242   ', NULL, '2016-07-05');
INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (2, 4, 10, '1452451255     ', NULL, '2016-05-20');
INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (3, 4, 15, '5642151651     ', NULL, '2016-06-20');
INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (1, 4, 20, '1421254412     ', NULL, '2016-05-20');
INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (4, 2, 20, '12341234       ', NULL, '2016-05-25');
INSERT INTO public.planosdesaudetels (idplanostel, planodesaudeid, tipotelefoneid, nutelefone, txnomecontato, dtcadplanotel) VALUES (7, 1, 20, '2134523453     ', NULL, '2016-07-08');


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001003001002', 'Trocando de Valor na Descricao Curta', 123.00, 120.00, 120.00, 0, 15, 'Trocando de Valor na Descricao completa', '2010-10-10');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001001001001', 'metafluocoreto de potássio', 40.00, 35.00, 26.00, 0, 0, 'o metafluocoreto ', '1980-01-01');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001001001002', 'sulfito de sódio', 45.00, 20.00, 10.00, 0, 0, 'asdfasdfadsf', '2010-10-10');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001001001003', 'enxofre', 42.00, 12.00, 23.00, 0, 0, 'laskfjsdf', '1980-01-01');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001001001005', 'Permanganato de Silício', 35.00, 1450.00, 1400.00, 0, 0, NULL, '2011-01-20');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001002001004', 'amianto de sódio', 40.00, 22.00, 20.00, 0, 0, 'asdfsadf', '1980-01-01');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001002003001', 'Acido Sulfúrico', 15.00, 1100.00, 950.00, 0, 0, 'Este ', '1980-01-01');
INSERT INTO public.produtos (idproduto, txnomeproduto, vlpreco, vlprecopromocao, vlprecominimo, qtestoque, qtdiaspromocao, txdescricaocompleta, dtcadproduto) VALUES ('001003001001', 'Resfriador de Sódio', 40.00, 1450.00, 1100.00, 0, 0, NULL, '2010-10-20');


--
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (1, 'ANA MARIA VERDIM', 470, ' 3456', '3436567 ', '1960-12-19', '2005-05-11');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (2, 'ABEL DA SILVA', 110, ' 234', '1233536 ', '1964-07-11', '2001-08-21');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (3, 'ABRAO ABUJANRA', 240, ' 451', '1342545 ', '1975-06-12', '2005-03-12');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (4, 'CARLOS TAKESHI UENDO', 340, ' 475', '1865456 ', '1984-07-19', '2006-05-13');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (5, 'DAVid GUTEMBERG', 260, ' 4521', '5680567 ', '1966-06-16', '2005-05-12');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (6, 'FRANCISCO ROMEU DA CRUZ', 140, ' 75 23And, Cj 23', '5670479 ', '1974-12-05', '2002-05-13');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (7, 'GERALDO BANDEIRAS PONTES', 170, ' 234', '4656589 ', '1987-09-06', '2002-10-21');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (8, 'HEITOR DE TROIA', 120, ' 7458', '5656745 ', '1964-10-08', '2003-02-21');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (9, 'HERCULES OLIMPIANO', 130, ' 345', '7643587 ', '1976-07-29', '2002-01-21');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (10, 'IRINEU EVANGELISTA DE SOUZA', 270, ' 456', '4669908 ', '1984-11-28', '2005-05-14');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (11, 'JOAO HEULALIO DE BUENO VIDIGAL', 360, ' 2569', '4794477 ', '1967-08-24', '2005-05-27');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (12, 'JAIME DE ABREU POMPEU DE LIMA', 150, ' 75', '6298666 ', '1975-12-19', '2002-05-16');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (13, 'JOSE RAMOS DE ALMEIDA', 160, ' 54', '7489455 ', '1988-07-29', '2002-05-28');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (14, 'LEONIDAS DE PERCEPOLIS', 80, ' 345', '8405674 ', '1964-10-11', '2001-05-16');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (15, 'LEOPOLDO DE COUTO E SILVA', 250, ' 3879', '8486453 ', '1976-10-10', '2005-03-25');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (16, 'MARIA MAURA CORREIA ALVES LIMA', 310, ' 25', '8504467 ', '1984-12-21', '2005-09-18');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (17, 'MARCIA DE ALBUQUERQUE LIMA', NULL, ' 25415', '8674645 ', '1966-09-21', '2000-05-25');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (18, 'MARIO QUINTANA DRUMOND DE ANDRADE', 50, ' 345', '7605555 ', '1974-06-30', '2000-06-14');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (19, 'NAIR DE MELLO CUNHA', 180, ' 4521', '6407626 ', '1987-05-30', '2003-04-23');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (20, 'NEIRE GONCALVES DE ALBUQUERQUE LINS', 230, ' 345', '5567715 ', '1965-11-29', '2005-02-16');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (21, 'OLIVIA CRUZ DO NASCIMENTO', 300, ' 657', '5456600 ', '1977-11-13', '2005-05-28');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (22, 'ODUVALDO VIANNA', 460, ' 456', '5235683 ', '1966-09-24', '2004-05-15');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (23, 'PASCOAL DE LIMA ROSA CRUZ', 190, ' 190', '5329444 ', '1987-10-25', '2003-05-27');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (24, 'RENATO CORTE REAL', 210, ' 3456', '5444753 ', '1965-05-06', '2004-02-14');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (25, 'SEBASTIAO MELLO DA SILVA CRUZ', 280, ' 867', '6534756 ', '1987-12-07', '2005-05-20');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (26, 'TADEU BUARQUE DE HOLANDA', 320, ' 2145', '5644642 ', '1965-07-19', '2005-12-13');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (27, 'ULISSES ODEBRECHT', 40, ' 2767', '5744548 ', '1987-11-17', '2000-05-29');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (28, 'VINICIUS HUMBRTO PINHEIRO DA SILVA', 220, ' 4512', '5844426 ', '1965-11-05', '2005-01-10');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (29, 'VERA ADRIANA HUANG AZEVEDO', 200, ' 745', '15122222', '1970-02-10', '2010-10-10');
INSERT INTO public.professores (idprofessor, txnomeprofessor, logradouroid, txcomplemento, nucep, dtnascimento, dtcadprofessor) VALUES (35, 'EURIPEDES SOARES DE ALMEIDA', 170, '450', '12345678', '1957-05-10', '1975-10-10');


--
-- Data for Name: professorestels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professorestels (idprofessortel, professorid, tipotelefoneid, nutelefone, dtcadprofessortel) VALUES (4, 1, 5, '99999777       ', NULL);
INSERT INTO public.professorestels (idprofessortel, professorid, tipotelefoneid, nutelefone, dtcadprofessortel) VALUES (3, 7, 20, '88887777       ', NULL);


--
-- Data for Name: projetos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('123457', 'alterando', 'Z97', 200, 280000.00, '2010-10-10', '2010-10-10', 'AD3112', '2010-10-10');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('AD2323', 'BIG DATA/SSP', 'E21', 40, 850.00, '2016-03-01', '2017-02-28', 'OP2010', '2016-02-10');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('Z90   ', 'teste', 'B01', 160, 45000.00, '2011-10-10', '2010-10-10', 'AD3100', '2010-10-10');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('AD3100', 'ADMIN SERVICES       ', 'A01', 10, 6.50, '2002-01-01', '2003-02-01', 'AD3100', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('AD3110', 'GENERAL ADMIN SYSTEMS', 'A01', 20, 6.00, '2002-01-01', '2003-02-01', 'AD3100', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('AD3112', 'PERSONNEL PROGRAMMING', 'B01', 20, 1.00, '2002-01-01', '2003-02-01', 'AD3110', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('AD3113', 'ACCOUNT PROGRAMMING  ', 'B01', 20, 2.00, '2002-01-01', '2003-02-01', 'AD3110', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('IF1000', 'QUERY SERVICES       ', 'B01', 30, 2.00, '2002-01-01', '2003-02-01', 'IF1000', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('IF2000', 'USER EDUCATION       ', 'C01', 30, 1.00, '2002-01-01', '2003-02-01', 'IF2000', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('MA2100', 'WELD LINE AUTOMATION ', 'C01', 20, 12.00, '2002-01-01', '2003-02-01', 'MA2100', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('MA2110', 'W L PROGRAMMING      ', 'D01', 10, 9.00, '2002-01-01', '2003-02-01', 'MA2100', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('MA2111', 'W L PROGRAM DESIGN   ', 'D01', 40, 2.00, '2002-01-01', '1982-12-01', 'MA2110', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('MA2112', 'W L ROBOT DESIGN     ', 'D91', 50, 3.00, '2002-01-01', '1982-12-01', 'MA2110', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('MA2113', 'W L PROD CONT PROGS  ', 'D91', 40, 3.00, '2002-02-15', '1982-12-01', 'MA2110', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('OP2000', 'GEN SYSTEMS SERVICES ', 'E01', 50, 999.99, '2002-01-01', '2003-02-01', 'OP2000', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('OP2010', 'SYSTEMS SUPPORT      ', 'E01', 50, 4.00, '2002-01-01', '2003-02-01', 'OP2000', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('OP2011', 'SCP SYSTEMS SUPPORT  ', 'E11', 30, 1.00, '2002-01-01', '2003-02-01', 'OP2010', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('OP2012', 'APPLICATIONS SUPPORT ', 'E11', 10, 1.00, '2002-01-01', '2003-02-01', 'OP2010', '2015-06-15');
INSERT INTO public.projetos (idprojeto, txnomeprojeto, deptoid, funcionarioresponsavelid, vlestimado, dtinicio, dttermino, "projetosuperiorid	", dtcadprojeto) VALUES ('OP2013', 'DB/DC SUPPORT        ', 'E21', 40, 1.00, '2002-01-01', '2003-02-01', 'OP2010', '2015-06-15');


--
-- Data for Name: rotasviarias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rotasviarias (idrota, txnomerota, txdescrperiodo, cidadeorigemid, cidadedestinoid, dtcadrotaviaria) VALUES (1, 'Rota 1', 'passa em Chavantes, Ipaussu, Sta Cruz do Rio Pardo e vai pela Castelo Brancos', 40, 5, '2010-10-10');
INSERT INTO public.rotasviarias (idrota, txnomerota, txdescrperiodo, cidadeorigemid, cidadedestinoid, dtcadrotaviaria) VALUES (2, 'Rota 2', 'passa em Chavantes, Ipaussu, Sta Cruz do Rio Pardo e vai pela Raposo Tavares até Avaré depois pela Castelo Branco', 40, 5, '2010-10-10');
INSERT INTO public.rotasviarias (idrota, txnomerota, txdescrperiodo, cidadeorigemid, cidadedestinoid, dtcadrotaviaria) VALUES (3, 'Rota 3', 'Passa por Cambará, Andirá, Bandeirantes, Cornélio Procópio, Ibaití pela BR153 (Transbrasiliana)', 40, 35, '2010-10-10');
INSERT INTO public.rotasviarias (idrota, txnomerota, txdescrperiodo, cidadeorigemid, cidadedestinoid, dtcadrotaviaria) VALUES (4, 'Rota 66', 'asdasdsa as asd sd ffads', 40, 5, '2012-10-10');
INSERT INTO public.rotasviarias (idrota, txnomerota, txdescrperiodo, cidadeorigemid, cidadedestinoid, dtcadrotaviaria) VALUES (8, 'Rota 88', 'Rod. Castelo Branco (até Avaré), Rod. Ildebrando Castanho (até a Rod. Raposo Tavares), Rod', 5, 40, '2013-12-11');


--
-- Data for Name: roteiros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: seguradoras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.seguradoras (idseguradora, txnomeseguradora, logradouroid, txcomplemento, nucep, dtcadseguradora) VALUES (1, 'Transamerica', 200, ' 745', '        ', '2004-02-10');
INSERT INTO public.seguradoras (idseguradora, txnomeseguradora, logradouroid, txcomplemento, nucep, dtcadseguradora) VALUES (5, 'Porto Seguro', 510, ' 450', '123132  ', '2010-10-10');
INSERT INTO public.seguradoras (idseguradora, txnomeseguradora, logradouroid, txcomplemento, nucep, dtcadseguradora) VALUES (6, 'Altavista Seguros', 160, '224', '12345678', '2010-10-10');
INSERT INTO public.seguradoras (idseguradora, txnomeseguradora, logradouroid, txcomplemento, nucep, dtcadseguradora) VALUES (2, 'Bradesco Seguros', 200, '1452', NULL, '2016-03-28');
INSERT INTO public.seguradoras (idseguradora, txnomeseguradora, logradouroid, txcomplemento, nucep, dtcadseguradora) VALUES (11, 'Seguros Lunares S/C Ltda.', 260, '1452', '04512456', '2016-11-11');
INSERT INTO public.seguradoras (idseguradora, txnomeseguradora, logradouroid, txcomplemento, nucep, dtcadseguradora) VALUES (3, 'Mapfre Seguros', 400, ' 2345', '14512412', '2010-02-12');


--
-- Data for Name: seguradorastels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.seguradorastels (idseguradoratel, seguradoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadseguradoratel) VALUES (1, 2, 20, '1452112212     ', NULL, NULL);
INSERT INTO public.seguradorastels (idseguradoratel, seguradoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadseguradoratel) VALUES (2, 2, 20, '14421151       ', NULL, NULL);
INSERT INTO public.seguradorastels (idseguradoratel, seguradoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadseguradoratel) VALUES (3, 3, 20, '1452155122     ', NULL, NULL);
INSERT INTO public.seguradorastels (idseguradoratel, seguradoraid, tipotelefoneid, nutelefone, txnomecontato, dtcadseguradoratel) VALUES (4, 3, 20, '1122323231     ', NULL, NULL);


--
-- Data for Name: seguros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.seguros ("idnumeroapolice	", veiculoid, seguradoraid, dtcontratacao, dtlimitecobertura, vlcobertura, dtcadseguro) VALUES (145241, 5, 1, '2010-10-10', '2011-10-10', 15000.00, '2010-10-10');
INSERT INTO public.seguros ("idnumeroapolice	", veiculoid, seguradoraid, dtcontratacao, dtlimitecobertura, vlcobertura, dtcadseguro) VALUES (145246, 3, 2, '2010-10-10', '2011-10-10', 15000.00, '2010-10-07');
INSERT INTO public.seguros ("idnumeroapolice	", veiculoid, seguradoraid, dtcontratacao, dtlimitecobertura, vlcobertura, dtcadseguro) VALUES (145251, 7, 11, '2000-05-05', '2001-05-05', 25000.00, '2000-05-02');


--
-- Data for Name: servicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.servicos (idservico, txnomeservico, txdescricao, vlestimado, dtcadservico) VALUES (5, 'Funilaria', 'serviços de ajuste da lataria de veículos', 300, '2010-10-10');
INSERT INTO public.servicos (idservico, txnomeservico, txdescricao, vlestimado, dtcadservico) VALUES (10, 'Pintura', 'Pintura simples de veículos', 350, '2010-10-10');
INSERT INTO public.servicos (idservico, txnomeservico, txdescricao, vlestimado, dtcadservico) VALUES (15, 'Mecânica de suspensão', 'Substituição ou ajustes do conjunto de suspensão', 500, '2010-10-10');
INSERT INTO public.servicos (idservico, txnomeservico, txdescricao, vlestimado, dtcadservico) VALUES (20, 'Mecânica do Motor', 'Sustituição ou ajustes de partes do motor', 600, '2010-10-10');


--
-- Data for Name: servicosfeitospor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: servicosprestados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: setoresdeatuacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.setoresdeatuacao (idsetoratuacao, txnomesetordeatuacao, txdescricaosetordeatuacao, dtcadsetordeatuacao) VALUES (1, 'Industria', 'Manufaturados', '2011-06-10');
INSERT INTO public.setoresdeatuacao (idsetoratuacao, txnomesetordeatuacao, txdescricaosetordeatuacao, dtcadsetordeatuacao) VALUES (2, 'Comercio', 'Lojas de vendas em Atacado', '2011-06-10');


--
-- Data for Name: sinistros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sinistros (idsinistro, txnomesinistro, txdescricaosinistro, dtcadsinistro) VALUES (1, 'colisão com um ou mais veículos em via publica', 'colisão em via publica envolvendo um ou mais veículos além do segurado', '2013-03-20');
INSERT INTO public.sinistros (idsinistro, txnomesinistro, txdescricaosinistro, dtcadsinistro) VALUES (2, 'Colisão com um ou mais veículos em via privada', 'colisão em via privada (pátios de estacionamento, rampa de garagem, acesso à sítios ou chacaras), envolvendo um ou mais veículos além do segurado', '2013-03-20');
INSERT INTO public.sinistros (idsinistro, txnomesinistro, txdescricaosinistro, dtcadsinistro) VALUES (3, 'Roubo simples', 'Veículo foi roubado sem a presença do proprietário em via pública', '2013-03-20');
INSERT INTO public.sinistros (idsinistro, txnomesinistro, txdescricaosinistro, dtcadsinistro) VALUES (4, 'Roubo privado', 'Veículo roubado de dentro de casa ou estacionamento particular sem a presença do proprietário', '2013-03-20');


--
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (10, 'Gerenciar                               ', 'Gerenciar/Advertir', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (20, 'Orçar                                   ', 'Estimar orçamentos de Projetos', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (30, 'Definir                                 ', 'Definir Especifica', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (40, 'Liderar                                 ', 'Liderar times de programação', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (50, 'Especificar                             ', 'Documentador de Especifica', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (60, 'An.Neg                                  ', 'Descritor das regras de neg', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (70, 'Codificar                               ', 'Codificar linhas de programas', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (80, 'Testar Progrszd                         ', 'Teste de programas conclu', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (90, 'AdmPesqSist                             ', 'Administrar o Sistema de Pesquisa (Prospec', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (100, 'Ensinar                                 ', 'Dar aulas de TI', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (110, 'Montar Cursos                           ', 'Desenvolver material de Cursos', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (120, 'Suporte Pessoal                         ', 'Surporte de Pessoal', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (130, 'Operar                                  ', 'Operar sistemas de informa', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (140, 'Manutenir                               ', 'Fazer a manuten', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (150, 'AdmSistInfor                            ', 'Administrar Sistemas de Informa', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (160, 'AdmDataBase                             ', 'Administrar Bases de Dados', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (170, 'Adm Com. Dados                          ', 'Administrar a rede de Dados', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (180, 'troca                                   ', 'troca', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (190, 'Treinar                                 ', 'Treinamento de Usuários', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (200, 'Portar Dados                            ', 'Efetuar porte de dados existentes em sistemas', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (210, 'Desenvolvimento                         ', 'Desenvolvimento', 80, '2011-10-05');
INSERT INTO public.tarefas (idtarefa, txnometarefa, txdescricaotarefa, qthoraspadrao, dtcadtarefa) VALUES (230, 'aDSas                                   ', 'ASDasd', 234, '2010-10-10');


--
-- Data for Name: tarefasprojetos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (1, 'AD2323', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (2, 'AD2323', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (3, 'AD3100', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (4, 'AD3100', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (5, 'AD3100', 30, 200, 3, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (6, 'AD3100', 40, 200, 4, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (7, 'AD3100', 50, 200, 5, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (8, 'AD3100', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (9, 'AD3100', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (10, 'AD3100', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (11, 'AD3100', 140, 200, 9, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (12, 'AD3100', 100, 200, 10, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (13, 'AD3100', 110, 200, 11, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (14, 'AD3100', 120, 200, 12, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (15, 'AD3100', 130, 200, 13, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (16, 'AD3100', 140, 200, 14, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (17, 'AD3100', 150, 200, 15, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (18, 'AD3100', 160, 200, 16, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (19, 'AD3100', 170, 200, 17, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (20, 'AD3110', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (21, 'AD3110', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (22, 'AD3112', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (23, 'AD3112', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (24, 'AD3112', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (25, 'AD3112', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (26, 'AD3112', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (27, 'AD3113', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (28, 'AD3113', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (29, 'AD3113', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (30, 'AD3113', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (31, 'AD3113', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (32, 'IF1000', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (33, 'IF1000', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (34, 'IF1000', 30, 200, 3, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (35, 'IF1000', 40, 200, 4, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (36, 'IF1000', 50, 200, 5, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (37, 'IF1000', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (38, 'IF1000', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (39, 'IF1000', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (40, 'IF1000', 90, 200, 9, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (41, 'IF1000', 100, 200, 10, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (42, 'IF1000', 110, 200, 11, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (43, 'IF1000', 120, 200, 12, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (44, 'IF1000', 130, 200, 13, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (45, 'IF1000', 140, 200, 14, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (46, 'IF1000', 150, 200, 15, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (47, 'IF1000', 160, 200, 16, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (48, 'IF1000', 170, 200, 17, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (49, 'IF2000', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (50, 'IF2000', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (51, 'IF2000', 100, 200, 10, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (52, 'IF2000', 110, 200, 11, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (53, 'MA2100', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (54, 'MA2100', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (55, 'MA2100', 30, 200, 3, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (56, 'MA2100', 40, 200, 4, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (57, 'MA2100', 50, 200, 5, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (58, 'MA2100', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (59, 'MA2100', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (60, 'MA2100', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (61, 'MA2100', 90, 200, 9, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (62, 'MA2100', 100, 200, 10, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (63, 'MA2100', 110, 200, 11, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (64, 'MA2100', 120, 200, 12, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (65, 'MA2100', 130, 200, 13, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (66, 'MA2100', 140, 200, 14, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (67, 'MA2100', 150, 200, 15, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (68, 'MA2100', 160, 200, 16, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (69, 'MA2100', 170, 200, 17, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (70, 'MA2110', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (71, 'MA2110', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (72, 'MA2110', 30, 200, 3, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (73, 'MA2110', 40, 200, 4, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (74, 'MA2110', 50, 200, 5, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (75, 'MA2110', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (76, 'MA2110', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (77, 'MA2110', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (78, 'MA2110', 90, 200, 9, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (79, 'MA2110', 100, 200, 10, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (80, 'MA2110', 110, 200, 11, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (81, 'MA2110', 120, 200, 12, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (82, 'MA2110', 130, 200, 13, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (83, 'MA2110', 140, 200, 14, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (84, 'MA2110', 150, 200, 15, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (85, 'MA2110', 160, 200, 16, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (86, 'MA2110', 170, 200, 17, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (87, 'MA2111', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (88, 'MA2111', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (89, 'MA2111', 40, 200, 4, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (90, 'MA2111', 50, 200, 5, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (91, 'MA2111', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (92, 'MA2112', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (93, 'MA2112', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (94, 'MA2112', 30, 200, 3, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (95, 'MA2112', 40, 200, 4, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (96, 'MA2112', 50, 200, 5, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (97, 'MA2112', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (98, 'MA2112', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (99, 'MA2112', 80, 200, 8, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (100, 'MA2112', 90, 200, 9, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (101, 'MA2112', 100, 200, 10, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (102, 'MA2112', 110, 200, 11, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (103, 'MA2112', 120, 200, 12, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (104, 'MA2112', 130, 200, 13, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (105, 'MA2112', 140, 200, 14, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (106, 'MA2112', 150, 200, 15, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (107, 'MA2112', 160, 200, 16, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (108, 'MA2112', 170, 200, 17, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (109, 'MA2113', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (110, 'MA2113', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (111, 'MA2113', 60, 200, 6, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (112, 'MA2113', 70, 200, 7, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (114, 'OP2000', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (115, 'OP2000', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (116, 'OP2010', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (117, 'OP2010', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (118, 'OP2011', 10, 200, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (119, 'OP2011', 20, 200, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (120, 'OP2012', 10, 120, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (121, 'OP2012', 20, 100, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (122, 'OP2013', 10, 120, 1, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (123, 'OP2013', 20, 90, 2, '2010-10-10');
INSERT INTO public.tarefasprojetos (idtarefaprojeto, projetoid, tarefaid, qthorasenvolvidas, nuordem, dtcadtarefaprojeto) VALUES (124, 'MA2110', 40, 200, 1, '2010-10-10');


--
-- Data for Name: telefonestipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.telefonestipos (idtipotelefone, "txdescricaotipotel	", dtcadtipotelefone) VALUES (5, 'Fixo - Residencial', '2011-10-25');
INSERT INTO public.telefonestipos (idtipotelefone, "txdescricaotipotel	", dtcadtipotelefone) VALUES (10, 'Celular Particular', '2011-10-25');
INSERT INTO public.telefonestipos (idtipotelefone, "txdescricaotipotel	", dtcadtipotelefone) VALUES (15, 'Fixo - Comercial', '2011-10-25');
INSERT INTO public.telefonestipos (idtipotelefone, "txdescricaotipotel	", dtcadtipotelefone) VALUES (20, 'Celular Empresa', '2011-10-25');


--
-- Data for Name: titulacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: turmas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: veiculos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (1, 'ABC1593', 1, 1, 40, 'P', NULL, 5, '2015', 'C', '2018-02-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (2, 'BBC1593', 2, 1, 50, 'P', NULL, 5, '2010', 'C', '2017-02-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (3, 'CBC1593', 1, 1, 60, 'P', NULL, 5, '1999', 'C', '2018-02-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (4, 'DBC1593', 2, 1, 90, 'P', NULL, 5, '2012', 'C', '2016-02-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (5, 'EBC2604', 1, 1, 110, 'P', NULL, 4, '2015', 'C', '2016-02-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (6, 'FBC1593', 2, 1, 90, 'P', NULL, 5, '2013', 'C', '2016-02-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (7, 'ABC3715', 1, 1, 120, 'P', NULL, 5, '2015', 'C', '2015-04-20');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (8, 'ABC4826', 2, 1, 110, 'P', NULL, 5, '2016', 'C', '2015-05-04');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (9, 'ABD4826', 2, 1, NULL, NULL, 'Orion', 45, '2016', 'O', '2015-05-04');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (10, 'AYH4826', 2, 1, NULL, NULL, 'Morpheus', 45, '2016', 'O', '2015-05-04');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (11, 'AUJ4826', 2, 1, NULL, NULL, 'Centauro', 45, '2016', 'O', '2015-05-04');
INSERT INTO public.veiculos (idveiculo, ukplaca, "tipoveiculoid	", modeloid, funcionarioid, aotipocarro, txapelido, qtcapacidade, nuanofabricacao, aocategoria, dtcadveiculo) VALUES (12, 'AJO4826', 2, 1, NULL, NULL, 'Vega', 45, '2016', 'O', '2015-05-04');


--
-- Data for Name: veiculosmarcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.veiculosmarcas (idmarcaveiculo, txnomemarca, fabricanteid, "dtcadmarcaveiculo	") VALUES (2, 'Toruga', 1, '2010-05-10');
INSERT INTO public.veiculosmarcas (idmarcaveiculo, txnomemarca, fabricanteid, "dtcadmarcaveiculo	") VALUES (3, 'Elba', 2, '2005-10-10');
INSERT INTO public.veiculosmarcas (idmarcaveiculo, txnomemarca, fabricanteid, "dtcadmarcaveiculo	") VALUES (4, 'Bravo', 2, '2015-01-10');
INSERT INTO public.veiculosmarcas (idmarcaveiculo, txnomemarca, fabricanteid, "dtcadmarcaveiculo	") VALUES (5, 'Uno Mille', 2, '2001-01-10');
INSERT INTO public.veiculosmarcas (idmarcaveiculo, txnomemarca, fabricanteid, "dtcadmarcaveiculo	") VALUES (6, 'teste', 2, '2011-05-10');
INSERT INTO public.veiculosmarcas (idmarcaveiculo, txnomemarca, fabricanteid, "dtcadmarcaveiculo	") VALUES (1, 'Jetta', 1, '2016-03-26');


--
-- Data for Name: veiculosmodelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.veiculosmodelos (idmodeloveiculo, marcaid, txdescricaomodelo, aotipocombustivel, dtcadmodeloveiculo) VALUES (2, 1, 'Santana 2.0', 'A', '2002-02-02');
INSERT INTO public.veiculosmodelos (idmodeloveiculo, marcaid, txdescricaomodelo, aotipocombustivel, dtcadmodeloveiculo) VALUES (3, 6, 'voyage 1.6', 'Z', '2002-02-02');
INSERT INTO public.veiculosmodelos (idmodeloveiculo, marcaid, txdescricaomodelo, aotipocombustivel, dtcadmodeloveiculo) VALUES (4, 1, 'Golf 2.0', 'Z', '2002-02-02');
INSERT INTO public.veiculosmodelos (idmodeloveiculo, marcaid, txdescricaomodelo, aotipocombustivel, dtcadmodeloveiculo) VALUES (9, 3, 'Elba WeekEnd 1.8 turbo', 'G', '2010-10-10');
INSERT INTO public.veiculosmodelos (idmodeloveiculo, marcaid, txdescricaomodelo, aotipocombustivel, dtcadmodeloveiculo) VALUES (1, 4, 'Bravo Cellera 2.2', 'G', '2002-05-20');
INSERT INTO public.veiculosmodelos (idmodeloveiculo, marcaid, txdescricaomodelo, aotipocombustivel, dtcadmodeloveiculo) VALUES (14, 4, 'Bravo Pallas 2.2', 'F', '2010-10-10');


--
-- Data for Name: veiculostipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.veiculostipos (idtipoveiculo, txdescricaotpveiculo, dtcadtipoveiculo) VALUES (1, 'Automóvel', '2013-01-20');
INSERT INTO public.veiculostipos (idtipoveiculo, txdescricaotpveiculo, dtcadtipoveiculo) VALUES (2, 'Embarcação Fluvial', '2013-01-20');
INSERT INTO public.veiculostipos (idtipoveiculo, txdescricaotpveiculo, dtcadtipoveiculo) VALUES (3, 'Embarcação Marítima', '2013-01-20');
INSERT INTO public.veiculostipos (idtipoveiculo, txdescricaotpveiculo, dtcadtipoveiculo) VALUES (4, 'Avião Comercial para até 20 passageiros', '2013-01-20');


--
-- Data for Name: viagens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (1, 1, '2012-06-23', '00:00:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (2, 1, '2012-06-24', '00:00:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (3, 1, '2012-06-25', '00:00:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (4, 1, '2012-06-26', '00:00:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (5, 2, '2012-06-23', '16:50:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (6, 2, '2012-06-24', '00:00:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (7, 1, '2012-06-30', '23:59:00', '2012-06-23', NULL, NULL);
INSERT INTO public.viagens (idviagem, rotaid, dtsaidaviagem, hrsaida, dtchegadaviagem, hrchegadaprev, dtcadviagem) VALUES (8, 2, '2012-06-30', '23:59:00', '2012-06-23', NULL, NULL);


--
-- Name: funcoes [pkfuncao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcoes
    ADD CONSTRAINT "[pkfuncao" PRIMARY KEY (idfuncao);


--
-- Name: veiculosmarcas [pkmarcaveiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculosmarcas
    ADD CONSTRAINT "[pkmarcaveiculo" PRIMARY KEY (idmarcaveiculo);


--
-- Name: movimentos [pkmovimento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentos
    ADD CONSTRAINT "[pkmovimento" PRIMARY KEY (idmovimento);


--
-- Name: armazens armazensck1; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.armazens
    ADD CONSTRAINT armazensck1 CHECK ((dtcadarmazem <= CURRENT_DATE)) NOT VALID;


--
-- Name: autorias autoriacc1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorias
    ADD CONSTRAINT autoriacc1 UNIQUE (livroid, autorid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: idiomasfalados fk1idiomafalado	; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idiomasfalados
    ADD CONSTRAINT "fk1idiomafalado	" PRIMARY KEY (ididiomafalado);


--
-- Name: medicos medicosuk1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicosuk1 UNIQUE (nucrm);


--
-- Name: nfcomprasitens nfcomprasitens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcomprasitens
    ADD CONSTRAINT nfcomprasitens_pkey PRIMARY KEY (nunfcompraid, produtoid);


--
-- Name: nfvendasitens nfvendasitens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendasitens
    ADD CONSTRAINT nfvendasitens_pkey PRIMARY KEY (nunfvendaid, produtoid);


--
-- Name: palavraslivros palavraslivros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavraslivros
    ADD CONSTRAINT palavraslivros_pkey PRIMARY KEY (palavraid, livroid);


--
-- Name: agencias pkagencia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencias
    ADD CONSTRAINT pkagencia PRIMARY KEY (bancoid, idagencia);


--
-- Name: agenciastels pkagenciatel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenciastels
    ADD CONSTRAINT pkagenciatel PRIMARY KEY (idagenciatel);


--
-- Name: aplicacoesdascontas pkaplicacaodaconta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacoesdascontas
    ADD CONSTRAINT pkaplicacaodaconta PRIMARY KEY (idnuaplicacaodaconta);


--
-- Name: aplicacoesfinanceiras pkaplicacaofinanceira; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacoesfinanceiras
    ADD CONSTRAINT pkaplicacaofinanceira PRIMARY KEY (idaplicfin);


--
-- Name: areasdeestudo pkareadeestudo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudo
    ADD CONSTRAINT pkareadeestudo PRIMARY KEY (idareadeestudo);


--
-- Name: areasdeestudocursos pkareadeestudocurso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudocursos
    ADD CONSTRAINT pkareadeestudocurso PRIMARY KEY (idareaestcurso);


--
-- Name: areasdeestudodisciplinas pkareadeestudodisciplina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudodisciplinas
    ADD CONSTRAINT pkareadeestudodisciplina PRIMARY KEY (idareaestdisciplina);


--
-- Name: areasdeestudolivros pkareadeestudolivro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudolivros
    ADD CONSTRAINT pkareadeestudolivro PRIMARY KEY (idareaestlivro);


--
-- Name: armazens pkarmazem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazens
    ADD CONSTRAINT pkarmazem PRIMARY KEY (idarmazem);


--
-- Name: armazenstels pkarmazemtel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazenstels
    ADD CONSTRAINT pkarmazemtel PRIMARY KEY (idarmazemtel);


--
-- Name: atividades pkatividade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT pkatividade PRIMARY KEY (idatividade);


--
-- Name: atribuicoes pkatribuicao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atribuicoes
    ADD CONSTRAINT pkatribuicao PRIMARY KEY (idatribuicao);


--
-- Name: atuacoes pkatuacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atuacoes
    ADD CONSTRAINT pkatuacao PRIMARY KEY (idatuacao);


--
-- Name: autores pkautor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT pkautor PRIMARY KEY (idautor);


--
-- Name: autorias pkautoria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorias
    ADD CONSTRAINT pkautoria PRIMARY KEY (idautoria);


--
-- Name: autorestels pkautortel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorestels
    ADD CONSTRAINT pkautortel PRIMARY KEY (idautortel);


--
-- Name: bairros pkbairro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairros
    ADD CONSTRAINT pkbairro PRIMARY KEY (idbairro);


--
-- Name: bairroslogradouros pkbairrologradouro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairroslogradouros
    ADD CONSTRAINT pkbairrologradouro PRIMARY KEY ("idbairrologradouro	");


--
-- Name: bancos pkbanco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos
    ADD CONSTRAINT pkbanco PRIMARY KEY (idbanco);


--
-- Name: bibliografias pkbibliografia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliografias
    ADD CONSTRAINT pkbibliografia PRIMARY KEY (idbibliografia);


--
-- Name: capacitacoes pkcapacitacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitacoes
    ADD CONSTRAINT pkcapacitacao PRIMARY KEY (idcapacitacao);


--
-- Name: cidades pkcidade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT pkcidade PRIMARY KEY (idcidade);


--
-- Name: clientes pkcliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pkcliente PRIMARY KEY (idcliente) INCLUDE (idcliente);


--
-- Name: clientestels pkclientestels; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientestels
    ADD CONSTRAINT pkclientestels PRIMARY KEY (idclientetel);


--
-- Name: consultas pkconsultas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT pkconsultas PRIMARY KEY (idconsulta);


--
-- Name: contas pkcontas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contas
    ADD CONSTRAINT pkcontas PRIMARY KEY (bancoid, agenciaid, idnuconta);


--
-- Name: cores pkcor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cores
    ADD CONSTRAINT pkcor PRIMARY KEY (idcor);


--
-- Name: corescarros pkcorcarro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corescarros
    ADD CONSTRAINT pkcorcarro PRIMARY KEY (carroid, corid);


--
-- Name: cursos pkcurso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT pkcurso PRIMARY KEY (idcurso);


--
-- Name: departamentos pkdepartamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT pkdepartamento PRIMARY KEY (iddepto);


--
-- Name: departamentostels pkdeptotel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentostels
    ADD CONSTRAINT pkdeptotel PRIMARY KEY (iddeptotel);


--
-- Name: disciplinas pkdisciplina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT pkdisciplina PRIMARY KEY (iddisciplina);


--
-- Name: duplicatas pkduplicata; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duplicatas
    ADD CONSTRAINT pkduplicata PRIMARY KEY (idduplicata);


--
-- Name: editoras pkeditora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoras
    ADD CONSTRAINT pkeditora PRIMARY KEY (ideditora);


--
-- Name: editorastels pkeditoratel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorastels
    ADD CONSTRAINT pkeditoratel PRIMARY KEY (ideditoratel);


--
-- Name: empresas pkempresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT pkempresa PRIMARY KEY (idempresa);


--
-- Name: empresastels pkempresatel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresastels
    ADD CONSTRAINT pkempresatel PRIMARY KEY (idempresatel);


--
-- Name: especialidadesmedicas pkespecialidade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidadesmedicas
    ADD CONSTRAINT pkespecialidade PRIMARY KEY (idespecialidade);


--
-- Name: estadosdospaises pkestadodopais; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estadosdospaises
    ADD CONSTRAINT pkestadodopais PRIMARY KEY (idestadodopais);


--
-- Name: fabricantes pkfabricante; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantes
    ADD CONSTRAINT pkfabricante PRIMARY KEY (idfabricante);


--
-- Name: fabricantestels pkfabricantetel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantestels
    ADD CONSTRAINT pkfabricantetel PRIMARY KEY (idfabricantetel);


--
-- Name: faturas pkfatura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faturas
    ADD CONSTRAINT pkfatura PRIMARY KEY (idfatura);


--
-- Name: fornecedores pkfornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT pkfornecedor PRIMARY KEY (idfornecedor);


--
-- Name: fornecedorestels pkfornecedortel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedorestels
    ADD CONSTRAINT pkfornecedortel PRIMARY KEY (idfornecedortel);


--
-- Name: fornecimentos pkfornecimento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecimentos
    ADD CONSTRAINT pkfornecimento PRIMARY KEY (idfornecimento);


--
-- Name: funcionarios pkfuncionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT pkfuncionario PRIMARY KEY (idfuncionario);


--
-- Name: funcionariosplanos pkfuncionarioplano; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionariosplanos
    ADD CONSTRAINT pkfuncionarioplano PRIMARY KEY (idfuncionarioplano);


--
-- Name: funcionariostels pkfuncionariotel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionariostels
    ADD CONSTRAINT pkfuncionariotel PRIMARY KEY (idfuncionariotel);


--
-- Name: grausdeescolaridade pkgraudeescolaridade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grausdeescolaridade
    ADD CONSTRAINT pkgraudeescolaridade PRIMARY KEY (idgrauescolaridade);


--
-- Name: habilitacoes pkhabilitacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilitacoes
    ADD CONSTRAINT pkhabilitacao PRIMARY KEY (idhabilitacao);


--
-- Name: historicoprofissional pkhistprof; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicoprofissional
    ADD CONSTRAINT pkhistprof PRIMARY KEY ("idhistprof	");


--
-- Name: idiomas pkidioma; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idiomas
    ADD CONSTRAINT pkidioma PRIMARY KEY (ididioma);


--
-- Name: instituicoesdeensino pkinstituicaodeensino; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoesdeensino
    ADD CONSTRAINT pkinstituicaodeensino PRIMARY KEY ("idinstituicaodeensino	");


--
-- Name: instituicoesdeensinotels pkinstituicaoensinote; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoesdeensinotels
    ADD CONSTRAINT pkinstituicaoensinote PRIMARY KEY (idinstituicaodeensinotel);


--
-- Name:  inventarios pkinventario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." inventarios"
    ADD CONSTRAINT pkinventario PRIMARY KEY (idinventario);


--
-- Name: livros pklivro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livros
    ADD CONSTRAINT pklivro PRIMARY KEY (idlivro);


--
-- Name: logradouros pklogradouro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logradouros
    ADD CONSTRAINT pklogradouro PRIMARY KEY (idlogradouro);


--
-- Name: matriculas pkmatricula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas
    ADD CONSTRAINT pkmatricula PRIMARY KEY (idmatricula);


--
-- Name: medicos pkmedico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT pkmedico PRIMARY KEY (idmedico);


--
-- Name: medicostels pkmedicotel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicostels
    ADD CONSTRAINT pkmedicotel PRIMARY KEY (idmedicotel);


--
-- Name: veiculosmodelos pkmodeloveiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculosmodelos
    ADD CONSTRAINT pkmodeloveiculo PRIMARY KEY (idmodeloveiculo);


--
-- Name: nfcompras pknunfcompra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcompras
    ADD CONSTRAINT pknunfcompra PRIMARY KEY (idnunfcompra);


--
-- Name: nfvendas pknunfvenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendas
    ADD CONSTRAINT pknunfvenda PRIMARY KEY (idnunfvenda);


--
-- Name: ocorrencias pkocorrencia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencias
    ADD CONSTRAINT pkocorrencia PRIMARY KEY (idocorrencia);


--
-- Name: oficinas pkoficina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oficinas
    ADD CONSTRAINT pkoficina PRIMARY KEY (idoficina);


--
-- Name: oficinastels pkoficinatel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oficinastels
    ADD CONSTRAINT pkoficinatel PRIMARY KEY (idoficinatel);


--
-- Name: paises pkpais; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT pkpais PRIMARY KEY (idpais);


--
-- Name: palavraschaves pkpalavra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavraschaves
    ADD CONSTRAINT pkpalavra PRIMARY KEY (idpalavra);


--
-- Name: passagens pkpassagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT pkpassagem PRIMARY KEY (idpassagem);


--
-- Name: pedcompras pkpedcompra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedcompras
    ADD CONSTRAINT pkpedcompra PRIMARY KEY (idpedcompra);


--
-- Name: pedcomprasitens pkpedcompraitem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedcomprasitens
    ADD CONSTRAINT pkpedcompraitem PRIMARY KEY (idpedcompraitem);


--
-- Name: pedvendas pkpedvenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedvendas
    ADD CONSTRAINT pkpedvenda PRIMARY KEY (idpedvenda);


--
-- Name: pedvendasitens pkpedvendaitem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedvendasitens
    ADD CONSTRAINT pkpedvendaitem PRIMARY KEY (idpedvendaitem);


--
-- Name: planosdesaude pkplanodesaude; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaude
    ADD CONSTRAINT pkplanodesaude PRIMARY KEY (idplanodesaude);


--
-- Name: planosdesaudemedicos pkplanosaudemed; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaudemedicos
    ADD CONSTRAINT pkplanosaudemed PRIMARY KEY ("idplanosaudemed	");


--
-- Name: planosdesaudetels pkplanotel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaudetels
    ADD CONSTRAINT pkplanotel PRIMARY KEY (idplanostel);


--
-- Name: produtos pkproduto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT pkproduto PRIMARY KEY (idproduto);


--
-- Name: professores pkprofessor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT pkprofessor PRIMARY KEY (idprofessor);


--
-- Name: professorestels pkprofessortel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professorestels
    ADD CONSTRAINT pkprofessortel PRIMARY KEY (idprofessortel);


--
-- Name: projetos pkprojeto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT pkprojeto PRIMARY KEY (idprojeto);


--
-- Name: rotasviarias pkrota; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rotasviarias
    ADD CONSTRAINT pkrota PRIMARY KEY (idrota);


--
-- Name: roteiros pkroteiro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roteiros
    ADD CONSTRAINT pkroteiro PRIMARY KEY (idroteiro);


--
-- Name: seguradoras pkseguradora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguradoras
    ADD CONSTRAINT pkseguradora PRIMARY KEY (idseguradora);


--
-- Name: seguradorastels pkseguradoratel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguradorastels
    ADD CONSTRAINT pkseguradoratel PRIMARY KEY (idseguradoratel);


--
-- Name: seguros pkseguro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguros
    ADD CONSTRAINT pkseguro PRIMARY KEY ("idnumeroapolice	");


--
-- Name: servicos pkservico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT pkservico PRIMARY KEY (idservico);


--
-- Name: servicosfeitospor pkservicofeitopor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicosfeitospor
    ADD CONSTRAINT pkservicofeitopor PRIMARY KEY (idservicofeitopor);


--
-- Name: servicosprestados pkservicoprestado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicosprestados
    ADD CONSTRAINT pkservicoprestado PRIMARY KEY (idservicoprestado);


--
-- Name: setoresdeatuacao pksetoratuacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setoresdeatuacao
    ADD CONSTRAINT pksetoratuacao PRIMARY KEY (idsetoratuacao);


--
-- Name: sinistros pksinistro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinistros
    ADD CONSTRAINT pksinistro PRIMARY KEY (idsinistro);


--
-- Name: tarefas pktarefa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT pktarefa PRIMARY KEY (idtarefa);


--
-- Name: tarefasprojetos pktarefaprojeto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefasprojetos
    ADD CONSTRAINT pktarefaprojeto PRIMARY KEY (idtarefaprojeto);


--
-- Name: logradourostipos pktipologradouro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logradourostipos
    ADD CONSTRAINT pktipologradouro PRIMARY KEY (idlogradourotipo);


--
-- Name: movimentostipos pktipomovimento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentostipos
    ADD CONSTRAINT pktipomovimento PRIMARY KEY (idtipomovimento);


--
-- Name: telefonestipos pktipotelefone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonestipos
    ADD CONSTRAINT pktipotelefone PRIMARY KEY (idtipotelefone);


--
-- Name: veiculostipos pktipoveiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculostipos
    ADD CONSTRAINT pktipoveiculo PRIMARY KEY (idtipoveiculo);


--
-- Name: titulacoes pktitulacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulacoes
    ADD CONSTRAINT pktitulacao PRIMARY KEY (idtitulacao);


--
-- Name: turmas pkturma; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT pkturma PRIMARY KEY (idturma);


--
-- Name: veiculos pkveiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT pkveiculo PRIMARY KEY (idveiculo);


--
-- Name: viagens pkviagem; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagens
    ADD CONSTRAINT pkviagem PRIMARY KEY (idviagem);


--
-- Name: areasdeestudocursos uk1areadeestudocurso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudocursos
    ADD CONSTRAINT uk1areadeestudocurso UNIQUE (areadeestudoid) INCLUDE (cursoid);


--
-- Name: areasdeestudodisciplinas uk1areadeestudodisciplina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudodisciplinas
    ADD CONSTRAINT uk1areadeestudodisciplina UNIQUE (areadeestudoid) INCLUDE (disciplinaid);


--
-- Name: veiculos veiculosuk1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT veiculosuk1 UNIQUE (ukplaca);


--
-- Name: Iautorestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Iautorestelsce1" ON public.autorestels USING btree (autorid);


--
-- Name: iagenciasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iagenciasce1 ON public.agencias USING btree (bancoid);


--
-- Name: iagenciasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iagenciasce2 ON public.agencias USING btree (logradouroid);


--
-- Name: iagenciastelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iagenciastelsce1 ON public.agenciastels USING btree (bancoid, agenciaid);


--
-- Name: iagenciastelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iagenciastelsce2 ON public.agenciastels USING btree (tipotelefoneid);


--
-- Name: iareaestudocursosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudocursosce1 ON public.areasdeestudocursos USING btree (areadeestudoid);


--
-- Name: iareaestudocursosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudocursosce2 ON public.areasdeestudocursos USING btree (cursoid);


--
-- Name: iareaestudodisciplinasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudodisciplinasce1 ON public.areasdeestudodisciplinas USING btree (disciplinaid);


--
-- Name: iareaestudodisciplinasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudodisciplinasce2 ON public.areasdeestudodisciplinas USING btree (areadeestudoid);


--
-- Name: iareaestudodisciplinasuk1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudodisciplinasuk1 ON public.areasdeestudodisciplinas USING btree (disciplinaid, areadeestudoid);


--
-- Name: iareaestudolivrosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudolivrosce1 ON public.areasdeestudolivros USING btree (livroid);


--
-- Name: iareaestudolivrosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudolivrosce2 ON public.areasdeestudolivros USING btree (areadeestudoid);


--
-- Name: iareaestudolivrosuk1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iareaestudolivrosuk1 ON public.areasdeestudolivros USING btree (livroid, areadeestudoid);


--
-- Name: iarmazensce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iarmazensce1 ON public.armazens USING btree (logradouroid);


--
-- Name: iarmazensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iarmazensce2 ON public.armazens USING btree (clienteid);


--
-- Name: iatribuicoesce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iatribuicoesce1 ON public.atribuicoes USING btree (professorid);


--
-- Name: iatribuicoesce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iatribuicoesce2 ON public.atribuicoes USING btree (disciplinaid);


--
-- Name: iatuacoesce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iatuacoesce1 ON public.atuacoes USING btree (tarefaprojetoid);


--
-- Name: iatuacoesce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iatuacoesce2 ON public.atuacoes USING btree (funcionarioid);


--
-- Name: iatuacoesuk1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iatuacoesuk1 ON public.atuacoes USING btree (tarefaprojetoid, funcionarioid, dtinicio);


--
-- Name: iautoresce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iautoresce1 ON public.autores USING btree (logradouroid);


--
-- Name: iautorestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iautorestelsce1 ON public.autorestels USING btree (autorid);


--
-- Name: iautorestelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iautorestelsce2 ON public.autorestels USING btree (tipotelefoneid);


--
-- Name: iautoriasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iautoriasce1 ON public.autorias USING btree (livroid);


--
-- Name: iautoriasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iautoriasce2 ON public.autorias USING btree (autorid);


--
-- Name: ibairrosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ibairrosce1 ON public.bairros USING btree (cidadeid);


--
-- Name: ibibliografiace1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ibibliografiace1 ON public.bibliografias USING btree (disciplinaid);


--
-- Name: ibibliografiace2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ibibliografiace2 ON public.bibliografias USING btree (livroid);


--
-- Name: icapacitacoesce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icapacitacoesce1 ON public.capacitacoes USING btree (cursoid);


--
-- Name: icapacitacoesce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icapacitacoesce2 ON public.capacitacoes USING btree (funcionarioid);


--
-- Name: iclientesce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iclientesce1 ON public.clientes USING btree (logradouroid);


--
-- Name: iclientestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iclientestelsce1 ON public.clientestels USING btree (clienteid);


--
-- Name: iclientestelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iclientestelsce2 ON public.clientestels USING btree (tipotelefoneid);


--
-- Name: iconsultasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iconsultasce1 ON public.consultas USING btree (funcionarioid);


--
-- Name: iconsultasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iconsultasce2 ON public.consultas USING btree (medicoid);


--
-- Name: iconsultasce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iconsultasce3 ON public.consultas USING btree (planodesaudeid);


--
-- Name: icontasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icontasce1 ON public.contas USING btree (funcionarioid);


--
-- Name: icontasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icontasce2 ON public.contas USING btree (bancoid);


--
-- Name: icursosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX icursosce1 ON public.cursos USING btree ("instituicaoid	");


--
-- Name: idepartamentosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idepartamentosce1 ON public.departamentos USING btree (funcionariogerenteid);


--
-- Name: idepartamentosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idepartamentosce2 ON public.departamentos USING btree (deptosuperiorid);


--
-- Name: idepartamentostelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idepartamentostelsce1 ON public.departamentostels USING btree (deptoid);


--
-- Name: idepartamentostelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idepartamentostelsce2 ON public.departamentostels USING btree (tipotelefoneid);


--
-- Name: idisciplinasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idisciplinasce1 ON public.disciplinas USING btree (cursoid);


--
-- Name: iduplicatasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iduplicatasce1 ON public.duplicatas USING btree ("nfvendaid	");


--
-- Name: ieditorasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ieditorasce1 ON public.editoras USING btree (logradouroid);


--
-- Name: ieditorastelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ieditorastelsce1 ON public.editorastels USING btree (editoraid);


--
-- Name: ieditorastelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ieditorastelsce2 ON public.editorastels USING btree (tipotelefoneid);


--
-- Name: iempresasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iempresasce1 ON public.empresas USING btree (logradouroid);


--
-- Name: iempresasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iempresasce2 ON public.empresas USING btree (setoratuacaoid);


--
-- Name: iempresastelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iempresastelsce1 ON public.empresastels USING btree (empresaid);


--
-- Name: iempresastelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iempresastelsce2 ON public.empresastels USING btree (tipotelefoneid);


--
-- Name: ifabricantesce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifabricantesce1 ON public.fabricantes USING btree (logradouroid);


--
-- Name: ifabricantestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifabricantestelsce1 ON public.fabricantestels USING btree (fabricanteid);


--
-- Name: ifabricantestelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifabricantestelsce2 ON public.fabricantestels USING btree (tipotelefoneid);


--
-- Name: ifornecedoresce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifornecedoresce1 ON public.fornecedores USING btree (logradouroid);


--
-- Name: ifornecedoresce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifornecedoresce2 ON public.fornecedores USING btree (setoratuacaoid);


--
-- Name: ifornecedorestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifornecedorestelsce1 ON public.fornecedorestels USING btree (fornecedorid);


--
-- Name: ifornecedorestelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifornecedorestelsce2 ON public.fornecedorestels USING btree (tipotelefoneid);


--
-- Name: ifornecimentosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifornecimentosce2 ON public.fornecimentos USING btree (fornecedorid);


--
-- Name: ifuncionariosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariosce1 ON public.funcionarios USING btree (deptoid);


--
-- Name: ifuncionariosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariosce2 ON public.funcionarios USING btree (funcaoid);


--
-- Name: ifuncionariosce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariosce3 ON public.funcionarios USING btree (logradouroid);


--
-- Name: ifuncionariosce4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariosce4 ON public.funcionarios USING btree ("grauescolaridadeid	");


--
-- Name: ifuncionariosplanosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariosplanosce1 ON public.funcionariosplanos USING btree (funcionarioid);


--
-- Name: ifuncionariosplanosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariosplanosce2 ON public.funcionariosplanos USING btree (planodesaudeid);


--
-- Name: ifuncionariostelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariostelsce1 ON public.funcionariostels USING btree (funcionarioid);


--
-- Name: ifuncionariostelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifuncionariostelsce2 ON public.funcionariostels USING btree (tipotelefoneid);


--
-- Name: ihabilitacoesce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihabilitacoesce1 ON public.habilitacoes USING btree (cursoid);


--
-- Name: ihabilitacoesce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihabilitacoesce2 ON public.habilitacoes USING btree (professorid);


--
-- Name: ihistoricoprofissionalce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihistoricoprofissionalce1 ON public.historicoprofissional USING btree (funcionarioid);


--
-- Name: ihistoricoprofissionalce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihistoricoprofissionalce2 ON public.historicoprofissional USING btree (empresaid);


--
-- Name: ihistoricoprofissionalce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ihistoricoprofissionalce3 ON public.historicoprofissional USING btree (atividadeid);


--
-- Name: iinstituicoesensinoce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iinstituicoesensinoce1 ON public.instituicoesdeensino USING btree (logradouroid);


--
-- Name: iinstituicoestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iinstituicoestelsce1 ON public.instituicoesdeensinotels USING btree ("instituicaoid	");


--
-- Name: iinstituicoestelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iinstituicoestelsce2 ON public.instituicoesdeensinotels USING btree (tipotelefoneid);


--
-- Name: ilivrosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ilivrosce1 ON public.livros USING btree (editoraid);


--
-- Name: ilogradourosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ilogradourosce1 ON public.logradouros USING btree (tipologradouroid);


--
-- Name: imarcasveiculosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imarcasveiculosce1 ON public.veiculosmarcas USING btree (fabricanteid);


--
-- Name: imatriculasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imatriculasce1 ON public.matriculas USING btree ("turmaid	");


--
-- Name: imatriculasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imatriculasce2 ON public.matriculas USING btree (funcionarioid);


--
-- Name: imedicosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imedicosce1 ON public.medicos USING btree (especialidadeid);


--
-- Name: imedicosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imedicosce2 ON public.medicos USING btree (logradouromoradiaid);


--
-- Name: imedicosce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imedicosce3 ON public.medicos USING btree ("logradouroclinicaid	");


--
-- Name: imedicostelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imedicostelsce1 ON public.medicostels USING btree (medicoid);


--
-- Name: imedicostelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imedicostelsce2 ON public.medicostels USING btree (tipotelefoneid);


--
-- Name: imodelosveiculosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imodelosveiculosce1 ON public.veiculosmodelos USING btree (marcaid);


--
-- Name: imovimentosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imovimentosce1 ON public.movimentos USING btree (livroid);


--
-- Name: imovimentosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imovimentosce2 ON public.movimentos USING btree (funcionarioid);


--
-- Name: imovimentosce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imovimentosce3 ON public.movimentos USING btree (tipomovimentoid);


--
-- Name: inotfisccomprasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfisccomprasce1 ON public.nfcompras USING btree (fornecedorid);


--
-- Name: inotfisccomprasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfisccomprasce2 ON public.nfcompras USING btree (funcionarioid);


--
-- Name: inotfisccomprasitensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfisccomprasitensce2 ON public.nfcomprasitens USING btree (nunfcompraid);


--
-- Name: inotfiscvendasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfiscvendasce1 ON public.nfvendas USING btree (clienteid);


--
-- Name: inotfiscvendasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfiscvendasce2 ON public.nfvendas USING btree (funcionarioid);


--
-- Name: inotfiscvendasce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfiscvendasce3 ON public.nfvendas USING btree (armazemid);


--
-- Name: inotfiscvendasitensce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfiscvendasitensce1 ON public.nfvendasitens USING btree (produtoid);


--
-- Name: inotfiscvendasitensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inotfiscvendasitensce2 ON public.nfvendasitens USING btree (nunfvendaid);


--
-- Name: iocorrenciasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iocorrenciasce1 ON public.ocorrencias USING btree (sinistroid);


--
-- Name: iocorrenciasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iocorrenciasce2 ON public.ocorrencias USING btree (veiculoid);


--
-- Name: ioficinasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ioficinasce1 ON public.oficinas USING btree (logradouroid);


--
-- Name: ioficinastelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ioficinastelsce1 ON public.oficinastels USING btree (oficinaid);


--
-- Name: ioficinastelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ioficinastelsce2 ON public.oficinastels USING btree (tipotelefoneid);


--
-- Name: iordcomprasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iordcomprasce1 ON public.pedcompras USING btree (fornecedorid);


--
-- Name: iordcomprasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iordcomprasce2 ON public.pedcompras USING btree (funcionarioid);


--
-- Name: ipalavraslivrosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipalavraslivrosce1 ON public.palavraslivros USING btree (palavraid);


--
-- Name: ipalavraslivrosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipalavraslivrosce2 ON public.palavraslivros USING btree (livroid);


--
-- Name: ipassagensce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipassagensce1 ON public.passagens USING btree (viagemid);


--
-- Name: ipassagensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipassagensce2 ON public.passagens USING btree (onibusid);


--
-- Name: ipedcomprasitensce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipedcomprasitensce1 ON public.pedcomprasitens USING btree (pedcompraid);


--
-- Name: ipedcomprasitensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipedcomprasitensce2 ON public.pedcomprasitens USING btree (produtoid);


--
-- Name: ipedvendasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipedvendasce1 ON public.pedvendas USING btree (clienteid);


--
-- Name: ipedvendasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipedvendasce2 ON public.pedvendas USING btree (funcionarioid);


--
-- Name: ipedvendasitensce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipedvendasitensce1 ON public.pedvendasitens USING btree (pedvendaid);


--
-- Name: ipedvendasitensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipedvendasitensce2 ON public.pedvendasitens USING btree (produtoid);


--
-- Name: iplanosdesaudece1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iplanosdesaudece1 ON public.planosdesaude USING btree (logradouroid);


--
-- Name: iplanosmedicosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iplanosmedicosce1 ON public.planosdesaudemedicos USING btree (planodesaudeid);


--
-- Name: iplanosmedicosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iplanosmedicosce2 ON public.planosdesaudemedicos USING btree (medicoid);


--
-- Name: iplanostelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iplanostelsce1 ON public.planosdesaudetels USING btree (planodesaudeid);


--
-- Name: iplanostelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iplanostelsce2 ON public.planosdesaudetels USING btree (tipotelefoneid);


--
-- Name: iprofessoresce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iprofessoresce1 ON public.professores USING btree (logradouroid);


--
-- Name: iprofessorestelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iprofessorestelsce1 ON public.professorestels USING btree (professorid);


--
-- Name: iprofessorestelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iprofessorestelsce2 ON public.professorestels USING btree (tipotelefoneid);


--
-- Name: iprojetosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iprojetosce1 ON public.projetos USING btree (deptoid);


--
-- Name: iprojetosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iprojetosce2 ON public.projetos USING btree (funcionarioresponsavelid);


--
-- Name: iprojetosce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iprojetosce3 ON public.projetos USING btree ("projetosuperiorid	");


--
-- Name: irotasviariasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX irotasviariasce1 ON public.rotasviarias USING btree (cidadeorigemid);


--
-- Name: irotasviariasce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX irotasviariasce2 ON public.rotasviarias USING btree (cidadedestinoid);


--
-- Name: iroteirosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iroteirosce1 ON public.roteiros USING btree (rotaid);


--
-- Name: iroteirosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iroteirosce2 ON public.roteiros USING btree (cidadeid);


--
-- Name: iseguradorasce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iseguradorasce1 ON public.seguradoras USING btree (logradouroid);


--
-- Name: iseguradorastelsce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iseguradorastelsce1 ON public.seguradorastels USING btree (seguradoraid);


--
-- Name: iseguradorastelsce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iseguradorastelsce2 ON public.seguradorastels USING btree (tipotelefoneid);


--
-- Name: isegurosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isegurosce1 ON public.seguros USING btree (veiculoid);


--
-- Name: isegurosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isegurosce2 ON public.seguros USING btree (seguradoraid);


--
-- Name: itarefasprojetosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX itarefasprojetosce1 ON public.tarefasprojetos USING btree (projetoid);


--
-- Name: itarefasprojetosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX itarefasprojetosce2 ON public.tarefasprojetos USING btree (tarefaid);


--
-- Name: iveiculosce1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iveiculosce1 ON public.veiculos USING btree ("tipoveiculoid	");


--
-- Name: iveiculosce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iveiculosce2 ON public.veiculos USING btree (modeloid);


--
-- Name: iveiculosce3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iveiculosce3 ON public.veiculos USING btree (funcionarioid);


--
-- Name: iviagensce2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iviagensce2 ON public.viagens USING btree (rotaid);


--
-- Name: agencias fk1agencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencias
    ADD CONSTRAINT fk1agencia FOREIGN KEY (bancoid) REFERENCES public.bancos(idbanco) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: agenciastels fk1agenciatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenciastels
    ADD CONSTRAINT fk1agenciatel FOREIGN KEY (bancoid, agenciaid) REFERENCES public.agencias(bancoid, idagencia) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: aplicacoesdascontas fk1aplicacaodaconta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacoesdascontas
    ADD CONSTRAINT fk1aplicacaodaconta FOREIGN KEY (aplicacaofinanceiraid) REFERENCES public.aplicacoesfinanceiras(idaplicfin) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: areasdeestudocursos fk1areadeestcurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudocursos
    ADD CONSTRAINT fk1areadeestcurso FOREIGN KEY (cursoid) REFERENCES public.cursos(idcurso) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: areasdeestudodisciplinas fk1areadeestdiscipl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudodisciplinas
    ADD CONSTRAINT fk1areadeestdiscipl FOREIGN KEY (disciplinaid) REFERENCES public.disciplinas(iddisciplina) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: areasdeestudolivros fk1areadeestlivro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudolivros
    ADD CONSTRAINT fk1areadeestlivro FOREIGN KEY (livroid) REFERENCES public.livros(idlivro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: armazens fk1armazem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazens
    ADD CONSTRAINT fk1armazem FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: atribuicoes fk1atribuicao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atribuicoes
    ADD CONSTRAINT fk1atribuicao FOREIGN KEY (professorid) REFERENCES public.professores(idprofessor) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: atuacoes fk1atuacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atuacoes
    ADD CONSTRAINT fk1atuacao FOREIGN KEY (tarefaprojetoid) REFERENCES public.tarefasprojetos(idtarefaprojeto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: autores fk1autor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT fk1autor FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: autorias fk1autoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorias
    ADD CONSTRAINT fk1autoria FOREIGN KEY (livroid) REFERENCES public.livros(idlivro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: autorestels fk1autortel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorestels
    ADD CONSTRAINT fk1autortel FOREIGN KEY (autorid) REFERENCES public.autores(idautor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: bairros fk1bairro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairros
    ADD CONSTRAINT fk1bairro FOREIGN KEY (cidadeid) REFERENCES public.cidades(idcidade) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: bairroslogradouros fk1bairrologradouro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairroslogradouros
    ADD CONSTRAINT fk1bairrologradouro FOREIGN KEY ("logradouroid	") REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: bancos fk1banco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos
    ADD CONSTRAINT fk1banco FOREIGN KEY (logradourosedeid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: bibliografias fk1bibliografia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliografias
    ADD CONSTRAINT fk1bibliografia FOREIGN KEY (disciplinaid) REFERENCES public.disciplinas(iddisciplina) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: capacitacoes fk1capacitacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitacoes
    ADD CONSTRAINT fk1capacitacao FOREIGN KEY (cursoid) REFERENCES public.cursos(idcurso) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: cidades fk1cidade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT fk1cidade FOREIGN KEY (estadodopaisid) REFERENCES public.estadosdospaises(idestadodopais) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: clientes fk1cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk1cliente FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) NOT VALID;


--
-- Name: clientestels fk1clientetel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientestels
    ADD CONSTRAINT fk1clientetel FOREIGN KEY (clienteid) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: consultas fk1consulta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk1consulta FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: contas fk1conta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contas
    ADD CONSTRAINT fk1conta FOREIGN KEY (bancoid, agenciaid) REFERENCES public.agencias(bancoid, idagencia) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: departamentos fk1depart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT fk1depart FOREIGN KEY (funcionariogerenteid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: departamentostels fk1departtel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentostels
    ADD CONSTRAINT fk1departtel FOREIGN KEY (deptoid) REFERENCES public.departamentos(iddepto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: disciplinas fk1disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT fk1disciplina FOREIGN KEY (cursoid) REFERENCES public.cursos(idcurso) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: duplicatas fk1duplicata; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.duplicatas
    ADD CONSTRAINT fk1duplicata FOREIGN KEY ("nfvendaid	") REFERENCES public.nfvendas(idnunfvenda) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: editoras fk1editora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoras
    ADD CONSTRAINT fk1editora FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: editorastels fk1editoratel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorastels
    ADD CONSTRAINT fk1editoratel FOREIGN KEY (editoraid) REFERENCES public.editoras(ideditora) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: empresas fk1empresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT fk1empresa FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: empresastels fk1empresatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresastels
    ADD CONSTRAINT fk1empresatel FOREIGN KEY (empresaid) REFERENCES public.empresas(idempresa) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: estadosdospaises fk1estadopais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estadosdospaises
    ADD CONSTRAINT fk1estadopais FOREIGN KEY (paisid) REFERENCES public.paises(idpais) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fabricantes fk1fabricante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantes
    ADD CONSTRAINT fk1fabricante FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fabricantestels fk1fabricantetel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantestels
    ADD CONSTRAINT fk1fabricantetel FOREIGN KEY (fabricanteid) REFERENCES public.fabricantes(idfabricante) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: faturas fk1fatura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faturas
    ADD CONSTRAINT fk1fatura FOREIGN KEY (nunfcompraid) REFERENCES public.nfcompras(idnunfcompra) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fornecedores fk1fornecedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fk1fornecedor FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fornecedorestels fk1fornecedortel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedorestels
    ADD CONSTRAINT fk1fornecedortel FOREIGN KEY (fornecedorid) REFERENCES public.fornecedores(idfornecedor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fornecimentos fk1fornecimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecimentos
    ADD CONSTRAINT fk1fornecimento FOREIGN KEY (produtoid) REFERENCES public.produtos(idproduto) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionarios fk1funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT fk1funcionario FOREIGN KEY (deptoid) REFERENCES public.departamentos(iddepto) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionariosplanos fk1funcionarioplano; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionariosplanos
    ADD CONSTRAINT fk1funcionarioplano FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionariostels fk1funcionariotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionariostels
    ADD CONSTRAINT fk1funcionariotel FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: habilitacoes fk1habilitacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilitacoes
    ADD CONSTRAINT fk1habilitacao FOREIGN KEY (cursoid) REFERENCES public.cursos(idcurso) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: historicoprofissional fk1histprof; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicoprofissional
    ADD CONSTRAINT fk1histprof FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: idiomasfalados fk1idiomafalado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idiomasfalados
    ADD CONSTRAINT fk1idiomafalado FOREIGN KEY (idiomaid) REFERENCES public.idiomas(ididioma) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE NOT VALID;


--
-- Name: instituicoesdeensino fk1instituicaodeensino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoesdeensino
    ADD CONSTRAINT fk1instituicaodeensino FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: instituicoesdeensinotels fk1instituicaoensinotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoesdeensinotels
    ADD CONSTRAINT fk1instituicaoensinotel FOREIGN KEY ("instituicaoid	") REFERENCES public.instituicoesdeensino("idinstituicaodeensino	") ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name:  inventarios fk1inventario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." inventarios"
    ADD CONSTRAINT fk1inventario FOREIGN KEY (produtoid) REFERENCES public.produtos(idproduto) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: livros fk1livro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livros
    ADD CONSTRAINT fk1livro FOREIGN KEY (editoraid) REFERENCES public.editoras(ideditora) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: logradouros fk1logradouro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logradouros
    ADD CONSTRAINT fk1logradouro FOREIGN KEY (cidadeid) REFERENCES public.cidades(idcidade) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: matriculas fk1matricula; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas
    ADD CONSTRAINT fk1matricula FOREIGN KEY ("turmaid	") REFERENCES public.turmas(idturma) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: medicos fk1medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk1medico FOREIGN KEY (especialidadeid) REFERENCES public.especialidadesmedicas(idespecialidade) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: medicostels fk1medicotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicostels
    ADD CONSTRAINT fk1medicotel FOREIGN KEY (medicoid) REFERENCES public.medicos(idmedico) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: movimentos fk1movimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentos
    ADD CONSTRAINT fk1movimento FOREIGN KEY (livroid) REFERENCES public.livros(idlivro) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfcompras fk1nfcompra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcompras
    ADD CONSTRAINT fk1nfcompra FOREIGN KEY (fornecedorid) REFERENCES public.fornecedores(idfornecedor) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfcomprasitens fk1nfcompraitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcomprasitens
    ADD CONSTRAINT fk1nfcompraitem FOREIGN KEY (nunfcompraid) REFERENCES public.nfcompras(idnunfcompra) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfvendas fk1nfvenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendas
    ADD CONSTRAINT fk1nfvenda FOREIGN KEY (clienteid) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfvendasitens fk1nfvendaitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendasitens
    ADD CONSTRAINT fk1nfvendaitem FOREIGN KEY (nunfvendaid) REFERENCES public.nfvendas(idnunfvenda) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: ocorrencias fk1ocorrencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencias
    ADD CONSTRAINT fk1ocorrencia FOREIGN KEY (sinistroid) REFERENCES public.sinistros(idsinistro) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: oficinas fk1oficina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oficinas
    ADD CONSTRAINT fk1oficina FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: oficinastels fk1oficinatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oficinastels
    ADD CONSTRAINT fk1oficinatel FOREIGN KEY (oficinaid) REFERENCES public.oficinas(idoficina) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: palavraslivros fk1palavralivro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavraslivros
    ADD CONSTRAINT fk1palavralivro FOREIGN KEY (palavraid) REFERENCES public.palavraschaves(idpalavra) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: passagens fk1passagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT fk1passagem FOREIGN KEY (viagemid) REFERENCES public.viagens(idviagem) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedcompras fk1pedcompra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedcompras
    ADD CONSTRAINT fk1pedcompra FOREIGN KEY (fornecedorid) REFERENCES public.fornecedores(idfornecedor) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedcomprasitens fk1pedcompraitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedcomprasitens
    ADD CONSTRAINT fk1pedcompraitem FOREIGN KEY (pedcompraid) REFERENCES public.pedcompras(idpedcompra) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedvendas fk1pedvenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedvendas
    ADD CONSTRAINT fk1pedvenda FOREIGN KEY (clienteid) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedvendasitens fk1pedvendaitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedvendasitens
    ADD CONSTRAINT fk1pedvendaitem FOREIGN KEY (idpedvendaitem) REFERENCES public.pedvendas(idpedvenda) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: planosdesaude fk1plansaude; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaude
    ADD CONSTRAINT fk1plansaude FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: planosdesaudemedicos fk1plansaudemed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaudemedicos
    ADD CONSTRAINT fk1plansaudemed FOREIGN KEY (planodesaudeid) REFERENCES public.planosdesaude(idplanodesaude) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: planosdesaudetels fk1plansaudetel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaudetels
    ADD CONSTRAINT fk1plansaudetel FOREIGN KEY (planodesaudeid) REFERENCES public.planosdesaude(idplanodesaude) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: professores fk1professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT fk1professor FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: professorestels fk1professortel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professorestels
    ADD CONSTRAINT fk1professortel FOREIGN KEY (professorid) REFERENCES public.professores(idprofessor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: projetos fk1projeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT fk1projeto FOREIGN KEY (deptoid) REFERENCES public.departamentos(iddepto) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: rotasviarias fk1rotaviaria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rotasviarias
    ADD CONSTRAINT fk1rotaviaria FOREIGN KEY (cidadeorigemid) REFERENCES public.cidades(idcidade) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: roteiros fk1roteiro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roteiros
    ADD CONSTRAINT fk1roteiro FOREIGN KEY (rotaid) REFERENCES public.rotasviarias(idrota) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: seguradoras fk1seguradora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguradoras
    ADD CONSTRAINT fk1seguradora FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: seguradorastels fk1seguradoratel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguradorastels
    ADD CONSTRAINT fk1seguradoratel FOREIGN KEY (seguradoraid) REFERENCES public.seguradoras(idseguradora) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: seguros fk1seguro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguros
    ADD CONSTRAINT fk1seguro FOREIGN KEY (veiculoid) REFERENCES public.veiculos(idveiculo) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: servicosfeitospor fk1servicofeitopor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicosfeitospor
    ADD CONSTRAINT fk1servicofeitopor FOREIGN KEY (oficinaid) REFERENCES public.oficinas(idoficina) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: servicosprestados fk1servicoprestado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicosprestados
    ADD CONSTRAINT fk1servicoprestado FOREIGN KEY (servicofeitoporid) REFERENCES public.servicosfeitospor(idservicofeitopor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: tarefasprojetos fk1tarefaprojeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefasprojetos
    ADD CONSTRAINT fk1tarefaprojeto FOREIGN KEY (projetoid) REFERENCES public.projetos(idprojeto) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: titulacoes fk1titulacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulacoes
    ADD CONSTRAINT fk1titulacao FOREIGN KEY (professorid) REFERENCES public.professores(idprofessor) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: turmas fk1turma	; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT "fk1turma	" FOREIGN KEY (atribuicaoid) REFERENCES public.atribuicoes(idatribuicao) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: veiculos fk1veiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT fk1veiculo FOREIGN KEY (idveiculo) REFERENCES public.veiculostipos(idtipoveiculo) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: veiculosmarcas fk1veiculomarca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculosmarcas
    ADD CONSTRAINT fk1veiculomarca FOREIGN KEY (fabricanteid) REFERENCES public.fabricantes(idfabricante) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: veiculosmodelos fk1veiculomodelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculosmodelos
    ADD CONSTRAINT fk1veiculomodelo FOREIGN KEY (marcaid) REFERENCES public.veiculosmarcas(idmarcaveiculo) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: viagens fk1viagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagens
    ADD CONSTRAINT fk1viagem FOREIGN KEY (rotaid) REFERENCES public.rotasviarias(idrota) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: agencias fk2agencia	; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agencias
    ADD CONSTRAINT "fk2agencia	" FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: agenciastels fk2agenciatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agenciastels
    ADD CONSTRAINT fk2agenciatel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: aplicacoesdascontas fk2aplicacaodaconta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacoesdascontas
    ADD CONSTRAINT fk2aplicacaodaconta FOREIGN KEY (bancoid, agenciaid, nucontaid) REFERENCES public.contas(bancoid, agenciaid, idnuconta) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: areasdeestudocursos fk2areadeestcurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudocursos
    ADD CONSTRAINT fk2areadeestcurso FOREIGN KEY (areadeestudoid) REFERENCES public.areasdeestudo(idareadeestudo) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: areasdeestudodisciplinas fk2areadeestdiscipl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudodisciplinas
    ADD CONSTRAINT fk2areadeestdiscipl FOREIGN KEY (areadeestudoid) REFERENCES public.areasdeestudo(idareadeestudo) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: areasdeestudolivros fk2areadeestlivro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areasdeestudolivros
    ADD CONSTRAINT fk2areadeestlivro FOREIGN KEY (areadeestudoid) REFERENCES public.areasdeestudo(idareadeestudo) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: armazens fk2armazem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazens
    ADD CONSTRAINT fk2armazem FOREIGN KEY (clienteid) REFERENCES public.clientes(idcliente) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: atribuicoes fk2atribuicao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atribuicoes
    ADD CONSTRAINT fk2atribuicao FOREIGN KEY (disciplinaid) REFERENCES public.disciplinas(iddisciplina) DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: atuacoes fk2atuacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atuacoes
    ADD CONSTRAINT fk2atuacao FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: autorias fk2autoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorias
    ADD CONSTRAINT fk2autoria FOREIGN KEY (autorid) REFERENCES public.autores(idautor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: autorestels fk2autortel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorestels
    ADD CONSTRAINT fk2autortel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: bairroslogradouros fk2bairrologradouro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bairroslogradouros
    ADD CONSTRAINT fk2bairrologradouro FOREIGN KEY ("bairroid	") REFERENCES public.bairros(idbairro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: bibliografias fk2bibliografia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliografias
    ADD CONSTRAINT fk2bibliografia FOREIGN KEY (livroid) REFERENCES public.livros(idlivro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: capacitacoes fk2capacitacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitacoes
    ADD CONSTRAINT fk2capacitacao FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: clientestels fk2clientetel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientestels
    ADD CONSTRAINT fk2clientetel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: consultas fk2consulta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk2consulta FOREIGN KEY (medicoid) REFERENCES public.medicos(idmedico) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: contas fk2conta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contas
    ADD CONSTRAINT fk2conta FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: departamentos fk2depart; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT fk2depart FOREIGN KEY (deptosuperiorid) REFERENCES public.departamentos(iddepto) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: departamentostels fk2departtel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentostels
    ADD CONSTRAINT fk2departtel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: editorastels fk2editoratel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorastels
    ADD CONSTRAINT fk2editoratel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: empresastels fk2empresatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresastels
    ADD CONSTRAINT fk2empresatel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fabricantes fk2fabricante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantes
    ADD CONSTRAINT fk2fabricante FOREIGN KEY (setoratuacaoid) REFERENCES public.setoresdeatuacao(idsetoratuacao) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fabricantestels fk2fabricantetel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabricantestels
    ADD CONSTRAINT fk2fabricantetel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fornecedorestels fk2fornecedortel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedorestels
    ADD CONSTRAINT fk2fornecedortel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: fornecimentos fk2fornecimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecimentos
    ADD CONSTRAINT fk2fornecimento FOREIGN KEY (fornecedorid) REFERENCES public.fornecedores(idfornecedor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionarios fk2funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT fk2funcionario FOREIGN KEY (funcaoid) REFERENCES public.funcoes(idfuncao) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionariosplanos fk2funcionarioplano; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionariosplanos
    ADD CONSTRAINT fk2funcionarioplano FOREIGN KEY (planodesaudeid) REFERENCES public.planosdesaude(idplanodesaude) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionariostels fk2funcionariotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionariostels
    ADD CONSTRAINT fk2funcionariotel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: habilitacoes fk2habilitacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilitacoes
    ADD CONSTRAINT fk2habilitacao FOREIGN KEY (professorid) REFERENCES public.professores(idprofessor) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: historicoprofissional fk2histprof; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicoprofissional
    ADD CONSTRAINT fk2histprof FOREIGN KEY (empresaid) REFERENCES public.empresas(idempresa) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: idiomasfalados fk2idiomafalado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idiomasfalados
    ADD CONSTRAINT fk2idiomafalado FOREIGN KEY (paisid) REFERENCES public.paises(idpais) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: instituicoesdeensinotels fk2instituicaoensinotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicoesdeensinotels
    ADD CONSTRAINT fk2instituicaoensinotel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name:  inventarios fk2inventario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." inventarios"
    ADD CONSTRAINT fk2inventario FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: logradouros fk2logradouro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logradouros
    ADD CONSTRAINT fk2logradouro FOREIGN KEY (tipologradouroid) REFERENCES public.logradourostipos(idlogradourotipo) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: matriculas fk2matricula; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas
    ADD CONSTRAINT fk2matricula FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: medicos fk2medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk2medico FOREIGN KEY ("instituicaodeensinoid	") REFERENCES public.instituicoesdeensino("idinstituicaodeensino	") ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: medicostels fk2medicotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicostels
    ADD CONSTRAINT fk2medicotel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: movimentos fk2movimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentos
    ADD CONSTRAINT fk2movimento FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfcompras fk2nfcompra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcompras
    ADD CONSTRAINT fk2nfcompra FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfcomprasitens fk2nfcompraitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfcomprasitens
    ADD CONSTRAINT fk2nfcompraitem FOREIGN KEY (produtoid) REFERENCES public.produtos(idproduto) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfvendas fk2nfvenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendas
    ADD CONSTRAINT fk2nfvenda FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfvendasitens fk2nfvendaitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendasitens
    ADD CONSTRAINT fk2nfvendaitem FOREIGN KEY (produtoid) REFERENCES public.produtos(idproduto) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: ocorrencias fk2ocorrencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencias
    ADD CONSTRAINT fk2ocorrencia FOREIGN KEY (veiculoid) REFERENCES public.veiculos(idveiculo) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: oficinastels fk2oficinatel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oficinastels
    ADD CONSTRAINT fk2oficinatel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: palavraslivros fk2palavralivro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palavraslivros
    ADD CONSTRAINT fk2palavralivro FOREIGN KEY (livroid) REFERENCES public.livros(idlivro) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: passagens fk2passagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT fk2passagem FOREIGN KEY (onibusid) REFERENCES public.veiculos(idveiculo) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedcompras fk2pedcompra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedcompras
    ADD CONSTRAINT fk2pedcompra FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedcomprasitens fk2pedcompraitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedcomprasitens
    ADD CONSTRAINT fk2pedcompraitem FOREIGN KEY (produtoid) REFERENCES public.produtos(idproduto) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedvendas fk2pedvenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedvendas
    ADD CONSTRAINT fk2pedvenda FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: pedvendasitens fk2pedvendaitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedvendasitens
    ADD CONSTRAINT fk2pedvendaitem FOREIGN KEY (produtoid) REFERENCES public.produtos(idproduto) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: planosdesaudemedicos fk2plansaudemed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaudemedicos
    ADD CONSTRAINT fk2plansaudemed FOREIGN KEY (medicoid) REFERENCES public.medicos(idmedico) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: planosdesaudetels fk2plansaudetel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planosdesaudetels
    ADD CONSTRAINT fk2plansaudetel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: professorestels fk2professortel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professorestels
    ADD CONSTRAINT fk2professortel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: projetos fk2projeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT fk2projeto FOREIGN KEY (funcionarioresponsavelid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: rotasviarias fk2rotaviaria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rotasviarias
    ADD CONSTRAINT fk2rotaviaria FOREIGN KEY (cidadedestinoid) REFERENCES public.cidades(idcidade) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: roteiros fk2roteiro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roteiros
    ADD CONSTRAINT fk2roteiro FOREIGN KEY (cidadeid) REFERENCES public.cidades(idcidade) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: seguradorastels fk2seguradoratel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguradorastels
    ADD CONSTRAINT fk2seguradoratel FOREIGN KEY (tipotelefoneid) REFERENCES public.telefonestipos(idtipotelefone) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: seguros fk2seguro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguros
    ADD CONSTRAINT fk2seguro FOREIGN KEY (seguradoraid) REFERENCES public.seguradoras(idseguradora) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: servicosfeitospor fk2servicofeitopor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicosfeitospor
    ADD CONSTRAINT fk2servicofeitopor FOREIGN KEY (servicoid) REFERENCES public.servicos(idservico) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: servicosprestados fk2servicoprestado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicosprestados
    ADD CONSTRAINT fk2servicoprestado FOREIGN KEY (veiculoid) REFERENCES public.veiculos(idveiculo) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: tarefasprojetos fk2tarefaprojeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefasprojetos
    ADD CONSTRAINT fk2tarefaprojeto FOREIGN KEY (tarefaid) REFERENCES public.tarefas(idtarefa) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: titulacoes fk2titulacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulacoes
    ADD CONSTRAINT fk2titulacao FOREIGN KEY (grauescolaridadeid) REFERENCES public.grausdeescolaridade(idgrauescolaridade) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: veiculos fk2veiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT fk2veiculo FOREIGN KEY (modeloid) REFERENCES public.veiculosmodelos(idmodeloveiculo) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: consultas fk3consulta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk3consulta FOREIGN KEY (planodesaudeid) REFERENCES public.planosdesaude(idplanodesaude) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionarios fk3funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT fk3funcionario FOREIGN KEY ("grauescolaridadeid	") REFERENCES public.grausdeescolaridade(idgrauescolaridade) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: historicoprofissional fk3histprof; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historicoprofissional
    ADD CONSTRAINT fk3histprof FOREIGN KEY (atividadeid) REFERENCES public.atividades(idatividade) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: medicos fk3medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk3medico FOREIGN KEY (logradouromoradiaid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: movimentos fk3movimento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentos
    ADD CONSTRAINT fk3movimento FOREIGN KEY (tipomovimentoid) REFERENCES public.movimentostipos(idtipomovimento) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: nfvendas fk3nfvenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfvendas
    ADD CONSTRAINT fk3nfvenda FOREIGN KEY (armazemid) REFERENCES public.armazens(idarmazem) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: ocorrencias fk3ocorrencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencias
    ADD CONSTRAINT fk3ocorrencia FOREIGN KEY ("numeroapoliceid	") REFERENCES public.seguros("idnumeroapolice	") ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: passagens fk3passagem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT fk3passagem FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: projetos fk3projeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projetos
    ADD CONSTRAINT fk3projeto FOREIGN KEY ("projetosuperiorid	") REFERENCES public.projetos(idprojeto) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: titulacoes fk3titulacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulacoes
    ADD CONSTRAINT fk3titulacao FOREIGN KEY (instituicaoid) REFERENCES public.instituicoesdeensino("idinstituicaodeensino	") ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: veiculos fk3veiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculos
    ADD CONSTRAINT fk3veiculo FOREIGN KEY (funcionarioid) REFERENCES public.funcionarios(idfuncionario) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: funcionarios fk4funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT fk4funcionario FOREIGN KEY (logradouroid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: medicos fk4medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk4medico FOREIGN KEY ("logradouroclinicaid	") REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: ocorrencias fk4ocorrencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencias
    ADD CONSTRAINT fk4ocorrencia FOREIGN KEY (logradouroprincipalid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: ocorrencias fk5ocorrencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocorrencias
    ADD CONSTRAINT fk5ocorrencia FOREIGN KEY (logradourosecundarioid) REFERENCES public.logradouros(idlogradouro) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED NOT VALID;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

