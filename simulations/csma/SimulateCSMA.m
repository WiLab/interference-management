function [pproc,enabled] = SimulateCSMA(lambda,threshold,alpha,mu,d,enablePlot)

%% Create CSMA Test

% Parameters
% lambda = Nodes per meter^2
% threshold = Sensing range of node
% alpha = Pathloss exponent
% d = Dimensionality of network
% mu = channel fading mean (Rayleigh)
% enablePlot = plot point positions (boolean)

% Transmitter Power
Ptx = 1;

% Region Size
% A = -30:30;
A = 0:100;
% A = 0:10;

% Generate PPP base points
N = poissrnd(lambda*length(A)^d);
pproc = unifrnd(A(1),A(end),N,d);

% mark all points for backoff
marks = rand(N,1);

% sort by marks
[~,indexes] = sort(marks);
n = length(indexes); % Points

% enabled flags
enabled = ones(N,1);

% thin points based on marks and thresholds
chars = 0;
last = -1;
for point = 1:length(indexes)

    % Skip if point disabled already
    if enabled(indexes(point))==0
        continue;
    end

    % Get distances of points with lower marks that are still enabled
    if point>1
        ind = indexes(1:point-1);
        ind(enabled(ind)==0) = [];
        distanceFromNode = abs(bsxfun(@minus,pproc(indexes(point),:),pproc(ind,:)));
    else
        continue;
    end
   
   % Apply pathloss
   r = sqrt(distanceFromNode(:,1).^2+distanceFromNode(:,2).^2);
   pl = (Ptx.*r).^-alpha;

   % Apply channel effects
   h = exprnd(mu,size(distanceFromNode,1),1);
   energyAtRx = h.*pl;
   
   % Determine if threshold is met
   enabled(indexes(point)) = sum(energyAtRx)<threshold;

   % Progress of points processed
   new = int64(100*point/n);
   if last==new
       last = new;
       s = sprintf('Percent Complete (%d of %d)\n',new,100);
       bb = repmat('\b',1,chars);
       fprintf([bb,s]);
       chars = length(s);
   end
   
end

% Plot remaining active nodes after point deletion
if enablePlot
plotCSMA(pproc,enabled);
end

end

function plotCSMA(pproc, enabled)

showSurvivingPointsNoCircles(pproc,ones(size(enabled)),1,'b*');
showSurvivingPointsNoCircles(pproc,enabled,1,'r*');
legend('Original','Enabled');

end

% function showSurvivingPoints(positions,enabled,r)
% 
% pp = [positions(enabled>0,1),positions(enabled>0,2)];
% 
% figure(2);
% scatter(pp(:,1),pp(:,2),'r*');
% 
% 
% ang=0:0.01:2*pi;
% xp=r*cos(ang);
% yp=r*sin(ang);
% hold on;
% for i = 1:length(pp)
%   plot(pp(i,1)+xp,pp(i,2)+yp);
% end
% hold off;
% end

function showSurvivingPointsNoCircles(positions,enabled,fNum,symbol)

pp = [positions(enabled>0,1),positions(enabled>0,2)];

figure(fNum);
hold on;
scatter(pp(:,1),pp(:,2),symbol);
hold off;

% ang=0:0.01:2*pi;
% xp=r*cos(ang);
% yp=r*sin(ang);
% hold on;
% for i = 1:length(pp)
%   plot(pp(i,1)+xp,pp(i,2)+yp);
% end
% hold off;
end
