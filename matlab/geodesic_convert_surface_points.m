%internal geodesic function
%conversion between C++ and matlab surface point representation
% Danil Kirsanov, 09/2007 

function q = geodesic_convert_surface_points(p, implicit_io)

if isempty(p)
    q = [];
    return;
end

if nargin < 2
    implicit_io = false;
end

point_types = {'vertex', 'edge', 'face'};

if ~implicit_io
    if ~isa(p,'numeric')       %convert from matlab to C++
        num_points = length(p);
        q = zeros(num_points*5, 1);
        for i = 1:num_points
            shift = (i-1)*5;
            q(shift + 1) = p{i}.x;
            q(shift + 2) = p{i}.y;
            q(shift + 3) = p{i}.z;
            q(shift + 5) = p{i}.id - 1;

            type = find(strcmp(point_types, p{i}.type));
            if isempty(type)
                disp('error: point type is incorrect');
                q = [];
                return;
            else
                q(shift + 4) = type - 1;
            end
        end
    else                    %convert from C++ to matlab
        num_points = length(p)/5;
        q = cell(num_points, 1);
        for i = 1:num_points
            shift = (i-1)*5;
            point.x = p(shift + 1);
            point.y = p(shift + 2);
            point.z = p(shift + 3);
            point.type = point_types(p(shift + 4) + 1);
            point.id = p(shift + 5) + 1;

            q{i} = point;
        end
    end
else
    % convert from C++ to matlab only for now
    num_points = length(p)/7;
    q = cell(num_points, 1);
    for i = 1:num_points
        shift = (i-1)*7;
        point.x = p(shift + 1);
        point.y = p(shift + 2);
        point.z = p(shift + 3);
        point.type = point_types(p(shift + 4) + 1);
        point.id = p(shift + 5) + 1;
        point.b0 = p(shift + 6);
        point.b1 = p(shift + 7);
        
        q{i} = point;
    end
end
