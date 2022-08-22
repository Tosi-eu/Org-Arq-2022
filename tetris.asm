;Na funçao checaMovimentoObstaculo tem um call TelaFim, coloquei lá só pra testar
; funções faltantes: score, apaga linha, game over
jmp main

Score: var #1 ;variavel para placar

Letra: var #1  ; Guarda a letra digitada

Grid: var #1080
Peca: var #4 ;vetor que guarda a posição de cada integrante da peça de tetris são 4 no total
Peca_Tipo: var #1 ;guarda o tipo da peça que são 13 possibilidades
Vetor_peca_aux: var #4 ;usado para averiguar se uma rotação é valida

; ====== TIPOS DE PEÇA ======= (variações == rotação das peças)
;
;0   | 1 |  2       |  3  |  4    | 5 + (3 variações) | 9 + (3 variações)
; AA | A | A A A A  | A   |   A A | A                 |
; AA | A |          | A A | A A   | A                 | A A A
;    | A |          |   A |       | A A               |   A   
;    | A |          |     |       |                   |

Print_frase_pos: var #1 ; variaveis auxiliares para printar as frases
Print_frase_cor: var #1
Print_frase_frase: var #1


Msg1: string "****  <<  TETRIS ICMC >>    ****"
Msg3: string "PRESSIONE QUALQUER TECLA PARA COMECAR:"
Msg4: string "SSC0511 - ORG. COMP."
Msg4_2: string "                  SSC0513 - ORG. ARQ. COMP."
Msg5: string "ICMC"
Msg6: string "Voce perdeu, jogar novamente? <s/n>"
Msg7: string "Sua pontuacao foi de: "

; Tabela de numeros "aleatorios" de 0 -> 12
Index_Rand: var #1
Rand_n: var #1
Rand: var #25
	static Rand + #0, #6
	static Rand + #1, #1
	static Rand + #2, #9
	static Rand + #3, #3
	static Rand + #4, #10
	static Rand + #5, #0
	static Rand + #6, #11
	static Rand + #7, #4
	static Rand + #8, #2
	static Rand + #9, #8
	static Rand + #10, #12
	static Rand + #11, #3
	static Rand + #12, #12
	static Rand + #13, #4
	static Rand + #14, #1
	static Rand + #15, #8
	static Rand + #16, #5
	static Rand + #17, #7
	static Rand + #18, #10
	static Rand + #19, #0
	static Rand + #20, #9
	static Rand + #20, #5
	static Rand + #21, #6
	static Rand + #22, #2
	static Rand + #23, #11
	static Rand + #24, #7


main:
    push r0
    push r1
    push r2
	
	call LimpaTela 
	
    loadn r0, #564
	loadn r1, #Msg1    ;Mensagem inicial
	loadn r2, #2816   ; amarelo
    store Print_frase_pos, r0
    store Print_frase_frase, r1
    store Print_frase_cor, r2
	call PrintaFrase
	
	loadn r0, #1121
	loadn r1, #Msg3   ;Mensagem inicial
	loadn r2, #0	  ;branco
	call PrintaFrase_2
	
	loadn r0, #50
	loadn r1, #Msg4  ;Mensagem inicial
	loadn r2, #0     ;branco
	call PrintaFrase_2
    
    loadn r0, #150
    loadn r1, #Msg4_2  ;Mensagem inicial
    loadn r2, #0     ;branco 
    call PrintaFrase_2
	
	call DigitaAlgo ;qualquer tecla para começar
	
	call LimpaTela 
	
	loadn r1, #Tela7Linha0    ;Carrega as intrucoes do jogo
	call Cor_info
	
	call DigitaAlgo ;qualquer tecla para começar
	
	call LimpaTela 
	
	loadn r1, #tela1Linha0	 ;Carrega o cenario do jogo
	call Cor_Cenario
	
	loadn r1, #tela3Linha0   ;Carrega o cenario do jogo
	call Cor_Cenario2
    
    loadn r1, #tela4Linha0   ;Carrega o cenario do jogo
    call Cor_Cenario
        
    loadn r1, #tela8Linha0   ;Carrega o cenario do jogo
    call Cor_Cenario3
	
	loadn r0, #1120
 	loadn r1, #Msg5
 	loadn r2, #0
 	call PrintaFrase_2

    pop r0
    pop r1
    pop r2

