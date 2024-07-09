%% 获取文件
clear all;
[FileName,PathName,~] = uigetfile(fullfile(pwd,'*.mat'), 'Select the MAT file(s). Use Ctrl key for selecting multiple files','MultiSelect','on');
load(strcat(PathName,FileName));

%% 生成所有变量的timeseries，获取最长时间
clear FileName PathName;
result = whos; %提取所有变量名字
min_time = 0;
max_time = 0;
for i = 1:size(result,1)
    var_name = result(i).name; %循环每个变量名字
    %识别其对应的t轴名字
    if ((contains(var_name,'_Time') == 0) && (contains(var_name,'PacketID_') == 1))
    %时间轴信号的名字结尾是_Time
        short_name = var_name(11:end);
        disp(short_name)
        t_pat ='_Time';
        t = append(var_name,t_pat);
        eval([short_name, '_TS = timeseries(', var_name,',',t,');'])
        eval(['clear ',var_name])
        continue;
    elseif (contains(var_name,'_Time') == 0)
    %时间轴信号的名字结尾是_Time
        val = var_name;
        t_pat ='_Time';
        t = append(val,t_pat);
        eval([val, '_TS = timeseries(', var_name,',',t,');'])
        eval(['clear ',var_name])
        continue;
    elseif (var_name == 'i')
        continue;
    elseif  (contains(var_name,'_TimeStamp') == 1)
        continue;
    else
        eval(['min_time = min(min_time, min(', var_name,'));'])
        eval(['max_time = max(max_time, max(', var_name,'));'])
        eval(['clear ',var_name])
        continue;
    end
end

%% 生成新的时间轴（使用所有变量里的最长时间）
new_time = min_time:0.01:max_time;
clear DFOUT_tb_location_i_TS DFOUT_tb_msg_elapse_TS
clear TYRE_BURST_frm_raw_TS TYRE_BURST_frm_sof__TS TYRE_BURST_frm_tyre_TS TYRE_BURST_frm_uid_TS
clear LogAlignment_TimeStamp_2 LogAlignment_TimeStamp_2_Time PacketID_0Alignment_TimeStamp PacketID_0Alignment_TimeStamp_Time;
clear LogAlignment_TimeStamp_1 LogAlignment_TimeStamp_1_Time

% 按新时间轴，resample所有变量至相同长度
result = whos; %提取所有变量名字
for i = 1:size(result,1)
    var_name = result(i).name; 
    if (contains(var_name,'_TS') == 1)
        name = var_name;
        disp(name)
        eval([name,'_ReS = resample(',name,',new_time,"zoh");'])
        eval([name,'_ReS.Data(isnan(',name,'_ReS.Data)) = 0;'])
        eval(['clear ',var_name])
        continue;
    end
end
clear new_time min_time max_time i;
clear result t t_pat val var_name name;
clear short_name;