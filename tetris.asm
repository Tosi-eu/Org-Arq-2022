; funções faltantes: score, apaga linha (implementado, falta inserir no código), game over
jmp main

Score: var #1 ;variavel para placar
Letra: var #1  ; Guarda a letra digitada

Grid: var #1080
Peca: var #4 ;vetor que guarda a posição de cada integrante da peça de tetris são 4 no total
Peca_Tipo: var #1 ;guarda o tipo da peça que são 13 possibilidades
Vetor_peca_aux: var #4 ;usado para averiguar se uma rotação é valida

;variaveis auxiliares para saber posicao preenchivel da tela e do grid 
PosInicialApagarTela: var #1
PosInicialApagarGrid: var #1
PosInicialApagarGridMaximo: var #1
PosMaximoApagarTela: var #1

PosInicialApagarTelaFixa: var #1
PosInicialApagarGridFixa: var #1
PosInicialApagarGridMaximoFixa: var #1
PosMaximoApagarTelaFixa: var #1

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
;tela nova
Screen : var #1200
  ;Linha 0
  static Screen + #0, #2907
  static Screen + #1, #2907
  static Screen + #2, #2907
  static Screen + #3, #2907
  static Screen + #4, #2907
  static Screen + #5, #2907
  static Screen + #6, #2907
  static Screen + #7, #2907
  static Screen + #8, #2907
  static Screen + #9, #2907
  static Screen + #10, #2907
  static Screen + #11, #2907
  static Screen + #12, #2907
  static Screen + #13, #2907
  static Screen + #14, #2907
  static Screen + #15, #2907
  static Screen + #16, #2907
  static Screen + #17, #2907
  static Screen + #18, #2907
  static Screen + #19, #2907
  static Screen + #20, #2907
  static Screen + #21, #2907
  static Screen + #22, #2907
  static Screen + #23, #2907
  static Screen + #24, #2907
  static Screen + #25, #2907
  static Screen + #26, #2907
  static Screen + #27, #2907
  static Screen + #28, #2907
  static Screen + #29, #2907
  static Screen + #30, #2907
  static Screen + #31, #2907
  static Screen + #32, #2907
  static Screen + #33, #2907
  static Screen + #34, #2907
  static Screen + #35, #2907
  static Screen + #36, #2907
  static Screen + #37, #2907
  static Screen + #38, #2907
  static Screen + #39, #2907

  ;Linha 1
  static Screen + #40, #3967
  static Screen + #41, #3967
  static Screen + #42, #3967
  static Screen + #43, #3967
  static Screen + #44, #3967
  static Screen + #45, #3967
  static Screen + #46, #3885
  static Screen + #47, #3967
  static Screen + #48, #3931
  static Screen + #49, #3931
  static Screen + #50, #3931
  static Screen + #51, #3931
  static Screen + #52, #3931
  static Screen + #53, #3931
  static Screen + #54, #3931
  static Screen + #55, #3931
  static Screen + #56, #3931
  static Screen + #57, #3967
  static Screen + #58, #3967
  static Screen + #59, #3967
  static Screen + #60, #3967
  static Screen + #61, #3967
  static Screen + #62, #3967
  static Screen + #63, #3967
  static Screen + #64, #3967
  static Screen + #65, #3967
  static Screen + #66, #3967
  static Screen + #67, #3967
  static Screen + #68, #3967
  static Screen + #69, #3967
  static Screen + #70, #3967
  static Screen + #71, #3967
  static Screen + #72, #3967
  static Screen + #73, #3967
  static Screen + #74, #3967
  static Screen + #75, #3967
  static Screen + #76, #3967
  static Screen + #77, #3967
  static Screen + #78, #3967
  static Screen + #79, #3967

  ;Linha 2
  static Screen + #80, #3967
  static Screen + #81, #3967
  static Screen + #82, #3967
  static Screen + #83, #3919
  static Screen + #84, #3919
  static Screen + #85, #2941
  static Screen + #86, #3919
  static Screen + #87, #3919
  static Screen + #88, #3967
  static Screen + #89, #3967
  static Screen + #90, #3931
  static Screen + #91, #3931
  static Screen + #92, #3931
  static Screen + #93, #3931
  static Screen + #94, #3967
  static Screen + #95, #3967
  static Screen + #96, #3967
  static Screen + #97, #3967
  static Screen + #98, #3967
  static Screen + #99, #3967
  static Screen + #100, #3967
  static Screen + #101, #3967
  static Screen + #102, #3967
  static Screen + #103, #3967
  static Screen + #104, #3967
  static Screen + #105, #3967
  static Screen + #106, #3967
  static Screen + #107, #3967
  static Screen + #108, #3967
  static Screen + #109, #3967
  static Screen + #110, #3967
  static Screen + #111, #3967
  static Screen + #112, #3967
  static Screen + #113, #3967
  static Screen + #114, #3967
  static Screen + #115, #91
  static Screen + #116, #3967
  static Screen + #117, #3967
  static Screen + #118, #3967
  static Screen + #119, #3967

  ;Linha 3
  static Screen + #120, #3967
  static Screen + #121, #3967
  static Screen + #122, #3885
  static Screen + #123, #3919
  static Screen + #124, #2895
  static Screen + #125, #2895
  static Screen + #126, #2895
  static Screen + #127, #3919
  static Screen + #128, #3967
  static Screen + #129, #3967
  static Screen + #130, #3931
  static Screen + #131, #3931
  static Screen + #132, #91
  static Screen + #133, #3967
  static Screen + #134, #3967
  static Screen + #135, #3967
  static Screen + #136, #3967
  static Screen + #137, #3967
  static Screen + #138, #3967
  static Screen + #139, #3967
  static Screen + #140, #3967
  static Screen + #141, #3967
  static Screen + #142, #3967
  static Screen + #143, #3967
  static Screen + #144, #3967
  static Screen + #145, #3967
  static Screen + #146, #3967
  static Screen + #147, #91
  static Screen + #148, #3967
  static Screen + #149, #3967
  static Screen + #150, #3967
  static Screen + #151, #3935
  static Screen + #152, #3935
  static Screen + #153, #3967
  static Screen + #154, #2095
  static Screen + #155, #2139
  static Screen + #156, #2140
  static Screen + #157, #3967
  static Screen + #158, #3967
  static Screen + #159, #3967

  ;Linha 4
  static Screen + #160, #3967
  static Screen + #161, #3967
  static Screen + #162, #2942
  static Screen + #163, #2895
  static Screen + #164, #2895
  static Screen + #165, #2895
  static Screen + #166, #2895
  static Screen + #167, #2895
  static Screen + #168, #2942
  static Screen + #169, #3967
  static Screen + #170, #3931
  static Screen + #171, #3931
  static Screen + #172, #91
  static Screen + #173, #3967
  static Screen + #174, #3967
  static Screen + #175, #3967
  static Screen + #176, #3967
  static Screen + #177, #3967
  static Screen + #178, #3967
  static Screen + #179, #3967
  static Screen + #180, #3967
  static Screen + #181, #3967
  static Screen + #182, #3967
  static Screen + #183, #3967
  static Screen + #184, #3967
  static Screen + #185, #3967
  static Screen + #186, #3967
  static Screen + #187, #91
  static Screen + #188, #3967
  static Screen + #189, #3967
  static Screen + #190, #3935
  static Screen + #191, #3935
  static Screen + #192, #3935
  static Screen + #193, #2139
  static Screen + #194, #2139
  static Screen + #195, #2139
  static Screen + #196, #2139
  static Screen + #197, #2139
  static Screen + #198, #3967
  static Screen + #199, #3967

  ;Linha 5
  static Screen + #200, #3967
  static Screen + #201, #3967
  static Screen + #202, #3885
  static Screen + #203, #3931
  static Screen + #204, #2895
  static Screen + #205, #2895
  static Screen + #206, #2895
  static Screen + #207, #3919
  static Screen + #208, #3885
  static Screen + #209, #3885
  static Screen + #210, #3931
  static Screen + #211, #3931
  static Screen + #212, #91
  static Screen + #213, #3967
  static Screen + #214, #3967
  static Screen + #215, #3967
  static Screen + #216, #3967
  static Screen + #217, #3967
  static Screen + #218, #3967
  static Screen + #219, #3967
  static Screen + #220, #3967
  static Screen + #221, #3967
  static Screen + #222, #3967
  static Screen + #223, #3967
  static Screen + #224, #3967
  static Screen + #225, #3967
  static Screen + #226, #3967
  static Screen + #227, #91
  static Screen + #228, #3967
  static Screen + #229, #3967
  static Screen + #230, #3935
  static Screen + #231, #3967
  static Screen + #232, #607
  static Screen + #233, #3935
  static Screen + #234, #3935
  static Screen + #235, #3935
  static Screen + #236, #3967
  static Screen + #237, #3967
  static Screen + #238, #606
  static Screen + #239, #3967

  ;Linha 6
  static Screen + #240, #3967
  static Screen + #241, #3967
  static Screen + #242, #3919
  static Screen + #243, #3919
  static Screen + #244, #3919
  static Screen + #245, #2941
  static Screen + #246, #3919
  static Screen + #247, #3919
  static Screen + #248, #3919
  static Screen + #249, #3967
  static Screen + #250, #3931
  static Screen + #251, #3931
  static Screen + #252, #91
  static Screen + #253, #3967
  static Screen + #254, #3967
  static Screen + #255, #3967
  static Screen + #256, #3967
  static Screen + #257, #3967
  static Screen + #258, #3967
  static Screen + #259, #3967
  static Screen + #260, #3967
  static Screen + #261, #3967
  static Screen + #262, #3967
  static Screen + #263, #3967
  static Screen + #264, #3967
  static Screen + #265, #3967
  static Screen + #266, #3967
  static Screen + #267, #91
  static Screen + #268, #3967
  static Screen + #269, #3935
  static Screen + #270, #3967
  static Screen + #271, #607
  static Screen + #272, #3967
  static Screen + #273, #3967
  static Screen + #274, #3967
  static Screen + #275, #3935
  static Screen + #276, #3967
  static Screen + #277, #3967
  static Screen + #278, #3967
  static Screen + #279, #606

  ;Linha 7
  static Screen + #280, #3967
  static Screen + #281, #3967
  static Screen + #282, #3919
  static Screen + #283, #3919
  static Screen + #284, #3919
  static Screen + #285, #3919
  static Screen + #286, #3919
  static Screen + #287, #3919
  static Screen + #288, #3885
  static Screen + #289, #3967
  static Screen + #290, #3931
  static Screen + #291, #3931
  static Screen + #292, #91
  static Screen + #293, #3967
  static Screen + #294, #3967
  static Screen + #295, #3967
  static Screen + #296, #3967
  static Screen + #297, #3967
  static Screen + #298, #3967
  static Screen + #299, #3967
  static Screen + #300, #3967
  static Screen + #301, #3967
  static Screen + #302, #3967
  static Screen + #303, #3967
  static Screen + #304, #3967
  static Screen + #305, #3967
  static Screen + #306, #3967
  static Screen + #307, #91
  static Screen + #308, #3935
  static Screen + #309, #3935
  static Screen + #310, #607
  static Screen + #311, #3967
  static Screen + #312, #3967
  static Screen + #313, #3967
  static Screen + #314, #3967
  static Screen + #315, #3935
  static Screen + #316, #3967
  static Screen + #317, #3967
  static Screen + #318, #3967
  static Screen + #319, #3967

  ;Linha 8
  static Screen + #320, #3967
  static Screen + #321, #3967
  static Screen + #322, #3967
  static Screen + #323, #3967
  static Screen + #324, #3919
  static Screen + #325, #3919
  static Screen + #326, #3885
  static Screen + #327, #3967
  static Screen + #328, #3967
  static Screen + #329, #3967
  static Screen + #330, #3967
  static Screen + #331, #3931
  static Screen + #332, #91
  static Screen + #333, #3967
  static Screen + #334, #3967
  static Screen + #335, #3967
  static Screen + #336, #3967
  static Screen + #337, #3967
  static Screen + #338, #3967
  static Screen + #339, #3967
  static Screen + #340, #3967
  static Screen + #341, #3967
  static Screen + #342, #3967
  static Screen + #343, #3967
  static Screen + #344, #3967
  static Screen + #345, #3967
  static Screen + #346, #3967
  static Screen + #347, #91
  static Screen + #348, #3967
  static Screen + #349, #3967
  static Screen + #350, #3967
  static Screen + #351, #3967
  static Screen + #352, #3967
  static Screen + #353, #3967
  static Screen + #354, #3967
  static Screen + #355, #3967
  static Screen + #356, #3967
  static Screen + #357, #3967
  static Screen + #358, #3967
  static Screen + #359, #3967

  ;Linha 9
  static Screen + #360, #3967
  static Screen + #361, #3967
  static Screen + #362, #3967
  static Screen + #363, #3967
  static Screen + #364, #3967
  static Screen + #365, #3967
  static Screen + #366, #3967
  static Screen + #367, #3967
  static Screen + #368, #3967
  static Screen + #369, #3967
  static Screen + #370, #3967
  static Screen + #371, #3931
  static Screen + #372, #91
  static Screen + #373, #3967
  static Screen + #374, #3967
  static Screen + #375, #3967
  static Screen + #376, #3967
  static Screen + #377, #3967
  static Screen + #378, #3967
  static Screen + #379, #3967
  static Screen + #380, #3967
  static Screen + #381, #3967
  static Screen + #382, #3967
  static Screen + #383, #3967
  static Screen + #384, #3967
  static Screen + #385, #3967
  static Screen + #386, #3967
  static Screen + #387, #91
  static Screen + #388, #3967
  static Screen + #389, #3967
  static Screen + #390, #3967
  static Screen + #391, #3967
  static Screen + #392, #3967
  static Screen + #393, #3967
  static Screen + #394, #2095
  static Screen + #395, #2139
  static Screen + #396, #2140
  static Screen + #397, #3967
  static Screen + #398, #3967
  static Screen + #399, #3967

  ;Linha 10
  static Screen + #400, #3967
  static Screen + #401, #3967
  static Screen + #402, #3967
  static Screen + #403, #3967
  static Screen + #404, #3967
  static Screen + #405, #3967
  static Screen + #406, #3967
  static Screen + #407, #3967
  static Screen + #408, #3967
  static Screen + #409, #3967
  static Screen + #410, #3967
  static Screen + #411, #3931
  static Screen + #412, #91
  static Screen + #413, #3967
  static Screen + #414, #3967
  static Screen + #415, #3967
  static Screen + #416, #3967
  static Screen + #417, #3967
  static Screen + #418, #3967
  static Screen + #419, #3967
  static Screen + #420, #3967
  static Screen + #421, #3967
  static Screen + #422, #3967
  static Screen + #423, #3967
  static Screen + #424, #3967
  static Screen + #425, #3967
  static Screen + #426, #3967
  static Screen + #427, #91
  static Screen + #428, #3967
  static Screen + #429, #3967
  static Screen + #430, #3967
  static Screen + #431, #3967
  static Screen + #432, #3967
  static Screen + #433, #3967
  static Screen + #434, #2139
  static Screen + #435, #91
  static Screen + #436, #2139
  static Screen + #437, #3967
  static Screen + #438, #3967
  static Screen + #439, #3967

  ;Linha 11
  static Screen + #440, #3967
  static Screen + #441, #3967
  static Screen + #442, #3967
  static Screen + #443, #3967
  static Screen + #444, #3967
  static Screen + #445, #3967
  static Screen + #446, #3967
  static Screen + #447, #3967
  static Screen + #448, #3967
  static Screen + #449, #3967
  static Screen + #450, #3967
  static Screen + #451, #3931
  static Screen + #452, #91
  static Screen + #453, #3967
  static Screen + #454, #3967
  static Screen + #455, #3967
  static Screen + #456, #3967
  static Screen + #457, #3967
  static Screen + #458, #3967
  static Screen + #459, #3967
  static Screen + #460, #3967
  static Screen + #461, #3967
  static Screen + #462, #3967
  static Screen + #463, #3967
  static Screen + #464, #3967
  static Screen + #465, #3967
  static Screen + #466, #3967
  static Screen + #467, #91
  static Screen + #468, #3967
  static Screen + #469, #3967
  static Screen + #470, #3967
  static Screen + #471, #3967
  static Screen + #472, #3967
  static Screen + #473, #3931
  static Screen + #474, #2139
  static Screen + #475, #2139
  static Screen + #476, #2139
  static Screen + #477, #3967
  static Screen + #478, #3967
  static Screen + #479, #3967

  ;Linha 12
  static Screen + #480, #3967
  static Screen + #481, #3967
  static Screen + #482, #3967
  static Screen + #483, #3967
  static Screen + #484, #3967
  static Screen + #485, #3967
  static Screen + #486, #3967
  static Screen + #487, #3967
  static Screen + #488, #3967
  static Screen + #489, #3967
  static Screen + #490, #3967
  static Screen + #491, #3931
  static Screen + #492, #91
  static Screen + #493, #3967
  static Screen + #494, #3967
  static Screen + #495, #3967
  static Screen + #496, #3967
  static Screen + #497, #3967
  static Screen + #498, #3967
  static Screen + #499, #3967
  static Screen + #500, #3967
  static Screen + #501, #3967
  static Screen + #502, #3967
  static Screen + #503, #3967
  static Screen + #504, #3967
  static Screen + #505, #3967
  static Screen + #506, #3967
  static Screen + #507, #91
  static Screen + #508, #3967
  static Screen + #509, #3967
  static Screen + #510, #3967
  static Screen + #511, #3967
  static Screen + #512, #3967
  static Screen + #513, #3931
  static Screen + #514, #2139
  static Screen + #515, #91
  static Screen + #516, #2139
  static Screen + #517, #3967
  static Screen + #518, #3967
  static Screen + #519, #3967

  ;Linha 13
  static Screen + #520, #3967
  static Screen + #521, #3967
  static Screen + #522, #3967
  static Screen + #523, #3967
  static Screen + #524, #3967
  static Screen + #525, #3967
  static Screen + #526, #3967
  static Screen + #527, #3967
  static Screen + #528, #3967
  static Screen + #529, #3967
  static Screen + #530, #3967
  static Screen + #531, #3931
  static Screen + #532, #91
  static Screen + #533, #3967
  static Screen + #534, #3967
  static Screen + #535, #3967
  static Screen + #536, #3967
  static Screen + #537, #3967
  static Screen + #538, #3967
  static Screen + #539, #3967
  static Screen + #540, #3967
  static Screen + #541, #3967
  static Screen + #542, #3967
  static Screen + #543, #3967
  static Screen + #544, #3967
  static Screen + #545, #3967
  static Screen + #546, #3967
  static Screen + #547, #91
  static Screen + #548, #3967
  static Screen + #549, #3967
  static Screen + #550, #3967
  static Screen + #551, #3967
  static Screen + #552, #3967
  static Screen + #553, #3931
  static Screen + #554, #2139
  static Screen + #555, #91
  static Screen + #556, #2139
  static Screen + #557, #3931
  static Screen + #558, #3967
  static Screen + #559, #3967

  ;Linha 14
  static Screen + #560, #3967
  static Screen + #561, #3967
  static Screen + #562, #3967
  static Screen + #563, #3967
  static Screen + #564, #3967
  static Screen + #565, #3967
  static Screen + #566, #3967
  static Screen + #567, #3967
  static Screen + #568, #3967
  static Screen + #569, #3967
  static Screen + #570, #3967
  static Screen + #571, #3931
  static Screen + #572, #91
  static Screen + #573, #3967
  static Screen + #574, #3967
  static Screen + #575, #3967
  static Screen + #576, #3967
  static Screen + #577, #3967
  static Screen + #578, #3967
  static Screen + #579, #3967
  static Screen + #580, #3967
  static Screen + #581, #3967
  static Screen + #582, #3967
  static Screen + #583, #3967
  static Screen + #584, #3967
  static Screen + #585, #3967
  static Screen + #586, #3931
  static Screen + #587, #91
  static Screen + #588, #3967
  static Screen + #589, #3967
  static Screen + #590, #3967
  static Screen + #591, #3967
  static Screen + #592, #3967
  static Screen + #593, #2095
  static Screen + #594, #2139
  static Screen + #595, #2139
  static Screen + #596, #2139
  static Screen + #597, #2140
  static Screen + #598, #3967
  static Screen + #599, #3967

  ;Linha 15
  static Screen + #600, #3967
  static Screen + #601, #3967
  static Screen + #602, #3967
  static Screen + #603, #3967
  static Screen + #604, #3967
  static Screen + #605, #3967
  static Screen + #606, #3967
  static Screen + #607, #3967
  static Screen + #608, #3967
  static Screen + #609, #3967
  static Screen + #610, #3967
  static Screen + #611, #3931
  static Screen + #612, #91
  static Screen + #613, #3967
  static Screen + #614, #3967
  static Screen + #615, #3967
  static Screen + #616, #3967
  static Screen + #617, #3967
  static Screen + #618, #3967
  static Screen + #619, #3967
  static Screen + #620, #3967
  static Screen + #621, #3967
  static Screen + #622, #3967
  static Screen + #623, #3967
  static Screen + #624, #3967
  static Screen + #625, #3967
  static Screen + #626, #3931
  static Screen + #627, #91
  static Screen + #628, #3967
  static Screen + #629, #3967
  static Screen + #630, #3967
  static Screen + #631, #3967
  static Screen + #632, #2095
  static Screen + #633, #2139
  static Screen + #634, #2139
  static Screen + #635, #91
  static Screen + #636, #2139
  static Screen + #637, #2139
  static Screen + #638, #2140
  static Screen + #639, #3967

  ;Linha 16
  static Screen + #640, #3967
  static Screen + #641, #3967
  static Screen + #642, #3967
  static Screen + #643, #3967
  static Screen + #644, #3967
  static Screen + #645, #3967
  static Screen + #646, #3967
  static Screen + #647, #3967
  static Screen + #648, #3967
  static Screen + #649, #3967
  static Screen + #650, #3967
  static Screen + #651, #3931
  static Screen + #652, #91
  static Screen + #653, #3967
  static Screen + #654, #3967
  static Screen + #655, #3967
  static Screen + #656, #3967
  static Screen + #657, #3967
  static Screen + #658, #3967
  static Screen + #659, #3967
  static Screen + #660, #3967
  static Screen + #661, #3967
  static Screen + #662, #3967
  static Screen + #663, #3967
  static Screen + #664, #3967
  static Screen + #665, #3967
  static Screen + #666, #3931
  static Screen + #667, #91
  static Screen + #668, #3967
  static Screen + #669, #3967
  static Screen + #670, #3967
  static Screen + #671, #3967
  static Screen + #672, #3967
  static Screen + #673, #3967
  static Screen + #674, #2139
  static Screen + #675, #2139
  static Screen + #676, #2139
  static Screen + #677, #3967
  static Screen + #678, #3967
  static Screen + #679, #3967

  ;Linha 17
  static Screen + #680, #3967
  static Screen + #681, #3967
  static Screen + #682, #3967
  static Screen + #683, #3967
  static Screen + #684, #3967
  static Screen + #685, #3967
  static Screen + #686, #3967
  static Screen + #687, #3967
  static Screen + #688, #3967
  static Screen + #689, #3967
  static Screen + #690, #3967
  static Screen + #691, #3931
  static Screen + #692, #91
  static Screen + #693, #3967
  static Screen + #694, #3967
  static Screen + #695, #3967
  static Screen + #696, #3967
  static Screen + #697, #3967
  static Screen + #698, #3967
  static Screen + #699, #3967
  static Screen + #700, #3967
  static Screen + #701, #3967
  static Screen + #702, #3967
  static Screen + #703, #3967
  static Screen + #704, #3967
  static Screen + #705, #3967
  static Screen + #706, #3931
  static Screen + #707, #91
  static Screen + #708, #3967
  static Screen + #709, #3967
  static Screen + #710, #3967
  static Screen + #711, #3967
  static Screen + #712, #3967
  static Screen + #713, #3967
  static Screen + #714, #2139
  static Screen + #715, #91
  static Screen + #716, #2139
  static Screen + #717, #3967
  static Screen + #718, #3967
  static Screen + #719, #3967

  ;Linha 18
  static Screen + #720, #3967
  static Screen + #721, #3967
  static Screen + #722, #3967
  static Screen + #723, #3967
  static Screen + #724, #3967
  static Screen + #725, #3967
  static Screen + #726, #3967
  static Screen + #727, #3967
  static Screen + #728, #3967
  static Screen + #729, #3967
  static Screen + #730, #3967
  static Screen + #731, #3931
  static Screen + #732, #91
  static Screen + #733, #3967
  static Screen + #734, #3967
  static Screen + #735, #3967
  static Screen + #736, #3967
  static Screen + #737, #3967
  static Screen + #738, #3967
  static Screen + #739, #3967
  static Screen + #740, #3967
  static Screen + #741, #3967
  static Screen + #742, #3967
  static Screen + #743, #3967
  static Screen + #744, #3967
  static Screen + #745, #3967
  static Screen + #746, #3931
  static Screen + #747, #91
  static Screen + #748, #3967
  static Screen + #749, #3967
  static Screen + #750, #3967
  static Screen + #751, #3967
  static Screen + #752, #3967
  static Screen + #753, #3967
  static Screen + #754, #2139
  static Screen + #755, #2139
  static Screen + #756, #2139
  static Screen + #757, #3967
  static Screen + #758, #3967
  static Screen + #759, #3967

  ;Linha 19
  static Screen + #760, #3967
  static Screen + #761, #3967
  static Screen + #762, #3967
  static Screen + #763, #3967
  static Screen + #764, #3967
  static Screen + #765, #3967
  static Screen + #766, #3967
  static Screen + #767, #3967
  static Screen + #768, #3967
  static Screen + #769, #3967
  static Screen + #770, #3931
  static Screen + #771, #3967
  static Screen + #772, #91
  static Screen + #773, #3967
  static Screen + #774, #3967
  static Screen + #775, #3967
  static Screen + #776, #3967
  static Screen + #777, #3967
  static Screen + #778, #3967
  static Screen + #779, #3967
  static Screen + #780, #3967
  static Screen + #781, #3967
  static Screen + #782, #3967
  static Screen + #783, #3967
  static Screen + #784, #3967
  static Screen + #785, #3967
  static Screen + #786, #3967
  static Screen + #787, #91
  static Screen + #788, #3967
  static Screen + #789, #3967
  static Screen + #790, #3967
  static Screen + #791, #3967
  static Screen + #792, #3967
  static Screen + #793, #3967
  static Screen + #794, #2139
  static Screen + #795, #2139
  static Screen + #796, #2139
  static Screen + #797, #3967
  static Screen + #798, #3967
  static Screen + #799, #3967

  ;Linha 20
  static Screen + #800, #3967
  static Screen + #801, #3967
  static Screen + #802, #3967
  static Screen + #803, #3967
  static Screen + #804, #3967
  static Screen + #805, #3967
  static Screen + #806, #3967
  static Screen + #807, #3967
  static Screen + #808, #3967
  static Screen + #809, #3967
  static Screen + #810, #3967
  static Screen + #811, #3967
  static Screen + #812, #91
  static Screen + #813, #3967
  static Screen + #814, #3967
  static Screen + #815, #3967
  static Screen + #816, #3967
  static Screen + #817, #3967
  static Screen + #818, #3967
  static Screen + #819, #3967
  static Screen + #820, #3967
  static Screen + #821, #3967
  static Screen + #822, #3967
  static Screen + #823, #3967
  static Screen + #824, #3967
  static Screen + #825, #3967
  static Screen + #826, #3967
  static Screen + #827, #91
  static Screen + #828, #3967
  static Screen + #829, #3967
  static Screen + #830, #3967
  static Screen + #831, #3967
  static Screen + #832, #3967
  static Screen + #833, #3967
  static Screen + #834, #3931
  static Screen + #835, #2395
  static Screen + #836, #3967
  static Screen + #837, #3967
  static Screen + #838, #3967
  static Screen + #839, #3967

  ;Linha 21
  static Screen + #840, #3967
  static Screen + #841, #3967
  static Screen + #842, #3967
  static Screen + #843, #3967
  static Screen + #844, #3967
  static Screen + #845, #3967
  static Screen + #846, #3967
  static Screen + #847, #3967
  static Screen + #848, #3967
  static Screen + #849, #3967
  static Screen + #850, #3967
  static Screen + #851, #3967
  static Screen + #852, #91
  static Screen + #853, #3967
  static Screen + #854, #3967
  static Screen + #855, #3967
  static Screen + #856, #3967
  static Screen + #857, #3967
  static Screen + #858, #3967
  static Screen + #859, #3967
  static Screen + #860, #3967
  static Screen + #861, #3967
  static Screen + #862, #3967
  static Screen + #863, #3967
  static Screen + #864, #3967
  static Screen + #865, #3967
  static Screen + #866, #3967
  static Screen + #867, #91
  static Screen + #868, #3967
  static Screen + #869, #3967
  static Screen + #870, #3967
  static Screen + #871, #3967
  static Screen + #872, #3967
  static Screen + #873, #3967
  static Screen + #874, #3967
  static Screen + #875, #3967
  static Screen + #876, #3967
  static Screen + #877, #3967
  static Screen + #878, #3967
  static Screen + #879, #3967

  ;Linha 22
  static Screen + #880, #3967
  static Screen + #881, #3967
  static Screen + #882, #3967
  static Screen + #883, #3967
  static Screen + #884, #3967
  static Screen + #885, #3967
  static Screen + #886, #3967
  static Screen + #887, #3967
  static Screen + #888, #3967
  static Screen + #889, #3967
  static Screen + #890, #3967
  static Screen + #891, #3967
  static Screen + #892, #91
  static Screen + #893, #3967
  static Screen + #894, #3967
  static Screen + #895, #3967
  static Screen + #896, #3967
  static Screen + #897, #3967
  static Screen + #898, #3967
  static Screen + #899, #3967
  static Screen + #900, #3967
  static Screen + #901, #3967
  static Screen + #902, #3967
  static Screen + #903, #3967
  static Screen + #904, #3931
  static Screen + #905, #3967
  static Screen + #906, #3967
  static Screen + #907, #91
  static Screen + #908, #3967
  static Screen + #909, #3967
  static Screen + #910, #3967
  static Screen + #911, #3967
  static Screen + #912, #3967
  static Screen + #913, #3967
  static Screen + #914, #3967
  static Screen + #915, #3967
  static Screen + #916, #3967
  static Screen + #917, #3967
  static Screen + #918, #3967
  static Screen + #919, #3967

  ;Linha 23
  static Screen + #920, #3967
  static Screen + #921, #3967
  static Screen + #922, #3967
  static Screen + #923, #3967
  static Screen + #924, #3967
  static Screen + #925, #3967
  static Screen + #926, #3967
  static Screen + #927, #3967
  static Screen + #928, #3967
  static Screen + #929, #3967
  static Screen + #930, #3967
  static Screen + #931, #3967
  static Screen + #932, #91
  static Screen + #933, #3931
  static Screen + #934, #3931
  static Screen + #935, #3931
  static Screen + #936, #3931
  static Screen + #937, #3931
  static Screen + #938, #3931
  static Screen + #939, #3931
  static Screen + #940, #3931
  static Screen + #941, #3931
  static Screen + #942, #3931
  static Screen + #943, #3931
  static Screen + #944, #3931
  static Screen + #945, #3967
  static Screen + #946, #3967
  static Screen + #947, #91
  static Screen + #948, #3967
  static Screen + #949, #3967
  static Screen + #950, #3967
  static Screen + #951, #3967
  static Screen + #952, #3967
  static Screen + #953, #3967
  static Screen + #954, #3967
  static Screen + #955, #3967
  static Screen + #956, #3967
  static Screen + #957, #3967
  static Screen + #958, #3967
  static Screen + #959, #3967

  ;Linha 24
  static Screen + #960, #3967
  static Screen + #961, #3967
  static Screen + #962, #3967
  static Screen + #963, #3967
  static Screen + #964, #3967
  static Screen + #965, #3967
  static Screen + #966, #3967
  static Screen + #967, #3967
  static Screen + #968, #3967
  static Screen + #969, #3967
  static Screen + #970, #3967
  static Screen + #971, #3967
  static Screen + #972, #91
  static Screen + #973, #3967
  static Screen + #974, #3967
  static Screen + #975, #3967
  static Screen + #976, #3967
  static Screen + #977, #3931
  static Screen + #978, #3840
  static Screen + #979, #3840
  static Screen + #980, #3840
  static Screen + #981, #3931
  static Screen + #982, #3931
  static Screen + #983, #3967
  static Screen + #984, #3967
  static Screen + #985, #3967
  static Screen + #986, #3967
  static Screen + #987, #91
  static Screen + #988, #3967
  static Screen + #989, #3967
  static Screen + #990, #3967
  static Screen + #991, #3967
  static Screen + #992, #3967
  static Screen + #993, #3967
  static Screen + #994, #3967
  static Screen + #995, #3967
  static Screen + #996, #3967
  static Screen + #997, #3967
  static Screen + #998, #3967
  static Screen + #999, #3967

  ;Linha 25
  static Screen + #1000, #3967
  static Screen + #1001, #3967
  static Screen + #1002, #3967
  static Screen + #1003, #3967
  static Screen + #1004, #3967
  static Screen + #1005, #3967
  static Screen + #1006, #3967
  static Screen + #1007, #3967
  static Screen + #1008, #3967
  static Screen + #1009, #3967
  static Screen + #1010, #3967
  static Screen + #1011, #3967
  static Screen + #1012, #91
  static Screen + #1013, #3840
  static Screen + #1014, #3840
  static Screen + #1015, #3840
  static Screen + #1016, #3840
  static Screen + #1017, #3840
  static Screen + #1018, #3840
  static Screen + #1019, #3840
  static Screen + #1020, #3840
  static Screen + #1021, #3840
  static Screen + #1022, #3840
  static Screen + #1023, #3840
  static Screen + #1024, #3840
  static Screen + #1025, #3840
  static Screen + #1026, #3840
  static Screen + #1027, #91
  static Screen + #1028, #3931
  static Screen + #1029, #3967
  static Screen + #1030, #3967
  static Screen + #1031, #3967
  static Screen + #1032, #3967
  static Screen + #1033, #3967
  static Screen + #1034, #3967
  static Screen + #1035, #3967
  static Screen + #1036, #3967
  static Screen + #1037, #3967
  static Screen + #1038, #3967
  static Screen + #1039, #3967

  ;Linha 26
  static Screen + #1040, #3967
  static Screen + #1041, #3967
  static Screen + #1042, #3967
  static Screen + #1043, #3967
  static Screen + #1044, #3967
  static Screen + #1045, #3967
  static Screen + #1046, #3967
  static Screen + #1047, #3967
  static Screen + #1048, #3967
  static Screen + #1049, #3967
  static Screen + #1050, #3967
  static Screen + #1051, #3967
  static Screen + #1052, #91
  static Screen + #1053, #91
  static Screen + #1054, #91
  static Screen + #1055, #91
  static Screen + #1056, #91
  static Screen + #1057, #91
  static Screen + #1058, #91
  static Screen + #1059, #91
  static Screen + #1060, #91
  static Screen + #1061, #91
  static Screen + #1062, #91
  static Screen + #1063, #91
  static Screen + #1064, #91
  static Screen + #1065, #91
  static Screen + #1066, #91
  static Screen + #1067, #91
  static Screen + #1068, #3967
  static Screen + #1069, #3967
  static Screen + #1070, #3967
  static Screen + #1071, #3967
  static Screen + #1072, #3967
  static Screen + #1073, #3967
  static Screen + #1074, #3967
  static Screen + #1075, #3967
  static Screen + #1076, #3967
  static Screen + #1077, #3967
  static Screen + #1078, #3967
  static Screen + #1079, #3967

  ;Linha 27
  static Screen + #1080, #3967
  static Screen + #1081, #3967
  static Screen + #1082, #3967
  static Screen + #1083, #3967
  static Screen + #1084, #3967
  static Screen + #1085, #3967
  static Screen + #1086, #3967
  static Screen + #1087, #3967
  static Screen + #1088, #3967
  static Screen + #1089, #3967
  static Screen + #1090, #3967
  static Screen + #1091, #3967
  static Screen + #1092, #3931
  static Screen + #1093, #3931
  static Screen + #1094, #3931
  static Screen + #1095, #3931
  static Screen + #1096, #3931
  static Screen + #1097, #3931
  static Screen + #1098, #3931
  static Screen + #1099, #3931
  static Screen + #1100, #3931
  static Screen + #1101, #3931
  static Screen + #1102, #3967
  static Screen + #1103, #3967
  static Screen + #1104, #3967
  static Screen + #1105, #3967
  static Screen + #1106, #3967
  static Screen + #1107, #3967
  static Screen + #1108, #3967
  static Screen + #1109, #3967
  static Screen + #1110, #3967
  static Screen + #1111, #3967
  static Screen + #1112, #3967
  static Screen + #1113, #3967
  static Screen + #1114, #1883
  static Screen + #1115, #1883
  static Screen + #1116, #1883
  static Screen + #1117, #3967
  static Screen + #1118, #3967
  static Screen + #1119, #3967

  ;Linha 28
  static Screen + #1120, #73
  static Screen + #1121, #67
  static Screen + #1122, #77
  static Screen + #1123, #67
  static Screen + #1124, #3967
  static Screen + #1125, #3967
  static Screen + #1126, #3967
  static Screen + #1127, #3967
  static Screen + #1128, #3967
  static Screen + #1129, #3967
  static Screen + #1130, #3967
  static Screen + #1131, #3967
  static Screen + #1132, #2387
  static Screen + #1133, #2371
  static Screen + #1134, #2383
  static Screen + #1135, #2386
  static Screen + #1136, #2373
  static Screen + #1137, #2362
  static Screen + #1138, #3967
  static Screen + #1139, #3967
  static Screen + #1140, #3967
  static Screen + #1141, #3967
  static Screen + #1142, #3967
  static Screen + #1143, #3967
  static Screen + #1144, #3967
  static Screen + #1145, #3967
  static Screen + #1146, #3967
  static Screen + #1147, #3931
  static Screen + #1148, #3931
  static Screen + #1149, #3967
  static Screen + #1150, #3967
  static Screen + #1151, #3967
  static Screen + #1152, #3967
  static Screen + #1153, #2139
  static Screen + #1154, #2139
  static Screen + #1155, #2139
  static Screen + #1156, #2139
  static Screen + #1157, #2139
  static Screen + #1158, #3967
  static Screen + #1159, #3967

  ;Linha 29
  static Screen + #1160, #2907
  static Screen + #1161, #2907
  static Screen + #1162, #2907
  static Screen + #1163, #2907
  static Screen + #1164, #2907
  static Screen + #1165, #2907
  static Screen + #1166, #2907
  static Screen + #1167, #2907
  static Screen + #1168, #2907
  static Screen + #1169, #2907
  static Screen + #1170, #2907
  static Screen + #1171, #2907
  static Screen + #1172, #2907
  static Screen + #1173, #2907
  static Screen + #1174, #2907
  static Screen + #1175, #2907
  static Screen + #1176, #2907
  static Screen + #1177, #2907
  static Screen + #1178, #2907
  static Screen + #1179, #2907
  static Screen + #1180, #2907
  static Screen + #1181, #2907
  static Screen + #1182, #2907
  static Screen + #1183, #2907
  static Screen + #1184, #2907
  static Screen + #1185, #2907
  static Screen + #1186, #2907
  static Screen + #1187, #2907
  static Screen + #1188, #2907
  static Screen + #1189, #2907
  static Screen + #1190, #2907
  static Screen + #1191, #2907
  static Screen + #1192, #2907
  static Screen + #1193, #2907
  static Screen + #1194, #2907
  static Screen + #1195, #2907
  static Screen + #1196, #2907
  static Screen + #1197, #2907
  static Screen + #1198, #2907
  static Screen + #1199, #2907

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
	
	;cenario
	call printScreenScreen

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

    call Checa_descida
    
    
    pop fr
    pop r0
    pop r1
    
    jmp Start_here
        
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

        loadn r0, #Peca ;checa se tem problema com a border
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

