function [EuclidDistance] = project_point_to_line_segment(A,B,p)
%% Author: Federico Parezzan, Francesco Fornasa
%% Returns the distance between a point and a line segment
% EuclidDistance = PROJECT_POINTS_TO _LINE_SEGMENT (A,B,p)
% 	A and B are the extremities of the line segment
%   p is the point whose distance has to be found
% 	EuclidDistance is the distance between the point and the segment


% vector from A to B
AB = (B-A);

% squared distance from A to B
AB_squared = dot(AB,AB);

if(AB_squared == 0)
    % A and B are the same point
    q = A;
else
    % vector from A to p
    Ap = (p-A);
    % Consider the line extending the segment, parameterized as A + t (B - A)
    % We find projection of point p onto the line.
    % It falls where t = [(p-A) . (B-A)] / |B-A|^2
    t = dot(Ap,AB)/AB_squared;
    if (t < 0.0)
        % "Before" A on the line, just return A
        q = A;
    else if (t > 1.0)
            % "After" B on the line, just return B
            q = B;
        else
            % projection lines "inbetween" A and B on the line
            q = A + t * AB;
        end
    end
end

% Now that we have q that is the nearest point on the segment
% we can calculate the distance between q and p
EuclidDistance = sqrt((q(1)-p(1))^2 + (q(2)-p(2))^2 + (q(3)-p(3))^2);


