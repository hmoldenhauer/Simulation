% In this script a simulation for a MW-Cavity will evolve.

% load all subdirectories in order to access all functions
addpath(genpath('..\Simulation\'));

% load folder with stl data
addpath(genpath('..\..\Hardware\'));

% read an stl file
[vertices_reflector, faces_reflector, normals_reflector, name_reflector] = stlRead('Reflector.stl');
[vertices_cover, faces_cover, normals_cover, name_cover] = stlRead('Cover.stl');

%stlWrite('test.stl', [faces_cover], [vertices_cover]);

%model = createpde;
%test = importGeometry(model, 'test.stl');
vertices_reflector = vertices_reflector+50;
% plot the data
stlPlot([vertices_cover;vertices_reflector], [faces_cover;faces_reflector], name_cover);
%pdegplot(model);