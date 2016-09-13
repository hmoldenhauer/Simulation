     % Draw three mutually intersecting cylinders
       p0 = [30 30 30];
       p1 = [90 30 30];
       p2 = [30 90 30];
       p3 = [30 30 90];
       [v1 f1] = cylinderMesh_tz([p0 p1 5 20 10]);
       [v2 f2] = cylinderMesh_tz([p0 p2 25 40 20]);
       [v3 f3] = cylinderMesh_tz([p0 p3 15 40 50]);
       figure; hold on;
       drawMesh(v1, f1, 'FaceColor', 'r');
       drawMesh(v2, f2, 'FaceColor', 'g');
       drawMesh(v3, f3, 'FaceColor', 'b');
       view(3); axis equal
       set(gcf, 'renderer', 'opengl')