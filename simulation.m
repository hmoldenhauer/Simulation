% In this script a simulation for a MW-Cavity will evolve.

% load all subdirectories in order to access all functions
addpath(genpath('..\Simulation\'));

% load folder with stl data
addpath(genpath('..\..\Hardware\'));

% read stl files
%   faces contains only the indices of vertices that belong to one face
[vertices, faces, normals, name] = stlRead('Resonator_assembly.stl');
[vertices_p, faces_p, normals_p, name_p] = stlRead('Resonator_assembly_Plunger_6.stl');
[vertices_h, faces_h, normals_h, name_h] = stlRead('Resonator_assembly_Sample_Holder_full_7.stl');

% change coordinate System, so that z is in z direction
vmoved(:,1) = vertices(:,1);
vmoved(:,2) = vertices(:,3);
vmoved(:,3) = vertices(:,2);

% check if points are in Resonator and get indices
[Lia_h, Loc_h] = ismember(vertices_h, vertices, 'rows');
[Lia_p, Loc_p] = ismember(vertices_p, vertices, 'rows');

% move the of plunger and sample holder
vmoved(Loc_h,3) = vmoved(Loc_h,3) + 10;
vmoved(Loc_p,3) = vmoved(Loc_p,3) + 10;

% plot to check if everything correct
stlPlot(vmoved,faces,name);

model = createpde;
%test = geometryFromMesh(model, vertices, faces);
%test = importGeometry(model, 'Resonator_assembly.stl');
% plot the data
%pdegplot(model);