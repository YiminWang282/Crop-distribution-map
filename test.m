% %exanple problem1
% clc,clearvars,close all
% 
% 
% x = linspace(-10,10);
% y1= (-(x-3).^2)+10;
% y2= (-(x-3).^2)+15;
% y3= (-(x-5).^2)+10;
% 
% figure(1)
% subplot(1,3,1)
% plot(x,y1,'rd')
% xlabel('x'),ylabel('y'),title('Y vs. X -problem A')
% grid on
% legend('Y1')
% 
% hold on
% 
% subplot(1,3,2)
% plot(x,y2,'bv')
% xlabel('x'),ylabel('y'),title('Y vs. X -problem A')
% legend('Y2')
% grid on
% hold on
% subplot(1,3,3)
% plot(x,y3,'g+')
% xlabel('x'),ylabel('y'),title('Y vs. X -problem A')
% grid on
% legend('Y3')







% %example2
% %parameters
% x= linspace(0,10,1000000);
% y= sin(x);
% y_check=0;
% 
% %action
% plot(x,y,'.'),hold on
% plot([0,10],[y_check y_check],'-r')
% y_greater=y >y_check;
% 
% %output
% FinalPercent = sum(y_greater) / length(y)*100
% 
% 





% %example3
% clc,clearvars
% A= randi(5,1,10) 
% num3=sum(A==3)
% if num3 >=3
%     disp('wow!')
% end




%example4
% tic
% clc,clearvars
% A= randi(5,1,10)
% num3=0;
% for i =1:length(A)
%     if A(i)==3
%         num3=num3+1;
%     end
% end 
% toc


%example5
% z=75;
% reduce_z(z)


% % 创建一个地图对象
% figure;
% worldmap; % 打开一个世界地图
% 
% % 准备经纬度坐标数据和标签
% latitude = [48.8566, 51.5072, 40.7128, -34.6118]; % 纬度数据
% longitude = [2.3522, -0.1276, -74.0060, -58.4173]; % 经度数据
% labels = {'Paris', 'London', 'New York', 'Buenos Aires'}; % 标签数据
% 
% % 为每个点指定不同的颜色
% colors = rand(length(latitude), 3); % 随机生成颜色
% 
% % 绘制散点图
% for i = 1:length(latitude)
%     scatterm(latitude(i), longitude(i), 100, colors(i, :), 'filled'); % 使用不同的颜色
% end
% 
% % 添加图例
% h = zeros(length(latitude), 1); % 用于存储图例句柄
% for i = 1:length(latitude)
%     h(i) = scatterm(latitude(i), longitude(i), 100, colors(i, :), 'filled'); % 使用不同的颜色
% end
% legend(h, labels);
% 
% % 自定义图例位置
% setm(gca, 'FFaceColor', [0.9, 0.9, 0.9]); % 背景色
% setm(gca, 'FEdgeColor', [0, 0, 0]); % 边界颜色
% 
% % 自定义地图属性（可选）
% framem on; % 打开网格线
% gridm on; % 打开刻度线



% ax=worldmap('china');
% setm(ax,'mapprojection','mercator');
% % 定义XLSX文件路径
% xlsxFilePath = '/Users/wangyimin/Documents/py-piegraph/stupid data/Data file23-9-28.xlsx';
% data = readtable(xlsxFilePath);
% Longitude=data(:,3);
% Latitude=data(:,2);
% Category=data(:,4);
% uniquecategories=unique(Category);
% % 绘制国界
% bordersl=shaperead('/Users/wangyimin/Downloads/Chinamap/bou1_4l.shp','UseGeoCoords',true);
% geoshow(bordersl,'Color',[.3,.3,.3],'LineWidth',1)
% % 绘制省份
% colorList=[197,228,212;255,254,216;251,197,221;199,205,231]./255;
% colorList=repmat(colorList,[250,1]);
% provinces=shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp','UseGeoCoords',true);
% colorList=colorList(1:numel(provinces),:);
% faceColors=makesymbolspec('Polygon',{'INDEX',[1 numel(provinces)],'FaceColor',colorList});
% geoshow(provinces,'DisplayType','polygon','SymbolSpec',faceColors)
% 
% % 首都
% pnames=shaperead('/Users/wangyimin/Downloads/Chinamap/res1_4m.shp','UseGeoCoords',true);
% geoshow(pnames(1).Lat,pnames(1).Lon,'DisplayType','point','Marker','p',...
%     'MarkerEdgeColor',[.8,0,0],'MarkerFaceColor',[.8,0,0])
% 
% % 指北针
% northarrow('latitude',50,'longitude',80,'scaleratio',.08,'FaceColor',[.4,.4,.4])
% 
% 
% 
% %ax = axesm('MapProjection', 'mercator'); % 使用墨卡托投影
% 
% % 遍历每个类别，并绘制散点图
% for i = 1:length(uniquecategories)
%     currentCategory = uniquecategories(i);
% 
%     % 获取当前类别的经度和纬度
%     currentLongitude = longitude(category == currentCategory);
%     currentLatitude = latitude(category == currentCategory);
% 
%     % 使用scatterm函数绘制当前类别的散点图
%     scatterm(currentLatitude, currentLongitude, 30, 'filled');
%     hold on;
% end
% 
% %  % 比例尺
% % scaleruler on
% %  setm(handlem('scaleruler1'), ...
% %     'XLoc',-3.2e6,'YLoc',1.8e6, ...
% %     'MajorTick',0:500:2000,...
% %     'MinorTick',0:40:200,'FontSize',7)
% % scaleruler('units','nm')
% % setm(handlem('scaleruler2'), ...
% %     'XLoc',-3.15e6, ...
% %     'YLoc',1.7e6, ...
% %     'TickDir','down', ...
% %     'MajorTick',0:250:1000,...
% %     'MinorTick',0:40:200,...
% %     'MajorTickLength',km2nm(25),...
% %     'MinorTickLength',km2nm(12.5),'FontSize',7)
% 
% % 小地图
% h2=axes('pos',[0.67 0.15 0.13 0.2]);
% worldmap([1 22],[106 122])
% setm(h2,'FFaceColor',[197,213,236]./255,'FEdgeColor',[.3,.3,.3],'FLineWidth',1.5)
% insert1=shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4l.shp','UseGeoCoords',true);
% geoshow(insert1,'Color',[.2,.2,.2],'LineWidth',1)
% insert2=shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp','UseGeoCoords',true);
% geoshow(insert2,'FaceColor','w')
% mlabel off 
% plabel off
% gridm off



