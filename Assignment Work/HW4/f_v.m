v = (0:0.01:1);

plot(v,fv(v));

function f = fv(v)
% normalized force-velocity relation
% input is normalized velocity: v/vmax

%af = 0.25;  % shape parameter
af = 0.1:0.05:0.4;

%f_i = zeros(size(v,2),size(af,2));

for i = 1 : size(af,2)
    
    f = (1 - v)./(1 + v/af(i));
    
    %f_i(:,i) = f';

    if (f < 0), f = 0; end
    
    %figure
    %{
    p1 = plot(v,f_i(:,0));
    hold on
    p2 = plot(v,f_i(:,1));
    hold on
    p3 = plot(v,f_i(:,2));
    hold on
    p4 = plot(v,f_i(:,3));
    hold on
    p5 = plot(v,f_i(:,4));
    hold on
    p6 = plot(v,f_i(:,5));
    hold on
    p7 = plot(v,f_i(:,6));
    %}
    
    plot(v,f)
    xlabel('Normalized Velocity')
    ylabel('Normalized Force')
    title('Normalized Force-Velocity curve with different Shape Parameters')
 
    legends{i} = sprintf('%0.2f', af(i));
    [leg,att] = legend(legends,'AutoUpdate','off', 'show');
    title(leg,'Shape Parameter')

    hold on
   
end

end % fv
 