Game_start:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    ;_____Inicialização de compenentes core do jogo_____

    loadn r0, #0
    store Index_Rand, r0 ;armazena zero no index_rand pra começar o jogo
    call Inicia_vetor_grid ;grid que monitora estado dos blocos
    call Inicia_peca ; posiçao da peça do jogo



    Start_here:
        push fr
        push r0
        push r1

        loadn r0, #0 ; contador de delays
        loadn r1, #5 ; variavel de delay, quanto maior, maior o delay
        

    Loop_delay:
        inc r0
        cmp r1, r0
		cne Delay
        jne Loop_delay

		
	    ; ____Game Logic____

        call copia_peca_para_Vetor_peca_aux
        
            ;______Cuida da parte dos comandos______
            push fr
            push r2
            push r3


            inchar r2 ; guarda o valor digitado pelo jogador

            loadn r3, #' ' ; espaço == gira peça
            cmp r2, r3
            ceq Girar_peca ; chama o comando de girar

                ;__

            loadn r3, #'d'
            cmp r2, r3
            ceq incrementa_peca

                ;__

            loadn r3, #'a'
            cmp r2, r3
            ceq decrementa_peca

                ;__

            pop fr
            pop r2
            pop r3
        
        call Desce_peca
        
        call Delay_Peca

        call Checa_descida ; pensar se coloca isso no inicio do nosso loop


        pop fr
        pop r0
        pop r1
        
        jmp Start_here

        ;TO DO: Unificar todas as checagens de posição seja de decida, esquerda ou direita
        ;Menos checagem de decida, pq esse precisa parar a peça
        ;criar função de copiar vetor poce para peca aux
        
    pop fr
    pop r0
    pop r1
    pop r2
    pop r3
    pop r4
    pop r5
    pop r6
    pop r7	

	halt


;======================= CORE ====================
;--------------- Manipulação tabela rand ------------
Atualiza_rand_index:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4

    load r1, Index_Rand 
    loadn r2, #Rand
    add r2, r2, r1
    loadi r3, r2
    store Rand_n, r3
    loadn r4, #25
    inc r1
    cmp r1, r4
    ceq reset_Index_rand
    cne increment_index_rand


    pop fr
    pop r0
    pop r1
    pop r2
    pop r3
    pop r4
    rts

reset_Index_rand:
    push r0
    loadn r0, #0
    store Index_Rand, r0
    pop r0
    rts
    
increment_index_rand:
    push r0

    load r0, Index_Rand
    inc r0
    store Index_Rand, r0

    pop r0
    rts
;--------------- Fim manipulação tabela rand --------
;--------------- Manipulação das peças --------------
Girar_peca:
    ;identifica qual a peça e para qual deve girar 
    ; 0 == não gira
    ; 1 <-> 2
    ;
    ; 3 <-> 4
    ;
    ; 5 -> 6
    ; |^   |_
    ; 8 <- 7
    ;
    ; 9 -> 10
    ; |^   |_
    ;12 <- 11
    

    push fr
    push r0
    push r1
    push r2
    push r3
    push r4

    call Apaga_vetor_peca

    load r0, Peca_Tipo
        
    loadn r1, #0
    cmp r0, r1
    jeq Gira_peca_efetivo_fim


    ;1->2
    loadn r1, #1
    cmp r0, r1
    ceq peca_inicia_tipo_2
    jeq Gira_peca_efetivo_fim

    
    ;2->1
    loadn r1, #2
    cmp r0, r1
    ceq peca_inicia_tipo_1
    jeq Gira_peca_efetivo_fim

    ;3->4
    loadn r1, #3
    cmp r0, r1
    ceq peca_inicia_tipo_4
    jeq Gira_peca_efetivo_fim

    ;4->3
    loadn r1, #4
    cmp r0, r1
    ceq peca_inicia_tipo_3
    jeq Gira_peca_efetivo_fim

    ;5->6
    loadn r1, #5
    cmp r0, r1
    ceq peca_inicia_tipo_6
    jeq Gira_peca_efetivo_fim

    ;6->7
    loadn r1, #6
    cmp r0, r1
    ceq peca_inicia_tipo_7
    jeq Gira_peca_efetivo_fim

    ;7->8
    loadn r1, #7
    cmp r0, r1
    ceq peca_inicia_tipo_8
    jeq Gira_peca_efetivo_fim

    ;8->5
    loadn r1, #8
    cmp r0, r1
    ceq peca_inicia_tipo_5
    jeq Gira_peca_efetivo_fim

    ;9->10
    loadn r1, #9
    cmp r0, r1
    ceq peca_inicia_tipo_10
    jeq Gira_peca_efetivo_fim

    ;10->11
    loadn r1, #10
    cmp r0, r1
    ceq peca_inicia_tipo_11
    jeq Gira_peca_efetivo_fim

    ;11->12
    loadn r1, #11
    cmp r0, r1
    ceq peca_inicia_tipo_12
    jeq Gira_peca_efetivo_fim

    ;12->9
    loadn r1, #12
    cmp r0, r1
    ceq peca_inicia_tipo_9
    jeq Gira_peca_efetivo_fim


    Gira_peca_efetivo_fim:
        call Checa_movimento
        call Printa_vetor_peca
        pop fr
        pop r0
        pop r1
        pop r2
        pop r3
        pop r4
        rts
        

