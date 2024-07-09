%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  software configuration  Parameter define 
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if ~exist('Enum_tbm_tbmSts','class')
Simulink.defineIntEnumType( 'Enum_tbm_tbmSts', ...
   {'Init','Watch_for_blowout','Blowout_mitigate', 'Blowout_terminal'}, ...
   [     0                 1               2                3        ], ...
   'DefaultValue', 'Init', ...
   'StorageType', 'uint8', ...
   'AddClassNameToEnumNames', true);
end

SwCfg_cuTbm_simuCan = false;    %true; 
FtIME_CAN_LINEoFF_ecuTbm_pd  = 10000;


Const_tbmVeh_ctrLoopTime = 0.01;  % 10 ms



Parm_tbmVeh_sig_tolerate_numInvalid = 3;    
Parm_tbmVeh_sig_max_numInvalid = 6;    

