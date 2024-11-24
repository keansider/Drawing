% 定义数据范围
x1max = 5;
x2max = 5;
[x1, x2] = meshgrid(0:0.1:x1max, 0:0.1:x2max); % 创建网格
x3 = x1 + x2; % 定义平面 z 值

% 创建三维图
figure;
hold on;

% 绘制网格线图（线框图）
mesh(x1, x2, x3); % 使用 mesh 绘制线框图
colormap('parula'); % 设置颜色映射为 parula
alpha(0.8); % 设置透明度

% 获取网格的大小
nRows = size(x1, 1);
nCols = size(x2, 2);

% 获取 'parula' 配色方案的颜色
cmap = colormap('parula'); % 获取 parula 配色
c = x3; % 使用 x3 值作为颜色值

% 只绘制边界上的渐变连接线
for i = 1:nRows
    for j = 1:nCols
        % 只绘制在边界上的连接线
        if x1(i,j) == 0 || x1(i,j) == x1max || x2(i,j) == 0 || x2(i,j) == x2max
            % 获取当前点的颜色索引，基于 x3 的值
            colorIndex = round(64 * (x3(i,j) - min(c)) / (max(c) - min(c))) + 1;
            % 确保索引不越界
            colorIndex = min(max(colorIndex, 1), 64);
            % 绘制从面到 x1x2 平面的连接线
            plot3([x1(i,j), x1(i,j)], [x2(i,j), x2(i,j)], [x3(i,j), 0], ...
                  'Color', cmap(colorIndex, :), 'LineWidth', 1); % 使用映射的颜色
        end
    end
end

% 设置标签
xlabel('x1');
ylabel('x2');
zlabel('x3');
grid on; % 打开网格
view(3); % 设置三维视图角度
hold off;
