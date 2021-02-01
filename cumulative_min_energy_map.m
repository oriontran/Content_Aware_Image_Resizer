function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
[r,c] = size(energyImg);
cumulativeEnergyMap = zeros(r,c);

if(seamDirection == "VERTICAL")
    cumulativeEnergyMap(1,:) = energyImg(1,:);
    for i=2:r
        for j=1:c
            if(j-1 <= 0)
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(cumulativeEnergyMap(i-1,j), cumulativeEnergyMap(i-1,j+1));
            elseif(j+1 > c)
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i-1,j));
            else
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(min(cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i-1,j)), cumulativeEnergyMap(i-1,j+1));
            end
        end
    end
end

if(seamDirection == "HORIZONTAL")
    cumulativeEnergyMap(:,1) = energyImg(:,1);
    for j=2:c
        for i=1:r
            if(i-1 <= 0)
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(cumulativeEnergyMap(i,j-1), cumulativeEnergyMap(i+1,j-1));
            elseif(i+1 > r)
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i,j-1));
            else
                cumulativeEnergyMap(i,j) = energyImg(i,j) + min(min(cumulativeEnergyMap(i-1,j-1), cumulativeEnergyMap(i,j-1)), cumulativeEnergyMap(i+1,j-1));
            end
        end
    end
end