Inicia_vetor_grid:;assinala o valor 0 para todos os elementos do vetor grid
				
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
    
;---------------------- TELAS --------------------------

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
		rts
             
ApagaPosicaoTela:
    push r0
    push r1
    
    loadn r1, #' '
    outchar r1, r2
    
    pop r1
    pop r0
    rts
    
ApagaLinhaTela:

    push r1
    push r2
    
    load r2, PosInicialApagarTela
    load r1, PosMaximoApagarTela
    
ApagaPosicaoTelaLoop:

    call ApagaPosicaoTela
    
    inc r2
    cmp r1, r2
    jne ApagaPosicaoTelaLoop
    
    pop r2
    pop r1
    
    rts
    
VerificaTodasLinhasPreenchidas:
    
    push r6
    push r7
    push r5
    push r4
    push r3
    push r1
    push r0
    
    load r2, PosInicialApagarTelaFixa
    load r1, PosInicialApagarTela
    
    loadn r0, #880
    sub r2, r2, r0
    
SubtraiPosicoes:
    
        loadn r0, #40
        call VerificaLinhaPreenchida
        
        load r1, PosInicialApagarGrid
        sub r1, r1, r0
        store PosInicialApagarGrid, r1
        
        load r1, PosInicialApagarGridMaximo
        sub r1, r1, r0
        store PosInicialApagarGridMaximo, r1
        
        load r1, PosMaximoApagarTela
        sub r1, r1, r0
        store PosMaximoApagarTela, r1
        
        load r1, PosInicialApagarTela
        sub r1, r1, r0
        store PosInicialApagarTela, r1
        
        cmp r2, r1
        cne SubtraiPosicoes
    