Checa_movimento:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6


    ;checa se tem problema com o grid

    loadn r0, #Peca
    loadn r4, #0 ; contador
    loadn r5, #4 ; limite do contador para percorrer peça
    loadn r6, #1
    
    Checa_movimento_loop_1:
        loadn r2, #Grid                       ; carrega o grid
        loadi r1, r0                          ; Pega a posição da peça
        add r2, r2, r1                        ; Coloca grid na posição da peça
        loadi r3, r2                          ; Armazena estado da unidade do grid naquela posição
        cmp r3, r6                            ; Checa se há obstaculo 1 == há
        jeq Checa_movimento_fim_mov_invalido  ; Se houver chama pula para movimento invalido
        inc r0                                ; Incrementa ponteiro da peça
        inc r4                                ; Incrementa contador do loop
        cmp r4, r5                            ; Checa se esta no fim do loop
        jne Checa_movimento_loop_1            ; Se não esta chama o loop de novo

    ; checa se tem problema com a border

    loadn r0, #Peca
    loadn r4, #0 ; contador
    loadn r5, #4 ; limite do contador para percorrer peça
    loadn r6, #40

    Checa_movimento_loop_2:
        loadi r1, r0                            ; Pega posição da peça
        loadn r2, #11                           ; Indicador de borda esquerda
        loadn r3, #28                           ; Indicador de borda direita

        mod r1, r1, r6                          ; Divide posição da peça por 40, Resto precisa estar entre 11 e 28

        cmp r1, r2                              ; Checa se há problema com borda esquerda
        jeq Checa_movimento_fim_mov_invalido    ; Se há pula para mov invalido

        cmp r1,r3                               ; Checa se há provlema com borda direita
        jeq Checa_movimento_fim_mov_invalido    ; Se há pula para mov invalido

        inc r0                                  ; Incrementa ponteiro peça
        inc r4                                  ; Incrementa contador de loop
        cmp r4, r5                              ; Checa se esta no fim do loop
        jne Checa_movimento_loop_2              ; Se não chama loop de novo


    Checa_movimento_fim_mov_valido:
        ;caso valido mantem e da pop nos registradores
        pop fr
        pop r0
        pop r1
        pop r2
        pop r3
        pop r4
        pop r5
        pop r6

        rts
    
    Checa_movimento_fim_mov_invalido:
        ;caso invalido reverte a peça e volta para main func para finalizar
        call Reverte_vetor_peca
        jmp Checa_movimento_fim_mov_valido


Reverte_vetor_peca:
    push r0
    push r1
    push r2
    push r3

    loadn r0, #Vetor_peca_aux
    loadn r1, #Peca

    loadi r2, r0
    storei r1, r2
    inc r0
    inc r1

    loadi r2, r0
    storei r1, r2
    inc r0
    inc r1

    loadi r2, r0
    storei r1, r2
    inc r0
    inc r1

    loadi r2, r0
    storei r1, r2

    pop r0
    pop r1
    pop r2
    pop r3
    rts

copia_peca_para_Vetor_peca_aux:
    push r0
    push r1
    push r2
    push r3

    loadn r0, #Peca
    loadn r1, #Vetor_peca_aux

    loadi r2, r0
    storei r1, r2
    inc r0
    inc r1

    loadi r2, r0
    storei r1, r2
    inc r0
    inc r1

    loadi r2, r0
    storei r1, r2
    inc r0
    inc r1

    loadi r2, r0
    storei r1, r2

    pop r0
    pop r1
    pop r2
    pop r3
    rts


Atualiza_grid:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r7


    loadn r0, #Peca
    loadn r2, #4
    loadn r3, #0 ;contador
    loadn r4, #1

    

    Atualiza_grid_loop:
        loadi r1, r0 
        loadn r7, #Grid
        add r7, r7, r1
        
        storei r7, r4


        inc r0
        inc r3
        cmp r2, r3
        jne Atualiza_grid_loop
 
    
    pop fr
    pop r0
    pop r1
    pop r2
    pop r3
    pop r4
    pop r7
    rts

