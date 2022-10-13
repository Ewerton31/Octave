function dados_por_regiao = calcula_dados_por_regiao(dados_por_estado, texto)
  % Calcula os dados para cada região.
  %
  % Entrada:
  %   dados_por_estado: retorno da função get_dados_por_estado.
  %   texto: os dados de texto da planilha.
  %
  % Saída:
  %   dados_por_regiao: os dados para cada região no formato:
  % [sul sudeste centro_oeste nordeste norte].

  regioes = {"Sul", "Sudeste", "Centro Oeste", "Nordeste", "Norte"};

  dados_por_regiao = [];

  for regiao = regioes
    i_estados = get_indexes_estados_por_regiao(texto, regiao);
    dados_estados_regiao = dados_por_estado(i_estados, :);

    dados_regiao = sum(dados_estados_regiao);
    dados_por_regiao = [dados_por_regiao; dados_regiao];
  endfor

endfunction

function [i_estados] = get_indexes_estados_por_regiao(texto, regiao)
  % Busca os indexes de todos os estados de uma região.
  %
  % Entrada:
  %   texto: os dados de texto da planilha.
  %   regiao: uma região (ex: "Sudeste").
  %
  % Saída:
  %   i_estados: uma lista com os indexes dos estados da região. Ex.: [1 4 15].

  i_estados = [];

  % filtra os indexes da região
  for i = 3:29
    regiao_atual = texto{i, 2};

    if strcmp(regiao_atual, regiao)
      i_estados = [i_estados i];
    endif

  endfor

  % normalizar os dados para a matriz dados_por_estado
  i_estados = i_estados - 2;
endfunction