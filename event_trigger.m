x = 1:5;  % x 轴的离散位置（这些位置就是垂直线的位置）
y = [2, 4, 6, 8, 10];  % 对应于每条垂直线的顶部位置

% 创建图形
figure;

% 绘制垂直线并添加空心圆圈标记
for i = 1:length(x)
    % 绘制垂直线
    plot([x(i), x(i)], [0, y(i)], 'r-', 'LineWidth', 1);  % 从 y = 0 到 y(i) 的垂直线
    hold on;  % 保持当前图形
    % 在每条垂直线的顶部添加空心圆圈标记
    plot(x(i), y(i), 'ro', 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'r', 'MarkerSize', 10);  % 空心红色圆圈
end

% 添加标题和轴标签
title('Vertical Lines with Hollow Circle Markers');
xlabel('x');
ylabel('y');

% 设置坐标轴范围
xlim([0, max(x) + 1]);
ylim([0, max(y) + 2]);

% 添加网格
grid on;