Checa_descida:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5

    ;não passar da ultima linha

    loadn r0, #Peca
    loadn r2, #40
    loadn r3, #1
    loadn r4, #0 ; contador
    loadn r5, #4

    Checa_decida_loop:
        push r6
        loadi r1, r0 ;pega posição da peca
        loadn r6, #Grid ; inicia ponteiro grid
        add r1,r1, r2 ; aumenta 40 (vai para linha de baixo)
        add r6, r6, r1 ; coloca o ponteiro na posição correspondente
        loadi r1, r6 ;coloca o calor correspondente no r1
        pop r6

        cmp r1, r3
        jeq Decida_invalida

        inc r4
        inc r0
        cmp r4, r5
        jne Checa_decida_loop
    
    jmp Descida_valida

    Decida_invalida:
        call Atualiza_grid
        call Inicia_peca
    

    Descida_valida:

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3
    pop r4
    pop r5

    rts

Desce_peca:

	push r0 
	push r1 
	push r2
	push r3
	
    call Apaga_vetor_peca

	; soma 40 na posição de cada elemento do vetor peça para movelo 1 unidade para baixo
    loadn r0, #Peca
    loadn r1, #40
    
    loadi r2, r0
    add r2, r2, r1
    storei r0, r2
    inc r0

    loadi r2, r0
    add r2, r2, r1
    storei r0, r2
    inc r0

    loadi r2, r0
    add r2, r2, r1
    storei r0, r2
    inc r0

    loadi r2, r0
    add r2, r2, r1
    storei r0, r2
    
    call Printa_vetor_peca

    call Delay_Peca

	pop r0 
	pop r1 
	pop r2
	pop r3

	rts 




incrementa_peca:
    push r0
    push r1
    push r2
    call Apaga_vetor_peca

    loadn r0, #Peca

    loadi r2, r0
    inc r2
    storei r0, r2
    
    inc r0

    loadi r2, r0
    inc r2
    storei r0, r2
     
    inc r0
    
    loadi r2, r0
    inc r2
    storei r0, r2
    
    inc r0
    
    loadi r2, r0
    inc r2
    storei r0, r2

    call Checa_movimento
    call Printa_vetor_peca
    pop r0
    pop r1
    pop r2
    rts

decrementa_peca:
    push r0
    push r1
    push r2
        call Apaga_vetor_peca

    loadn r0, #Peca

    loadi r2, r0
    dec r2
    storei r0, r2
    
    inc r0

    loadi r2, r0
    dec r2
    storei r0, r2
     
    inc r0
    
    loadi r2, r0
    dec r2
    storei r0, r2
    
    inc r0
    
    loadi r2, r0
    dec r2
    storei r0, r2

    call Checa_movimento
    call Printa_vetor_peca
    pop r0
    pop r1
    pop r2
    rts

Printa_vetor_peca: ; printa o vetor peça na posição adequada na tela
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r0, #Peca
    loadn r1, #4
    loadn r2, #0 ; contador para as 4 unidades da peça
    loadn r4, #'#'

    Printa_vetor_Peca_loop:
        loadi r3, r0
        outchar r4, r3
        inc r0
        inc r2
        cmp r2, r1
        jne Printa_vetor_Peca_loop


    pop fr
    pop r0
    pop r1
    pop r2
    pop r3
    pop r4
    rts

Apaga_vetor_peca: ; printa o vetor peça na posição adequada na tela
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r0, #Peca
    loadn r1, #4
    loadn r2, #0 ; contador para as 4 unidades da peça
    loadn r4, #' '

    Apaga_vetor_Peca_loop:
        loadi r3, r0
        outchar r4, r3
        inc r0
        inc r2
        cmp r2, r1
        jne Apaga_vetor_Peca_loop

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3
    pop r4
    rts

