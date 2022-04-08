function [y1,y2,y3] = crop_data(data)
output = zeros(length(data),3);
for i = 1:length(data)
    croped = split(data(i),',');
    for e = 1:length(croped)
        croped(e) = erase(erase(croped(e),']'),'[');
    end
    for el = 1:3
        output(i,el) = str2double(cell2mat(croped(el)));
    end
end
output = output(:,1:3);
y1 = output(:,1);
y2 = output(:,2);
y3 = output(:,3);
end

