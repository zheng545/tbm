%% 生成timeseries
result = whos; %提取所有变量名字
min_time = 0;
max_time = 0;
for i = 1:size(result,1)
    var_name = result(i).name; %循环每个变量名字
    % 识别其对应的t轴名字
    if (contains(var_name,'_Time') == 0)
    % 时间轴信号的名字结尾是_Time
        val = var_name;
        t_pat ='_Time';
        t = append(val,t_pat);
        eval([val, '_timeseries = timeseries(', var_name,',',t,');'])
        continue;
    elseif (var_name == 'i')
        continue;
    elseif  (contains(var_name,'_TimeStamp') == 1)
        continue;
    else
        eval(['min_time = min(min_time, min(', var_name,'));'])
        eval(['max_time = max(max_time, max(', var_name,'));'])
        %disp(val)
        disp(max_time)
        continue;
    end
end
