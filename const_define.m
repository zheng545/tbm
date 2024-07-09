
% ------------------------------------------------------------------------------------
% Constant, must be the same as the actual modle setup!
%-------------------------------------------------------------------------------------
Const_cnv_fundmt_stepSize = 0.001;  % fundemental step size

Const_phyVeh_spdIs0_ifLsTnTs = 0.005;   %  m/s; speed is set 0 if it is less than this value
Const_phyVeh_angSpdIs0_ifLsTnTs = 0.005;  % rad / sec


Const_axleNoFrictn_ifSpdLsTn = 1;     % m/s; 
Const_axleFrict_1g_ifSpdMrTn = 200;   % m/s;

Const_tireBlow_muPcntLoss_x = 0.2;    % no unit; 
Const_tireBlow_muPcntLoss_y = 0.7;    % no unit; 

%% standard tire-road friction 

temp_phyWhl_atPeakMu_slip = 0.10;    % slip value when peak mu occurs. 

%------------------------------------------------- longitudinal (rotational) definition --------------------------- 
% 2d lookup table logitudinal
% row break point: rotational slip ratio
%                             1              2                                3                      4 / 
Const_phyWhl_sRsA2muFx_sR = [  0,    temp_phyWhl_atPeakMu_slip,   temp_phyWhl_atPeakMu_slip+0.1,    1     ];
% table value                 1      2       3         4
Const_phyWhl_sRsA2muFx_mu = [  0,     1,      1,      0.7;  ... % slip angle =  0 degree
                              0,    0.9,    0.9,     0.7;  ... % slip angle =  2 degree
                              0,    0.8,    0.8,     0.7;  ... % slip angle =  4 degree
                              0,    0.7,    0.7,     0.7;  ... % slip angle =  6 degree
                              0,    0.5,    0.6,     0.7;  ... % slip angle = 10 degree
                              0,    0.4,    0.5,     0.6;  ... % slip angle = 20 degree
                              0,    0.0,    0.0,     0.0;  ... % slip angle = 90 degree                              
                            ];                                     
                        
% collumn break point: side slip angle
Const_phyWhl_sRsA2muFx_sA = [  0,  2,   4,  6,  10,  20, 90 ]*pi/180;

%------------------------------------------------- lateral definition ---------------------------------------------
% 2d lookup table lateral 
Const_phyWhl_sAsR2muFy_sA = [  0,   8,   15,    90     ]*pi/180;
% table value                 1      2       3         4
Const_phyWhl_sAsR2muFy_mu = [  0,     1,      1,      0.6;  ... % slip ratio =   0%
                              0,    0.85,   0.85,    0.6;  ... % slip ratio =   8%
                              0,    0.7,    0.7,     0.6;  ... % slip ratio =  16%
                              0,    0.4,    0.5,     0.6;  ... % slip ratio =  30%
                              0,    0.3,    0.4,     0.6;  ... % slip ratio =  50%
                              0,    0.2,    0.3,     0.6;  ... % slip ratio = 100%
                              ];  

Const_phyWhl_sAsR2muFy_sR = [  0,  0.08,   0.16,  0.3, 0.5, 1  ];
clear temp_phyWhl_atPeakMu_slip