Inicia_peca: ; inicia / chama nova peça
	push fr
	push r0
	push r1
    push r2

    
    ; Usar a solução, no começo passo o valor inicial apenas para o primeiro elemento,
    ; com base nisso temos ""funções construtoras"" que usam esse 1 elemento para fazer o vetor
    ; assim posso reusar as funçoes construtoras para a hora de girar a peça

    ;valor inicial da peça é 180

    ; TO DO: fazer aqui um selecionador aleatorio de que peça sera iniciada

	loadn r0, #Peca
	loadn r1, #180     ; assinala posição inicial como 180
    storei r0, r1

    call Atualiza_rand_index

    load r2, Rand_n
    store Peca_Tipo, r2

    ; ----- a partir daqui seleciona qual func chamar

    loadn r1, #0
    cmp r1, r2
    ceq peca_inicia_tipo_0

    loadn r1, #1
    cmp r1, r2
    ceq peca_inicia_tipo_1

    loadn r1, #2
    cmp r1, r2
    ceq peca_inicia_tipo_2

    loadn r1, #3
    cmp r1, r2
    ceq peca_inicia_tipo_3

    loadn r1, #4
    cmp r1, r2
    ceq peca_inicia_tipo_4

    loadn r1, #5
    cmp r1, r2
    ceq peca_inicia_tipo_5

    loadn r1, #6
    cmp r1, r2
    ceq peca_inicia_tipo_6

    loadn r1, #7
    cmp r1, r2
    ceq peca_inicia_tipo_7

    loadn r1, #8
    cmp r1, r2
    ceq peca_inicia_tipo_8

    loadn r1, #9
    cmp r1, r2
    ceq peca_inicia_tipo_9

    loadn r1, #10
    cmp r1, r2
    ceq peca_inicia_tipo_10

    loadn r1, #11
    cmp r1, r2
    ceq peca_inicia_tipo_11

    loadn r1, #12
    cmp r1, r2
    ceq peca_inicia_tipo_12


    ; ----- termina a seleção de qual função chamar


	pop fr
	pop r0
	pop r1
    pop r2

	rts

; Estou usando como padrão para o inicio das peças a unidade
; do canto esquerdo inferior
; Funcionamento:
; cada função vai pegar a posição inicial do nosso vetor e calcular as outras
;com base nela
peca_inicia_tipo_0:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A A
    ;A A

    loadn r3, #0
    store Peca_Tipo, r3

    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    inc r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    dec r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts


peca_inicia_tipo_1:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A
    ;A
    ;A
    ;A

    loadn r3, #1
    store Peca_Tipo, r3

    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts

peca_inicia_tipo_2:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A A A A
    
    loadn r3, #2
    store Peca_Tipo, r3

    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    inc r1
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts


peca_inicia_tipo_3:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A
    ;A A
    ;  A

    loadn r3, #3
    store Peca_Tipo, r3

    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    dec r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts


peca_inicia_tipo_4:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;  A A
    ;A A

    loadn r3, #4
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    inc r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts


peca_inicia_tipo_5:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A
    ;A 
    ;A A

    loadn r3, #5
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    inc r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    dec r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts


peca_inicia_tipo_6:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;    A
    ;A A A 
    ;

    loadn r3, #6
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    inc r1
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts

peca_inicia_tipo_7:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A A
    ;  A
    ;  A

    loadn r3, #7
    store Peca_Tipo, r3  
    
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    dec r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts


peca_inicia_tipo_8:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A A A 
    ;A  

    loadn r3, #8
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts

peca_inicia_tipo_9:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A A A 
    ;  A  

    loadn r3, #9
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    inc r0
    dec r1
    dec r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts

peca_inicia_tipo_10:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;A 
    ;A A
    ;A

    loadn r3, #10
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    dec r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts

peca_inicia_tipo_11:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;  A 
    ;A A A
    
    loadn r3, #11
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    inc r1
    storei r0, r1

    inc r0
    inc r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    dec r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts
    

peca_inicia_tipo_12:
    push fr
    push r0
    push r1
    push r2
    push r3

    ;  A 
    ;A A
    ;  A
    
    loadn r3, #12
    store Peca_Tipo, r3
      
    loadn r0, #Peca
    loadi r1, r0
    loadn r2, #40

    inc r0
    sub r1, r1, r2
    storei r0, r1

    inc r0
    dec r1
    storei r0, r1

    inc r0
    sub r1, r1, r2
    inc r1
    storei r0, r1

    pop fr
    pop r0
    pop r1
    pop r2
    pop r3

    rts
;--------------- Fim Manipulação das peãs --------------
;--------------- Manipulação de vetor ------------------
Inicia_vetor_grid:      ;assinala o valor 0 para todos os elementos do vetor grid
				        ; 0 == não há obstaculo
	push fr
	push r0
	push r1
	push r3
	push r4 ;counter

	loadn r0, #Grid
	loadn r1, #1040
	loadn r3, #0
	loadn r4, #0 ;contador

	grid_loop:
		storei r0, r3
		inc r0
		inc r4
		cmp r4, r1
		jne grid_loop

    loadn r1, #1080
	loadn r3, #1

    grid_loop_2:
		storei r0, r3
		inc r0
		inc r4
		cmp r4, r1
		jne grid_loop_2


	pop fr
	pop r0
	pop r1
	pop r3
	pop r4

	rts


