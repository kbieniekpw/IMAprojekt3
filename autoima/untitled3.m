x = linspace(0, 4*pi, 100);
figure(1)
axis([0  3    -2  2])
for k1 = 1:length(x)
    rectangle('Position', [1.5  sin(x(k1)), 0.2  0.5], 'EdgeColor', 'k', 'FaceColor','b')
    refreshdata(gca)
    drawnow
    rectangle('Position', [1.5  sin(x(k1)), 0.2  0.5], 'EdgeColor','w', 'FaceColor','w')
end