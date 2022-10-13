function [dados_num, texto] = get_planilha()
  % Abre uma janela pop-up para que o usu�rio possa escolher o arquivo da planilha.
  %
  % Sa�da:
  %   dados_num: dados num�ricos da planilha.
  %   texto: dados de texto da planilha.

  pkg load io

  [fname, fpath] = uigetfile(".xlsx", "Escolha o arquivo onde estao os dados")

  if fname != 0
    [dados_num, texto] = xlsread([fpath fname], "Por estado", "A1:H29");
  endif

endfunction