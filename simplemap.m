% 导入XLSX文件数据
xlsxFilePath = '/Users/wangyimin/Documents/py-piegraph/stupid data/GEO.xlsx';
data = readtable(xlsxFilePath);

% 创建一个新的地图图形窗口
ax = worldmap('china');
setm(ax, 'mapprojection', 'mercator');

% 给整个图添加标题
%figureTitle = title('Map of crop distribution in China');
%set(figureTitle, 'FontName', 'Times New Roman', 'FontSize', 16); % 设置标题的字体和字号

% 绘制国界
bordersl = shaperead('/Users/wangyimin/Downloads/Chinamap/bou1_4l.shp', 'UseGeoCoords', true);
geoshow(bordersl, 'Color', [.3, .3, .3], 'LineWidth', 1)

%绘制省份
% colorList = [197, 228, 212; 255, 254, 216; 251, 197, 221; 199, 205, 231] / 255;
% colorList = repmat(colorList, [250, 1]);
% provinces = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);
% colorList = colorList(1:numel(provinces), :);
% faceColors = makesymbolspec('Polygon', {'INDEX', [1 numel(provinces)], 'FaceColor', colorList});
% geoshow(provinces, 'DisplayType', 'polygon', 'SymbolSpec',faceColors)

% Define the color you want (baby blue)
babyBlue = [173, 216, 230] / 255; % RGB values for baby blue, scaled to [0, 1]

% Load the shapefile data for provinces or regions (replace with your file path)
provinces = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);

% Create a colormap with just one color (baby blue)
customColorMap = babyBlue;

% Create a symbol specification for all polygons to use the custom color
faceColors = makesymbolspec('Polygon', {'INDEX', [1 numel(provinces)], 'FaceColor', customColorMap});

% Display the map with the custom color
geoshow(provinces, 'DisplayType', 'polygon', 'SymbolSpec', faceColors);

% 添加指北针
northarrow('latitude', 50, 'longitude', 80, 'scaleratio', 0.08, 'FaceColor', [.4, .4, .4])




% 绘制首都
pnames = shaperead('/Users/wangyimin/Downloads/Chinamap/res1_4m.shp', 'UseGeoCoords', true);
geoshow(pnames(1).Lat, pnames(1).Lon, 'DisplayType', 'point', 'Marker', 'p', 'MarkerEdgeColor', [.8, 0, 0], 'MarkerFaceColor', [.8, 0, 0])

% % 为每个 Category 分配一个不同的颜色
% colorMap = jet(height(unique(data.Category))); % 使用 jet 色图
% 
% % 绘制散点图，并为每个 Category 使用不同的颜色和标签
% legendHandles = gobjects(height(unique(data.Category)), 1);
% legendLabels = cell(height(unique(data.Category)), 1);
% tol = unique(data.Category, 'stable');

% for i = 1:height(unique(data.Category))
%     currentCategory = tol{i};
% 
%     % 使用 currentCategory 进行筛选
%     currentData = data(strcmp(data.Category, currentCategory), :);
% 
%     % 获取当前类别的经度和纬度数据
%     currentLongitude = currentData.Longitude;
%     currentLatitude = currentData.Latitude;
% 
%     % 使用 scatterm 函数绘制当前类别的散点图，并指定颜色
%     h = scatterm(currentLatitude, currentLongitude, 10, colorMap(i, :), 'filled');
% 
%     % 将散点图句柄和标签添加到图例中
%     legendHandles(i) = h;
%     legendLabels{i} = currentCategory;
% end



% 获取当前类别的经度和纬度数据
currentLongitude = data.Long;
currentLatitude = data.Lat;

%    使用 scatterm 函数绘制当前类别的散点图，并指定颜色
h=scatterm(currentLatitude, currentLongitude, 10, 'r', 'filled');
legendHandles = h;
% 添加图例
legend(legendHandles,'Sampling sites', 'Location', 'Southwest');

% % 小地图
% h2 = axes('pos', [0.67 0.15 0.13 0.2]);
% worldmap([1 22], [106 122])
% setm(h2, 'FFaceColor', [197, 213, 236] / 255, 'FEdgeColor', [.3, .3, .3], 'FLineWidth', 1.5)
% insert1 = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4l.shp', 'UseGeoCoords', true);
% geoshow(insert1, 'Color', [.2, .2, .2], 'LineWidth', 1)
% insert2 = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);
% geoshow(insert2, 'FaceColor', 'w');
% mlabel off
% plabel off
% gridm off
% % 十个省份的名称和坐标
% provinceNames = {'Beijing', 'Guangdong', 'Hebei', 'Hubei', 'Hunan', 'Liaoning', 'Shandong', 'Shanghai', 'Shanxi', 'Zhejiang'};
% provinceLatitudes = [39.9042, 23.1291, 38.0428, 30.5928, 27.614, 41.8357, 36.7161, 31.2304, 34.2654, 29.8833];
% provinceLongitudes = [116.4074, 113.2644, 114.5149, 114.3054, 111.7088, 122.7536, 119.7634, 121.4737, 108.9542, 121.5503];
% 
% for i = 1:numel(provinceNames)
%     textm(provinceLatitudes(i), provinceLongitudes(i), provinceNames{i}, 'FontSize', 10, 'FontWeight', 'bold', 'Color', 'k');
% end

 % 比例尺
scaleruler on
 setm(handlem('scaleruler1'), ...
    'XLoc',-3.2e6,'YLoc',1.8e6, ...
    'MajorTick',0:500:2000,...
    'MinorTick',0:40:200,'FontSize',7)
scaleruler('units','nm')
setm(handlem('scaleruler2'), ...
    'XLoc',-3.15e6, ...
    'YLoc',1.7e6, ...
    'TickDir','down', ...
    'MajorTick',0:250:1000,...
    'MinorTick',0:40:200,...
    'MajorTickLength',km2nm(25),...
    'MinorTickLength',km2nm(12.5),'FontSize',7)

% Set the desired DPI (for example, 600 DPI)
high_dpi = 600;

% Save the image as a high-DPI PNG file
print('map_image_high_dpi.png', '-dpng', sprintf('-r%d', high_dpi));


close;