VerificaTodasLinhasPreenchidasReturn:
    
    loadn r0, #880
    add r2, r2, r0
    
    ;AtualizaGridTelaLoop:
    
    ;call VerificaAbaixoGrid
    ;call VerificaAbaixoTela
    
    ;load r1, PosInicialApagarTela
    
    ;cmp r1, r2
        ;jne AtualizaGridTelaLoop
    
    ;;retorna valores para iniciais
    load r0, PosInicialApagarGridFixa
    store PosInicialApagarGrid, r0
    
    load r0, PosInicialApagarTelaFixa
    store PosInicialApagarTela, r0
    
    load r0, PosInicialApagarGridMaximoFixa
    store PosInicialApagarGridMaximo, r0
    
    load r0, PosMaximoApagarTelaFixa
    store PosMaximoApagarTela, r0
    
    
    pop r0
    pop r1
    pop r3
    pop r4
    pop r5
    pop r7
    pop r6
    
    rts
    
VerificaAbaixoGrid:

    push fr
    push r0
    push r2
    push r3
    push r1
    push r4
    push r5
    
    load r0, PosInicialApagarGrid
    load r2, PosInicialApagarGridMaximo
    loadn r1, #40
    loadn r3, #0
    
    add r4, r0, r2

AtualizaGridLinhaSuperior:
            
        loadi r5, r4
        cmp r5, r3
        jeq CampoNVazioAbaixo
        
        storei r4, r3
        
        CampoNVazioAbaixo:
        inc r0
        inc r4
        cmp r2, r0
        jne AtualizaGridZeraLinha
    
        add r0, r0, r3
        store PosInicialApagarGrid, r0
        
        pop r5
        pop r4
        pop r1
        pop r3
        pop r2
        pop r0
        pop fr
    
        rts
    