;--------------- Fim manipulação de vetor --------------

Delay:
	push r0 
	push r2 
	
	loadn r2, #2  ; a
	
    loopi:				; (dois loops de decremento conforme dicas de jogos)
		loadn r0, #2300	; b
    loopj: 
		dec r0 			 
		jnz loopj	
		dec r2
		jnz loopi
	
	pop r2
	pop r0
	
	rts
	
Delay_Peca:
	push r0 
	push r2 
	
	loadn r2, #434 ; a
	
    loopi:				; (dois loops de decremento conforme dicas de jogos)
		loadn r0, #200	; b
    loopj: 
		dec r0 			 
		jnz loopj	
		dec r2
		jnz loopi
	
	pop r2
	pop r0
	
	rts
;========================= TELAS ==================
LimpaTela:
	push fr		        ;protege o registrador de flags
	push r0
	push r1
	push r3

	loadn r0, #1200		;apaga as 1200 posicoes da tela
	loadn r1, #' '		;com "espaco"
    loadn r3, #0

	LimpaTela_Loop: 	; = for(r0=1200; r3>0; r3--)
		dec r0
		outchar r1, r0
        cmp r3, r0
		jne LimpaTela_Loop

    pop r3	
	pop r1
	pop r0
	pop fr
	rts
	

PrintaFrase_2:	

	push fr				
	push r0	; Posicao da tela que o primeiro caractere da mensagem sera' impresso
	push r1	; endereco onde comeca a mensagem
	push r2	; cor da mensagem
	push r3	; Criterio de parada
	push r4	; Recebe o codigo do caractere da Mensagem
	push r5

    	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '

    PrintaFrase2_Loop:
	
		loadi r4, r1		; aponta para a memoria no endereco r1 e busca seu conteudo em r4
		cmp r4, r3			; compara o codigo do caractere buscado com o criterio de parada
		jeq PrintaFrase2_Exit	; goto Final da rotina
		cmp r4, r5;
		jeq PrintaFrase2_Skip
		add r4, r2, r4		; soma a cor (r2) no codigo do caractere em r4
		outchar r4, r0		; imprime o caractere cujo codigo está em r4 na posicao r0 da tela
		
    PrintaFrase2_Skip:
	
		inc r0				; incrementa a posicao que o proximo caractere sera' escrito na tela
		inc r1				; incrementa o ponteiro para a mensagem na memoria
		jmp PrintaFrase2_Loop	; goto Loop
	
    PrintaFrase2_Exit:	;Desempilhamento: resgata os valores dos registradores utilizados na Subrotina da Pilha
		
		pop r5
		pop r4	
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts		; retorno da subrotina
	
ImprimeTela:

	push fr
	push r0	; Posicao da tela que o primeiro caractere da mensagem sera' impresso
	push r1	; endereco onde comeca a mensagem
	push r2	; cor da mensagem
	push r3	; Criterio de parada
	push r4	; Recebe o codigo do caractere da Mensagem
	push r5
	push r6
	push r7
	
	loadn r0, #0
	loadn r5, #30	;imprimir 30 linhas
	loadn r6, #40
	loadn r7, #1
		
    ImprimeTela_Loop: 

	    call PrintaFrase_2
    
	    add r1, r1, r6
	    add r1, r1, r7
	    add r0, r0, r6
    
	    dec r5
	    jnz ImprimeTela_Loop

	pop r7		
	pop r6
	pop r5	
	pop r4	
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
	
Cor_info:
	push fr
	push r1
	push r2
	
	loadn r2, #1792 ;cor do info (no caso prata)  
	call ImprimeTela;

	pop r2
	pop r1
	pop fr
	rts	
	
Cor_Cenario:
	push fr
	push r1
	push r2
	
	loadn r2, #2816 ;cor do sol (amarelo)  
	call ImprimeTela;

	pop r2
	pop r1
	pop fr
	rts	
	
Cor_Cenario2:
	push fr
	push r1
	push r2
	
	loadn r2, #0 ;cor do cenario (no caso branco)  
	call ImprimeTela;

	pop r2
	pop r1
	pop fr
	rts	
    
Cor_Cenario3:
    push fr
    push r1
    push r2
    
    loadn r2, #2048 ;cor do cenario (no caso cinza)  
    call ImprimeTela;

    pop r2
    pop r1
    pop fr
    rts 

