% In this script a simulation for a MW-Cavity will evolve.

% load all subdirectories in order to access all functions
addpath(genpath('..\Simulation\'));

% load folder with stl data
addpath(genpath('..\..\Hardware\'));

% generate filenames
resonator = 'Resonator_assembly_CuBO';
plunger = 'Plunger_6';
holder = 'Sample_Holder_full_7';
sample = 'CuBO_Sample_1,1x1,1x0,5_8';

plunger = strcat(resonator, '_', plunger, '.stl');
holder = strcat(resonator, '_', holder, '.stl');
sample = strcat(resonator, '_', sample, '.stl');
resonator = strcat(resonator, '.stl');

% read stl files
%   faces contains only the indices of vertices that belong to one face
[vertices, faces, normals, name] = stlRead(resonator);
[vertices_p, faces_p, normals_p, name_p] = stlRead(plunger);
[vertices_h, faces_h, normals_h, name_h] = stlRead(holder);
[vertices_s, faces_s, normals_s, name_s] = stlRead(sample);

% save starting parameters
vmani = vertices;
hmani = vertices_h;
pmani = vertices_p;
smani = vertices_s;

% holder and sample have to be manipulated the same way
[vmani,hmani] = manipulateVertices(hmani, vmani, 2, -1.5);
[vmani,smani] = manipulateVertices(smani, vmani, 2, -1.5);

[vmani,pmani] = manipulateVertices(pmani, vmani, 2, -1.5);

% plot to check if everything correct
stlPlot(vmani,faces,name);

model = createpde;
%test = geometryFromMesh(model, vertices, faces);
%test = importGeometry(model, 'Resonator_assembly.stl');
% plot the data
%pdegplot(model);