function [complete, part] = manipulateVertices(part, complete, axis, movement)

% check if points are in complete and get indices
[Lia, Loc] = ismember(part, complete, 'rows');

% movement of complete along chosen axis
complete(Loc, axis) = complete(Loc, axis) + movement;

% update part coordinates
part(:, axis) = part(:, axis) + movement;