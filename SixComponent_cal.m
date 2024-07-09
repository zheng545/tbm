Lcrad = 131*0.001;       % unit: mm
Hleverarm = 122.5*0.001; % unit: mm

%% Wheel 1
%unknown
LogFz_1_cal_Time = LogMx_1_Time;
LogFz_1_cal = -(LogMx_1 - LogFy_1 .* Lcrad)./Hleverarm;

%% Wheel 2
%known
% LogFz_2_cal = -(LogMx_2 - LogFy_2 * Lcrad)/Hleverarm;

%unknown
LogFx_2_cal_Time = LogMz_2_Time;
LogFx_2_cal = LogMy_2 / Lcrad;

%删除所有local parameters
clear Lcrad
clear Hleverarm
clear LogAlignment_TimeStamp_2 LogAlignment_TimeStamp_2_Time
clear Alignment_TimeStamp Alignment_TimeStamp_Time