DigitaAlgo:
 	push fr ; Protege o registrador de flags
 	push r0
 	push r1 
 	push r2 
 	
 	loadn r1, #255  ; Se nao digitar nada vem 255
 	loadn r2, #0
 	
 	DigitaAlgo_Loop:
 		inchar r0            ; Le o teclado, se nada for digitado = 255   
 		cmp r0, r1           ;compara r0 com 255
 		jeq DigitaAlgo_Loop    ; Fica lendo ate' que digite uma tecla valida
 		  
 	
 	store Letra, r0          ; Salva a tecla na variavel global "Letra"
 	
 	
 	DigitaAlgo_Loop2:         ; Bloco novo para aguardar que o user solte a tecla pressionada!!
 		inchar r0             ; Le o teclado, se nada for digitado = 255
 		cmp r0, r1            ;compara r0 com 255
 		jne DigitaAlgo_Loop2  ; Fica lendo ate' que digite uma tecla valida
 		
 	pop r2 
 	pop r1 
 	pop r0 
 	pop fr
 	
 	rts	

PrintaFrase:	
	push fr				
	push r0	; Posicao da tela que o primeiro caractere da mensagem sera' impresso
	push r1	; endereco onde comeca a mensagem
	push r2	; cor da mensagem
	push r3	; Criterio de parada
	push r4	; Recebe o codigo do caractere da Mensagem

    load r0, Print_frase_pos
	loadn r1, #Print_frase_frase    ;Mensagem inicial
	load r2, Print_frase_cor 
	
	loadn r3, #'\0'	; Criterio de parada

	Print_Str_Loop:	
		loadi r4, r1		; aponta para a memoria no endereco r1 e busca seu conteudo em r4
		cmp r4, r3			; compara o codigo do caractere buscado com o criterio de parada
		jeq Print_Str_Exit	; goto Final da rotina
		
		
		add r4, r2, r4		; soma a cor (r2) no codigo do caractere em r4
		outchar r4, r0		; imprime o caractere cujo codigo está em r4 na posicao r0 da tela
		inc r0				; incrementa a posicao que o proximo caractere sera' escrito na tela

		inc r1				; incrementa o ponteiro para a mensagem na memoria
		jmp Print_Str_Loop	; goto Loop
	
	Print_Str_Exit:	
	;---- Desempilhamento: resgata os valores dos registradores utilizados na Subrotina da Pilha

		pop r4	
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts		; retorno da subrotina
	
; Tela do Jogo

tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string " .  y  .                                "
tela1Linha4  : string "   |xz                                  "
tela1Linha5  : string " _|xxxz_                                "
tela1Linha6  : string "  WxxxX                                 "
tela1Linha7  : string "   WxX                                  "
tela1Linha8  : string " .  y  .                                "
tela1Linha9  : string "                                        "                   
tela1Linha10 : string "                                        "               
tela1Linha11 : string "                                        "               
tela1Linha12 : string "                                        "            
tela1Linha13 : string "                                        "                   
tela1Linha14 : string "                                        "                  
tela1Linha15 : string "                                        "
tela1Linha16 : string "                                        "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "                                		   "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "

tela3Linha0  : string "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
tela3linha1  : string "                                        "
tela3Linha2  : string "           x                x           "
tela3Linha3  : string "           x                x           "
tela3Linha4  : string "           x                x    |xxz   "
tela3Linha5  : string "           x                x   |xxxxz  "
tela3Linha6  : string "           x                x   WxxxxX  "
tela3Linha7  : string "           x                x    WxxX   "
tela3Linha8  : string "           x                x           "
tela3Linha9  : string "           x                x           "
tela3Linha10 : string "           x                x           "
tela3Linha11 : string "           x                x           "
tela3Linha12 : string "           x                x           "
tela3Linha13 : string "           x                x           "
tela3Linha14 : string "           x                x           "
tela3Linha15 : string "           x                x           "
tela3Linha16 : string "           x                x           "
tela3Linha17 : string "           x                x      ^    "
tela3Linha18 : string "           x                x     ^^^   "
tela3Linha19 : string "           x                x     yOy   "
tela3Linha20 : string "           x                x    _y y_  "
tela3Linha21 : string "           x                x   y_yOy_y "
tela3Linha22 : string "           x                x    _y y_  "
tela3Linha23 : string "           x                x   y_____y "
tela3Linha24 : string "           x                x     @@@   "
tela3Linha25 : string "           x                x      @    "
tela3Linha26 : string "           xxxxxxxxxxxxxxxxxx           "
tela3Linha27 : string "                                        "
tela3Linha28 : string "                                 |xxxz  "
tela3Linha29 : string "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|xxxxxxxz"