% 
% clc,clearvars
% % 导入XLSX文件数据
% xlsxFilePath = '/Users/wangyimin/Documents/py-piegraph/stupid data/Data file23-9-28.xlsx';
% data = readtable(xlsxFilePath);
% 
% % 提取经度、纬度和类别信息
% % Longitude = data(:, 3);
% % Latitude = data(:, 2);
% Category = data(:, 4);
% uniqueCategories = unique(Category);
% 
% % 创建一个新的地图图形窗口
% ax = worldmap('china');
% setm(ax, 'mapprojection', 'mercator');
% 
% % 绘制国界
% bordersl = shaperead('/Users/wangyimin/Downloads/Chinamap/bou1_4l.shp', 'UseGeoCoords', true);
% geoshow(bordersl, 'Color', [.3, .3, .3], 'LineWidth', 1)
% 
% % 绘制省份
% colorList = [197, 228, 212; 255, 254, 216; 251, 197, 221; 199, 205, 231] / 255;
% colorList = repmat(colorList, [250, 1]);
% provinces = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);
% colorList = colorList(1:numel(provinces), :);
% faceColors = makesymbolspec('Polygon', {'INDEX', [1 numel(provinces)], 'FaceColor', colorList});
% geoshow(provinces, 'DisplayType', 'polygon', 'SymbolSpec',faceColors)
% 
% % 绘制首都
% pnames = shaperead('/Users/wangyimin/Downloads/Chinamap/res1_4m.shp', 'UseGeoCoords', true);
% geoshow(pnames(1).Lat, pnames(1).Lon, 'DisplayType', 'point', 'Marker', 'p', 'MarkerEdgeColor', [.8, 0, 0], 'MarkerFaceColor', [.8, 0, 0])
% 
% % 为每个 Category 分配一个不同的颜色
% colorMap = jet(height(uniqueCategories)); % 使用 jet 色图
% 
% % 创建一个图例
% legendHandles = []; % 用于存储图例句柄
% legendLabels = {}; % 用于存储图例标签
% 
% % 绘制散点图，并为每个 Category 使用不同的颜色和标签
% for i = 1:height(uniqueCategories)
%     currentCategory = uniqueCategories{i, 1};
% 
%     % 使用 currentCategory 进行筛选
%     currentData = data(strcmp(data.Category, currentCategory), :);
% 
%     % 获取当前类别的经度和纬度数据
%     currentLongitude = currentData.Longitude;
%     currentLatitude = currentData.Latitude;
% 
%     % 使用 scatterm 函数绘制当前类别的散点图，并指定颜色
%     h=scatterm(currentLatitude, currentLongitude, 10, colorMap(i, :), 'filled');
% 
%     % 将散点图句柄和标签添加到图例中
%     legendHandles(end+1) = h;
%     legendLabels{end+1} = currentCategory; % 确保 currentCategory 是字符串
% end
% 
% legendLabels = cellstr(num2str(legendHandles'));
% % 添加图例
% legend(legendHandles, 'Location', 'Southwest'); % 添加图例，并指定位置
% 
% 
% % 添加指北针
% northarrow('latitude', 50, 'longitude', 80, 'scaleratio', 0.08, 'FaceColor', [.4, .4, .4])
% 
% % 小地图
% h2 = axes('pos', [0.67 0.15 0.13 0.2]);
% worldmap([1 22], [106 122])
% setm(h2, 'FFaceColor', [197, 213, 236] / 255, 'FEdgeColor', [.3, .3, .3], 'FLineWidth', 1.5)
% insert1 = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4l.shp', 'UseGeoCoords', true);
% geoshow(insert1, 'Color', [.2, .2, .2], 'LineWidth', 1)
% insert2 = shaperead('/Users/wangyimin/Downloads/Chinamap/bou2_4p.shp', 'UseGeoCoords', true);
% geoshow(insert2, 'FaceColor', 'w')
% mlabel off
% plabel off
% gridm off








