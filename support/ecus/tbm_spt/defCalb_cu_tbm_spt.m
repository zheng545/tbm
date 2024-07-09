%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Use BTS to brake 
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    temp_simuDrBrk_delayAftTB = 0; % if blowout is detected, predetermined BTS-mcp profile will be triggered after this delay. 
    temp_drCmdMcP_tgt = 40;   %60;   % bar
    temp_drCmdMcP_incRate = 100;   %  bar/sec    
                      %       1                  2                          3               4  5  6  7  8
Calib_tbm_brkBts_x8 = [temp_simuDrBrk_delayAftTB  temp_drCmdMcP_tgt  temp_drCmdMcP_incRate  0  0  0  0  0];
                clear  temp_simuDrBrk_delayAftTB  temp_drCmdMcP_tgt  temp_drCmdMcP_incRate      
             
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% TBM
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++             
        temp_minSpd_actvTbm = 20/3.6;   % m/s

        % parameters specify pressure dump and hold and reincrease
        temp_presDec_tgt  = 0;      % bar
        temp_presDec_rate = 900;    %  bar/sec
        temp_presReInc_rate = 50;   %  bar/sec
        temp_intvn_durn = 10;       % sec, intvn_durn intervention time
        temp_vehSpd_toExit_tbm = 1; % m/s

%                              1                 2                3                  4                   5                 6               7  8
Calib_tbm_ctr_x8 = [temp_minSpd_actvTbm  temp_presDec_tgt  temp_presDec_rate temp_presReInc_rate  temp_intvn_durn  temp_vehSpd_toExit_tbm  0  0];
              clear temp_minSpd_actvTbm  temp_presDec_tgt  temp_presDec_rate temp_presReInc_rate  temp_intvn_durn  temp_vehSpd_toExit_tbm
              
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  Steering
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% parameter to allow tbm functions

% parameters specify steeringANG ramp and hold and decrease
temp_str_ACIReq_tgt  = 30;    % degree 14, spin out
temp_str_ACI_incRate = 200;   % deg/sec
temp_str_ACI_decRate = 200;   % deg/sec
temp_str_hold_durn = 2;      % sec, hold this duration once having reached target
temp_str_intvn_durn = 4;      % sec,quit after this duration
temp_simuDistb_delayAftTB = 0; % 0.1 sec if blowout is detected, predetermined BTS-mcp profile will be triggered after this delay. This is to support test case for intentional delay to simulate driver response

%                                   1                     2                    3                  4                 5                      6                 7  8    
Calib_tbm_strDistb_x8 = [temp_str_ACIReq_tgt  temp_str_ACI_incRate temp_str_ACI_decRate  temp_str_hold_durn  temp_str_intvn_durn  temp_simuDistb_delayAftTB  0  0 ];
                  clear  temp_str_ACIReq_tgt  temp_str_ACI_incRate temp_str_ACI_decRate  temp_str_hold_durn  temp_str_intvn_durn  temp_simuDistb_delayAftTB


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  Suspension
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% parameters specify suspension target and duration
temp_sup_pKpa_norm_w1 = 1210; % kpa
temp_sup_pKpa_norm_w2 = 1030;   % kpa
temp_sup_pKpa_norm_w3 = 830;   % kpa
temp_sup_pKpa_norm_w4 = 910; % kpa
temp_sup_pKpa_dumpToPcent = 0.83;   
temp_sup_intvn_durn = 10;        % sec, intvn_durn intervention time
temp_sup_delayAftTB = 0;         % sec, if blowout is detected, predetermined suspension setting triggered after this delay. 
%                             1                              2                  3                     4                         5                 6                     7          8    
Calib_tbm_supCtr_x8 = [temp_sup_pKpa_norm_w1  temp_sup_pKpa_norm_w2 temp_sup_pKpa_norm_w3 temp_sup_pKpa_norm_w4 temp_sup_pKpa_dumpToPcent temp_sup_intvn_durn temp_sup_delayAftTB  0];
                 clear temp_sup_pKpa_norm_w1  temp_sup_pKpa_norm_w2 temp_sup_pKpa_norm_w3 temp_sup_pKpa_norm_w4 temp_sup_pKpa_dumpToPcent temp_sup_intvn_durn temp_sup_delayAftTB  0

                 
                 
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  Pirelle sensor
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++               
temp_tbPosib_pres1   = 300  ;%   kpa    tire blowout possible if pressure is less than this
temp_tbPosib_presRat1 = -600 ;%   -800kpa/sec    tire blowout possible if pressure rate is less than this

temp_tbPosib_pres2   = 250  ;%   kpa    tire blowout possible if pressure is less than this
temp_tbPosib_presRat2 = -300 ;%   -400kpa/sec    tire blowout possible if pressure rate is less than this

                       %         1                   2                     3                     4            5  6  7  8,
Calib_pirelle_presSnr_x8 = [ temp_tbPosib_pres1  temp_tbPosib_presRat1 temp_tbPosib_pres2  temp_tbPosib_presRat2  0  0  0  0 ];
                   clear temp_tbPosib_pres1  temp_tbPosib_presRat1 temp_tbPosib_pres2  temp_tbPosib_presRat2


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  pre_blowout trigger 
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
temp_triger_gapMax = 0.4;      % meter, gap threshold for trigger, measured gap must be less than this to trigger
temp_triger_gapMin = 0.2;      % meter, gap threshold for trigger, measured gap must be less than this to trigger
temp_triger_numDatMin = 4;     % min number of data for trigger
temp_triger_spdMax = 100/3.6;   % m/s
temp_triger_spdMin = 50/3.6;   % m/s


Calib_roadTriger_x6 = [temp_triger_gapMax  temp_triger_gapMin  temp_triger_numDatMin  temp_triger_spdMax temp_triger_spdMin  0];
                clear  temp_triger_gapMax  temp_triger_gapMin  temp_triger_numDatMin  temp_triger_spdMax temp_triger_spdMin  0

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  tbm sensor type
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++              
temp_tbmSnr_type =  Enum_tbm_snrType.Sansata; %Pirelle，Sansata
temp_tbmSnr_timeDelay = 0.0; 

Calib_tbm_sensor_x4 = single([temp_tbmSnr_type  temp_tbmSnr_timeDelay  0  0]);
                       clear  temp_tbmSnr_type  temp_tbmSnr_timeDelay