tela4Linha0  : string "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
tela4linha1  : string "                                        "
tela4Linha2  : string "                                        "
tela4Linha3  : string "                                        "
tela4Linha4  : string "                                        "
tela4Linha5  : string "                                        "
tela4Linha6  : string "                                        "
tela4Linha7  : string "                                        "
tela4Linha8  : string "                                        "
tela4Linha9  : string "                                        "
tela4Linha10 : string "                                        "
tela4Linha11 : string "                                        "
tela4Linha12 : string "                                        "
tela4Linha13 : string "                                        "
tela4Linha14 : string "                                        "
tela4Linha15 : string "                                        "
tela4Linha16 : string "                                        "
tela4Linha17 : string "                                        "
tela4Linha18 : string "                                        "
tela4Linha19 : string "                                        "
tela4Linha20 : string "                                        "
tela4Linha21 : string "                                        "
tela4Linha22 : string "                                        "
tela4Linha23 : string "                                        " 
tela4Linha24 : string "                                        "
tela4Linha25 : string "                                        "
tela4Linha26 : string "                                        " 
tela4Linha27 : string "                                        "
tela4Linha28 : string "                                        "
tela4Linha29 : string "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"



tela8Linha0  : string "                                        "
tela8linha1  : string "                                        "
tela8Linha2  : string "                                        "
tela8Linha3  : string "                                        "
tela8Linha4  : string "                                 |xxz   "
tela8Linha5  : string "                                |xxxxz  "
tela8Linha6  : string "                                WxxxxX  "
tela8Linha7  : string "                                 WxxX   "
tela8Linha8  : string "                                        "
tela8Linha9  : string "                                        "
tela8Linha10 : string "                                        "
tela8Linha11 : string "                                        "
tela8Linha12 : string "                                        "
tela8Linha13 : string "                                        "
tela8Linha14 : string "                                        "
tela8Linha15 : string "                                        "
tela8Linha16 : string "                                        "
tela8Linha17 : string "                                   ^    "
tela8Linha18 : string "                                  ^^^   "
tela8Linha19 : string "                                  yOy   "
tela8Linha20 : string "                                 _y y_  "
tela8Linha21 : string "                                y_yOy_y "
tela8Linha22 : string "                                 _y y_  "
tela8Linha23 : string "                                y_____y "
tela8Linha24 : string "                                  @@@   "
tela8Linha25 : string "                                   @    "
tela8Linha26 : string "                                        "
tela8Linha27 : string "                                        "
tela8Linha28 : string "                                 |xxxz  "
tela8Linha29 : string "                                        "

; Tela de Instrucoes

Tela7Linha0  : string "                                        "
Tela7Linha1  : string "               INSTRUCOES               "
Tela7Linha2  : string "                                        "
Tela7Linha3  : string "                                        "
Tela7Linha4  : string "         JOGO PARA A MATERIA DE         "
Tela7Linha5  : string "  ORGANIZACAO DE COMPUTADORES DIGITAIS  "
Tela7Linha6  : string "                                        "
Tela7Linha7  : string "        MINISTRADA PELO PROFESSOR       "
Tela7Linha8  : string "         EDUARDO DO VALLE SIMOES        "
Tela7Linha9  : string "                                        "
Tela7Linha10  :string "                                        "
Tela7Linha11  :string "      ESTE JOGO E O CLASSICO TETRIS     "
Tela7Linha12  :string "     OS COMANDOS BASICOS DO JOGO SAO:   "
Tela7Linha13  :string "                                        "
Tela7Linha14  :string "                                        "
Tela7Linha15  :string "         a - MOVE PARA ESQUERDA         "
Tela7Linha16  :string "         d - MOVE PARA DIREITA          "
Tela7Linha17  :string "                                        "
Tela7Linha18  :string "                                        "
Tela7Linha19  :string "          ESPERAMOS QUE GOSTE!          "
Tela7Linha20  :string "                                        "
Tela7Linha21  :string "                                        "
Tela7Linha22  :string "           TENHA UM BOM JOGO!           "
Tela7Linha23  :string "        BEBAM AGUA E COMAM FRUTAS       "
Tela7Linha24  :string "                                        "
Tela7Linha25  :string "                                        "
Tela7Linha26  :string "                                        "
Tela7Linha27  :string "                                        "
Tela7Linha28  :string " PRESSIONE QUALQUER TECLA PARA COMECAR: "
Tela7Linha29  :string "                                        " 
;jmp main