VerificaAbaixoTela:

    push fr
    push r0
    push r2
    push r3
    push r1
    push r4
    push r5
    
    load r0, PosInicialApagarTela
    load r2, PosMaximoApagarTela
    
    loadn r1, #40
    loadn r3, #'A'
    loadn r7, #' '
    
    add r4, r0, r2

    AtualizaTelaLinhaSuperior:
            
        loadi r5, r4
        cmp r5, r3
        jeq TelaNVazioAbaixo
        
        outchar r4, r3
        outchar r0, r7
        
        TelaNVazioAbaixo:
        inc r0
        inc r4
        cmp r2, r0
        jne AtualizaTelaLinhaSuperior
    
    add r0, r0, r3
    store PosInicialApagarTela, r0
    
    pop r5
    pop r4
    pop r1
    pop r3
    pop r2
    pop r0
    pop fr
    
    rts
     
VerificaLinhaPreenchida:

    push r6
    push r7
    push r5
    push r4
    push r3
    push r0
    
    load r7, PosInicialApagarGrid
    load r3, PosInicialApagarGrid
    load r6, PosInicialApagarGridMaximo
    
    
    VerificaLinhaPreenchidaLoop:
    loadn r5, #1
    inc r3
    
    cmp r3, r6
    jeq FimVerificaLinhaPreenchida
    
    
    loadi r4, r3
    
    cmp r4, r5
        jeq VerificaLinhaPreenchidaLoop
    
    cmp r4, r5
        jne FimVerificaLinhaPreenchida
    
    
    cmp r3, r6
        jne VerificaLinhaPreenchida
      
