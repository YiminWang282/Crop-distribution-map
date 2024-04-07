clc,clearvars
% 导入XLSX文件数据
xlsxFilePath = '/Users/wangyimin/Documents/py-piegraph/Data file23-9-28.xlsx';
data = readtable(xlsxFilePath);

% 提取经度、纬度和类别信息
Longitude = data(:, 3);
Latitude = data(:, 2);
Category = data(:, 4);
uniqueCategories = unique(Category);

% 创建一个新的地图图形窗口
ax = worldmap('china');
setm(ax, 'mapprojection', 'mercator');

% 绘制国界
bordersl = shaperead('/Users/wangyimin/Downloads/Chinamap/bou1_4l.shp', 'UseGeoCoords', true);
geoshow(bordersl, 'Color', [.3, .3, .3], 'LineWidth', 1)

% 绘制省份
colorList = [197, 228, 212; 255, 254, 216; 251, 197, 221; 199, 205, 231] / 255;
colorList = repmat(colorList, [250, 1]);
provinces = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);
colorList = colorList(1:numel(provinces), :);
faceColors = makesymbolspec('Polygon', {'INDEX', [1 numel(provinces)], 'FaceColor', colorList});
geoshow(provinces, 'DisplayType', 'polygon', 'SymbolSpec',faceColors)

% 绘制首都
pnames = shaperead('/Users/wangyimin/Downloads/Chinamap/res1_4m.shp', 'UseGeoCoords', true);
geoshow(pnames(1).Lat, pnames(1).Lon, 'DisplayType', 'point', 'Marker', 'p', 'MarkerEdgeColor', [.8, 0, 0], 'MarkerFaceColor', [.8, 0, 0])

% 为每个 Category 分配一个不同的颜色
colorMap = jet(height(uniqueCategories)); % 使用 jet 色图

% 创建一个图例
legendHandles = []; % 用于存储图例句柄
legendLabels = {}; % 用于存储图例标签

% 绘制散点图，并为每个 Category 使用不同的颜色和标签
for i = 1:height(uniqueCategories)
    currentCategory = uniqueCategories{i, 1};

    % 使用 currentCategory 进行筛选
    currentData = data(strcmp(data.Category, currentCategory), :);

    % 获取当前类别的经度和纬度数据
    currentLongitude = currentData.Longitude;
    currentLatitude = currentData.Latitude;

    % 使用 scatterm 函数绘制当前类别的散点图，并指定颜色
    h=scatterm(currentLatitude, currentLongitude, 10, colorMap(i, :), 'filled');

    % 将散点图句柄和标签添加到图例中
    legendHandles(end+1) = h;
    legendLabels{end+1} = currentCategory; % 确保 currentCategory 是字符串
end

legendLabels = cellstr(num2str(legendHandles'));
% 添加图例
legend(legendHandles, 'Location', 'Southwest'); % 添加图例，并指定位置


% 添加指北针
northarrow('latitude', 50, 'longitude', 80, 'scaleratio', 0.08, 'FaceColor', [.4, .4, .4])

% 小地图
h2 = axes('pos', [0.67 0.15 0.13 0.2]);
worldmap([1 22], [106 122])
setm(h2, 'FFaceColor', [197, 213, 236] / 255, 'FEdgeColor', [.3, .3, .3], 'FLineWidth', 1.5)
insert1 = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4l.shp', 'UseGeoCoords', true);
geoshow(insert1, 'Color', [.2, .2, .2], 'LineWidth', 1)
insert2 = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);
geoshow(insert2, 'FaceColor', 'w')
mlabel off
plabel off
gridm off