function [data] = calculateMis(data)
%Given the data table, this function add an additional column to the
%wind-waves misalignment.
%INPUT
    %data =  data table with metocean features downlaoded from NOAA
%OUTPUT
    %data = data table with one more feature: MIS (corresponding to
    %wind-waves misalignment
%Author: Montserrat Sacie Alcázar
%------------------------------------------------------------------------

for c = 1:length(data.WDIR)
    data.MIS(c) = data.WDIR(c) - data.MWD(c);
    if data.MIS(c) > 180
        data.MIS(c) = mod(data.MIS(c),-180);
    elseif data.MIS(c) < -180
        data.MIS(c) = mod(data.MIS(c),180);
    end
end

end

