v = (0:0.01:1);

plot(v,pv(v));

function p = pv(v)

af = 0.1:0.05:0.4;

for i = 1 : size(af,2)
   
    f = (1 - v)./(1 + v/af(i));

    if (f < 0), f = 0; end
    
    p = f.*v;
    
    plot(v,p)
    xlabel('Normalized Velocity')
    ylabel('Normalized Power')
    title('Normalized Power-Velocity curve with different Shape Parameters')
    
    legends{i} = sprintf('%0.2f', af(i));
    [leg,att] = legend(legends,'AutoUpdate','off', 'show');
    title(leg,'Shape Parameter')
    
    hold on
    
end
end