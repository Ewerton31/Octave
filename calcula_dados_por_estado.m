function [dados_por_estado] = calcula_dados_por_estado(dados)
  % Calcula os dados para cada estado na planilha.
  %
  % Entrada:
  %   dados: dados numéricos da planilha.
  %
  % Saída:
  %   dados_por_estado: uma matriz MxN com os dados em que
  % cada linha corresponde a um estado. O formato utilizado é:
  % [total_pop nao_imunizada totalmente parcialmente].

  total_pop = dados(:, 1);
  primeira_dose = dados(:, 4);
  prop_segunda_dose = dados(:, 3);

  nao_imunizada = total_pop - primeira_dose;
  totalmente = total_pop .* prop_segunda_dose;
  parcialmente = total_pop - (nao_imunizada + totalmente);

  dados_por_estado = [total_pop nao_imunizada totalmente parcialmente];
endfunction