function distancesLin = GetDistanceDistribution(pproc, enabled)

indexes = find(enabled>0);

distances = zeros(length(indexes),length(indexes)-1);
i = 1;
for point = 1:length(indexes)
    
    others = indexes;
    others(point) = [];
    ind = indexes(point);
    
    
    distanceFromNode = abs(bsxfun(@minus,pproc(others,:),pproc(ind,:)));
    
    % Get norm distance
    distances(i,:) = sqrt(distanceFromNode(:,1).^2+distanceFromNode(:,2).^2).';
    i = i + 1;
end

distancesLin = reshape(distances,numel(distances),1);

end