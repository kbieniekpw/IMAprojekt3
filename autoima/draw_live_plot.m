
plot_scale = 0.7/0.7;
w = 0.002*10*plot_scale;
h = 0.003*plot_scale*3;
x_p = 0;
y_p = 0;
for i = 1:length(xk)
    plot(y_zad(1, :), y_zad(2, :), 'b', 'LineWidth', 2);
    hold on
    plot(xk(1, 1:i), xk(2, 1:i), 'r--','LineWidth', 1.5);
    x_p = xk(1, i) -w/2;
    y_p = xk(2, i) - h/2;
    t_p = xk(3, i);
    rectangle('Position', [x_p y_p, w  h], 'EdgeColor', 'k', 'FaceColor','g');
    p1 = [x_p + w/2 y_p + h/2];
    arrow_len = 0.03*plot_scale;
    p2 = [x_p + w/2  + arrow_len*cos(t_p) y_p + h/2 + arrow_len*sin(t_p)];      
    dp = p2-p1;                       
    quiver(p1(1),p1(2),dp(1),dp(2),0,'m','LineWidth', 2)
    drawnow
    rectangle('Position', [x_p y_p, w  h], 'EdgeColor','w', 'FaceColor','w')
    quiver(p1(1),p1(2),dp(1),dp(2),0,'w','LineWidth', 2)

end