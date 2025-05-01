# FIFO (First in, First Out)

Neste lab será implementada uma FIFO, uma estrutura muito utilizada em circuitos digitais. Ela armazena os dados em ordem e os entrega na mesma ordem que ele foram armazenados. É uma fila do tipo primeiro a entrar, primeiro a sair. Uma FIFO geralmente é utilizada quando um dispositivo consumidor de dados não acompanha o ritmo do produtor. As FIFOS são particulamente úteis em tratamento de imagem e som, nos quais os dados são transmitidos na forma de *streaming*.

## Como funciona a FIFO?

A FIFO possui um sinal de relógio para sincronizar suas operações de escrita e de leitura. Há um buffer com várias posições de memória para armazenamento. A operação de escrita é quando um dado é armazenado na FIFO e a operação de leitura é quando um dado é retirado dela. Mas como a FIFO sabe onde armazenar o dado e de onde ler o dado? Veja a figura abaixo.

![fifo](fifo.svg)

Quando o sinal `wr_en` vai para nível alto, o dado armazenado em `din` é guardado na posição do buffer indicada pelo ponteiro de escrita `w_ptr`. Após a escrita o ponteiro vai para a próxima posição.

Analogamente, quando o sinal `rd_en` vai para nível alto, o dado armazenado na posição incidada pelo ponteiro de leitura `r_ptr` é mostrado na saída `dout`. Após a leitura, o ponteiro vai para a próxima posição.

Se os dois ponteiros estiverem na mesma posição, significa que o buffer está vazio e o sinal de `empty` deve ir para nível alto. Se a FIFO estiver vazia, qualquer tentativa de leitura é ignorada.

De forma análoga, se o ponteiro de escrita estiver logo atrás do ponteiro de leitura, significa que o buffer está cheio e o sinal `full` deve ir para nível alto. Se a FIFO estiver cheia, qualquer tentativa de escrita é ignorada.

*Note que utilizar essa lógica para identifcar o estado de cheio vai sempre deixar um espaço vazio na FIFO*.

Quando o sinal de reset `rstn` é acionado, os ponteiros voltam para o zero e a FIFO fica vazia.

## Atividade

Faça um módulo FIFO seguindo as regras fornecidas neste texto. A FIFO terá uma porta de largura de 8 bits e uma profundidade de 4 posições de memória, assim como na figura.

## Execução da atividade

Siga o modelo de módulo já fornecido e utilize o testbench e scripts de execução para sua verificação. Em seguida, implemente o circuito de acordo com as especificações e, se necessário, crie outros testes para verificá-lo.

Uma vez que estiver satisfeito com o seu código, execute o script de testes com `./run-all.sh`. Ele mostrará na tela `ERRO` em caso de falha ou `OK` em caso de sucesso.

> **Dica:** Use o mostrador de forma de onda GTKWave para ajudar na depuração

## Entrega

Realize um *commit* no repositório do **GitHub Classroom**. O sistema de correção automática vai validar sua implementação e atribuir uma nota com base nos testes.

> **Dica:**  Não modifique os arquivos de correção! Para entender como os testes funcionam, consulte o script `run.sh` disponível no repositório.