FimVerificaLinhaPreenchida:
    cmp r4, r5
    jne FimVerificaLinhaPreenchidaNMudanca
    
    ceq ApagaLinhaTela
    ceq ApagaLinhaDoGrid

FimVerificaLinhaPreenchidaNMudanca:
    pop r0
    pop r3
    pop r4
    pop r5
    pop r7
    pop r6
    
    rts
    
ApagaLinhaDoGrid:

    push fr
    push r0
    push r2
    push r3


    load r0, PosInicialApagarGrid
    load r2, PosInicialApagarGridMaximo
    loadn r3, #0

AtualizaGridZeraLinha:
            
        storei r0, r3

        inc r0
        cmp r2, r0
        jne AtualizaGridZeraLinha
    
    
        pop r3
        pop r2
        pop r0
        pop fr
        
        rts
    
SavePosicoesIniciaisTelaGrid:

    push fr
    push r7
    push r6
    push r5

    loadn r6, #Grid
    
    loadn r5, #8
    loadn r7, #1004
    
    add r7, r7, r6
    store PosInicialApagarTela, r7
    store PosInicialApagarTelaFixa, r7
    
    add r5, r5, r7
    store PosInicialApagarGrid, r5
    store PosInicialApagarGridFixa, r5
    
    loadn r5, #8
    loadn r7, #1020
    
    add r7, r7, r6
    store PosMaximoApagarTela, r7
    store PosMaximoApagarTelaFixa, r7
    
    add r5, r5, r7
    store PosInicialApagarGridMaximo, r5
    store PosInicialApagarGridMaximoFixa, r5
    
    
    pop r5
    pop r6
    pop r7
    pop fr
    rts
	
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
        
printScreenScreen:
  push r0
  push r1
  push r2
  push r3

  loadn r0, #Screen
  loadn r1, #0
  loadn r2, #1200

printScreenScreenLoop:

    add r3,r0,r1
    loadi r3, r3
    outchar r3, r1
    inc r1
    cmp r1, r2

    jne printScreenScreenLoop

    pop r3
    pop r2
    pop r1
    pop r0
    rts
	
;--------------------------- TELAS ----------------------------


Tela7Linha0  : string "                                        "
Tela7Linha1  : string "               INSTRUCOES               "
Tela7Linha2  : string "                                        "
Tela7Linha3  : string "                                        "
Tela7Linha4  : string "       ORG ARQ DE COMPUTADORES 2022     "
Tela7Linha5  : string "    ORG DE COMPUTADORES DIGITAIS 2021   "
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
