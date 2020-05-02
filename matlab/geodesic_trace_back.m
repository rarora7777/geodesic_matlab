function path = geodesic_trace_back(algorithm, destination, implicit_output)

global geodesic_library;

tmp{1} = destination;
d = geodesic_convert_surface_points(tmp);

tmp = libpointer('doublePtrPtr');

if nargin < 3
    implicit_output = false;
end

if ~implicit_output
    [path_length, ~, path_double] = ...
        calllib(geodesic_library, 'trace_back', algorithm.id, d, tmp);
    setdatatype(path_double, 'doublePtr', path_length*5);
    path = geodesic_convert_surface_points(path_double.Value);
else
    [path_length, ~, path_double] = ...
        calllib(geodesic_library, 'trace_back_implicit', algorithm.id, d, tmp);
    setdatatype(path_double, 'doublePtr', path_length*7);
    path = geodesic_convert_surface_points(path_double.Value, true);
end

