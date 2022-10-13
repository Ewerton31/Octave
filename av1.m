function [matriz]=av1()
  [dados, texto] = get_planilha();

  dados_por_estado = calcula_dados_por_estado(dados);

  dados_por_regiao = calcula_dados_por_regiao(dados_por_estado, texto);
  matriz=[];
  for i=1:5
    pop_total= dados_por_regiao (i, 1);
    nao_imunizadas = dados_por_regiao(i, 2);
    totalmente_imunizadas = dados_por_regiao(i, 3);
    parcialmente_imunizadas = dados_por_regiao(i, 4);
    % do 1 ao fim
    nao_imunizadas_percentual =(nao_imunizadas/pop_total)*100;

    totalmente_imunizadas_percentual = (totalmente_imunizadas/pop_total)*100;

    parcialmente_imunizadas_percentual = (parcialmente_imunizadas/pop_total)*100;

    matriz(i, 1:3) = [totalmente_imunizadas_percentual parcialmente_imunizadas_percentual nao_imunizadas_percentual];
  endfor
  
  figure; 
  regioes = {"Sul", "Sudeste", "Centro Oeste", "Nordeste", "Norte"};
  legenda = {"totalmente imunizados","parcialmente imunizados","nao imunizados"}
  clf;
  bar (matriz,"stacked");
  xlabel("Regiões"); ylabel("percentual");
  set(gca,'xticklabel',regioes );
  title("Panorama da imunização por região no inicio de 2022");
  legend(legenda,"location","southoutside","orientation", "horizontal");
  %legend(texto(2:6),"location","southoutside");
  
  
  [fname,fpath]=uiputfile("*.xlsx","Escolha onde gravar os dados")

  if fname!=0 %so executa a leitura se o usuario selecionou algum arquivo
    planilha="Percentuais por regioes";
    range='B2:D7'
    range2='B1:D1'
    range3='A2:A6'
    %planilha=input("Entre com o nome da planilha onde serao gravados os dados : ","s");
    %range=input("Entre com a faixa de celulas onde os dados serao gravados (Ex A2:B4) : ","s");
    xlswrite([fpath fname],matriz,planilha,range);
    xlswrite([fpath fname],legenda,planilha,range2);
    xlswrite([fpath fname],regioes',planilha,range3);
  endif
endfunction