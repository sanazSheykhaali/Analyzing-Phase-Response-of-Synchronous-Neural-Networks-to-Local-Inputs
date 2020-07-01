    netPreAllocation;
    rho1=[];
for t=1:(nTimePoints-1)
    for j = 1:nNeurons
        Isyn(j) = 0;
        for i = 1:nNeurons
            if i~=j
                S(j,i,t+1) = S(j,i,t) + dt*(as(v(j,t)) *(1-S(j,i,t)) - bs*S(j,i,t));
                Isyn(j) = Isyn(j) + g(i,j) *S(i,j,t) *(v(j,t));
            end
        end
    end
    for j=1:nNeurons
        
        if j == perturbedNeouronIdx
            I_per = exterainjectedCurrent;
        else
            I_per = 0;
        end
        v(j,t+1) = v(j,t) + dt*(I_per + injectedCurrent-...
            (gNa*(m(j,t)^3)*h(j,t)*(v(j,t)-Ena))-...
            (gk*(n(j,t)^4)*(v(j,t)-Ek))-...
            (gl*(v(j,t)-El))- Isyn(j));
        
        n(j,t+1) = n(j,t)+dt*(((an(v(j,t)))*(1-n(j,t)))-((bn(v(j,t)))*n(j,t)));
        m(j,t+1) = m(j,t)+dt*(((am(v(j,t)))*(1-m(j,t)))-((bm(v(j,t)))*m(j,t)));
        h(j,t+1) = h(j,t)+dt*(((ah(v(j,t)))*(1-h(j,t)))-((bh(v(j,t)))*h(j,t)));
        
        if v(j,t+1)<= voltage_threshold && v(j,t)> voltage_threshold
            rho1(j,t)=1;
        end
        
    end
    vtemp0(:,t) = v(:,t).*(v(:,t)>20);
end
