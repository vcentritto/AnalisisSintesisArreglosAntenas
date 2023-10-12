function[colorLaxpati,colornulos,colorcurva] = fColoresLaxpati

% ¿CUÁLES MÓDULOS USAN LA FUNCIÓN fColoresLaxpati?
%   - Todos los módulos usados para arreglos lineales

% ¿QUÉ SE PUEDE ENCONTRAR EN LA FUNCIÓN fColoresLaxpati?
%   Vectores de colores RGB para graficar el diagrama de radiación y sus
%   características más importantes.

% ¿CUÁLES SON LOS PARÁMETROS DE ENTRADA? 
%   La función no necesita parámetros de entrada

% ¿CUÁLES SON LOS PARÁMETROS DE SALIDA? 
%     colorDUniforme ----------------------------> Matriz de colores RGB
%     para diagrama de radiación 3D.
%     colorminimosuniforme ----------------------------> Vector de colores
%     RGB para mínimos en diagrama de radiación 3D.
%     colormaximosuniforme ----------------------------> Vector de colores
%     RGB para máximos en diagrama de radiación 3D.
%     coloranchohazuniforme ----------------------------> Vector de colores
%     RGB para ancho de haz a -3 dB en diagrama de radiación 3D.
%     colorlpuniforme ----------------------------> Vector de colores
%     RGB para máximo principal en diagrama de radiación 3D.
%     colorminimos3dB ----------------------------> Vector de colores
%     RGB para mínimos en diagrama de radiación 2D.
%     coloranchohaz3dB ----------------------------> Vector de colores
%     RGB para ancho de haz a -3 dB en diagrama de radiación 2D.
%     curvaCorteTheta ----------------------------> Vector de colores
%     RGB para curva 2D con corte específico en Theta.
%     minimosCorteTheta ----------------------------> Vector de colores
%     RGB para mínimos en curva 2D con corte específico en Theta.
%     curvaCortePhi ----------------------------> Vector de colores
%     RGB para curva 2D con corte específico en Phi.
%     minimosCortePhi ----------------------------> Vector de colores
%     RGB para mínimos en curva 2D con corte específico en Phi.

%Color Gráfica 3D
colorLaxpati =  1/255.*[233 246 246
                        231 246 246
                        228 245 245
                        226 244 244
                        223 243 243
                        221 242 242
                        219 241 241
                        216 240 240
                        214 239 239
                        211 238 238
                        209 237 237
                        207 236 236
                        204 235 235
                        202 234 234
                        199 233 233
                        197 232 232
                        194 231 231
                        192 230 230
                        190 229 229
                        187 229 229
                        185 228 228
                        182 227 227
                        180 226 226
                        177 225 225
                        175 224 224
                        173 223 223
                        170 222 222
                        168 221 221
                        165 220 220
                        163 219 219
                        160 218 218
                        158 217 217
                        156 216 216
                        153 215 215
                        151 214 214
                        148 213 213
                        146 212 212
                        143 212 212
                        141 211 211
                        139 210 210
                        136 209 209
                        134 208 208
                        131 207 207
                        129 206 206
                        127 205 205
                        124 204 204
                        122 203 203
                        119 202 202
                        117 201 201
                        114 200 200
                        112 199 199
                        110 198 198
                        107 197 197
                        105 196 196
                        102 195 195
                        100 194 194
                        99 193 194
                        98 192 193
                        97 191 192
                        96 191 191
                        95 190 190
                        94 189 189
                        93 188 188
                        92 187 187
                        91 186 186
                        90 185 185
                        89 184 184
                        88 183 183
                        87 182 182
                        86 181 181
                        85 180 180
                        84 179 179
                        83 178 178
                        82 177 177
                        81 176 176
                        80 175 175
                        79 174 174
                        78 173 173
                        77 172 172
                        76 171 171
                        75 170 170
                        74 169 169
                        73 168 168
                        72 167 167
                        71 166 166
                        70 165 165
                        69 164 164
                        68 163 163
                        67 162 162
                        66 161 161
                        65 160 160
                        64 159 159
                        63 158 158
                        62 157 157
                        61 156 156
                        60 155 155
                        59 154 154
                        58 153 153
                        57 152 152
                        56 151 151
                        55 150 150
                        54 149 149
                        53 148 148
                        52 147 147
                        51 146 146
                        50 145 145
                        49 144 144
                        48 143 143
                        47 142 142
                        46 141 141
                        45 140 140
                        44 139 139
                        43 138 139
                        42 137 138
                        41 136 137
                        40 135 136
                        39 134 135
                        38 133 134
                        37 132 133
                        36 131 132
                        36 130 131
                        35 130 130
                        35 129 130
                        34 128 129
                        34 128 128
                        33 127 128
                        33 126 127
                        32 126 126
                        32 125 126
                        31 124 125
                        31 123 124
                        30 123 123
                        30 122 123
                        29 121 122
                        29 121 121
                        28 120 121
                        28 119 120
                        27 119 119
                        27 118 119
                        26 117 118
                        26 117 117
                        25 116 116
                        25 115 116
                        24 115 115
                        24 114 114
                        23 113 114
                        23 113 113];


%Colores usados en Gráfica 3D      
colornulos = 1/255*[142 31 76]; 
colorcurva = 1/255*[1 156 161]; 
% colorlpuniforme = 1/255*[160 33 104]; %Color máximo principal
% coloranchohazuniforme = 1/255*[103 5 165]; %Color ancho haz principal

% %Colores Gráficos - Ancho
% colorminimos3dB = 1/255*[139,0,139]; %Color mínimos
% coloranchohaz3dB = 1/255*[72,61,139]; %Color ancho de haz

% %Colores Curvas de Nivel
% curvaCorteTheta = 1/255*[205,92,92];
% minimosCorteTheta = 1/255*[106,90,205];
% curvaCortePhi = 1/255*[0,206,209];
% minimosCortePhi = 1/255*[178,34,34];
%     